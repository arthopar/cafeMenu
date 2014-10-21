//
//  ServerInterface.m
//  Menu
//
//  Created by Edvard on 7/12/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "ServerInterface.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFURLResponseSerialization.h"

#import "Constants.h"
#import "CategoryDto.h"
#import "ResponseList.h"


@implementation ServerInterface

static NSString *PRODUCT = @"Product";
static NSString *CATEGORY = @"Category";

+(void)requestWithData:(NSString*)data
                        parameters:(id)parameters
                        success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [manager GET:[SERVERROOT stringByAppendingString:data] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, id responseObject) {
        failure(responseObject);
    }];
}

+(void) getCategoryListForCallback:(void (^)(ResponseList*))callback
{
    [ServerInterface requestWithData:CATEGORY parameters:nil success:^(id responseObject) {
        
        ResponseList *responseList = [[ResponseList alloc] init];

        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            for (NSDictionary *currenCategory in responseArray) {
                CategoryDto *categoryDto = [[CategoryDto alloc] init];
                categoryDto.imagePath = [currenCategory valueForKey:@"imagePath"];//TODO [SERVERROOT stringByAppendingString:[currenCategory valueForKey:@"imagePath"]];
                categoryDto.name = [currenCategory valueForKey:@"name"];
                [responseList.dataList addObject:categoryDto];
            }
            responseList.isSuccess = YES;
        }
        callback(responseList);
    } failure:^(NSError *error) {
        ResponseList *responseList = [[ResponseList alloc] init];
        responseList.isSuccess = NO;
        responseList.errorMessage =  [error description];
        callback(responseList);
    }];
}
@end
