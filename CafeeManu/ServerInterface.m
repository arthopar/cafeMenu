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
#import "ProductDto.h"
#import "ResponseList.h"


@implementation ServerInterface

static NSString *PRODUCT = @"Product";
static NSString *CATEGORY = @"Category";

static NSString *IMAGE_PATH = @"imagePath";
static NSString *NAME = @"name";
static NSString *ID = @"id";
static NSString *CATEGORY_ID = @"categoryId";
static NSString *PRODUCT_ID = @"productId";
static NSString *DESCRYPTION = @"description";
static NSString *RAITING = @"raiting";
static NSString *MINUTES = @"minutes";
static NSString *CALORRIES = @"calories";
static NSString *PRICE = @"price";

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
                categoryDto.imagePath = [currenCategory valueForKey:IMAGE_PATH];//TODO [SERVERROOT stringByAppendingString:[currenCategory valueForKey:@"imagePath"]];
                categoryDto.name = [currenCategory valueForKey:NAME];
                categoryDto._id = [[currenCategory valueForKey:ID] integerValue];
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

+(void) getProductListForCallback:(void (^)(ResponseList*))callback
{
    [ServerInterface requestWithData:PRODUCT parameters:nil success:^(id responseObject) {
        
        ResponseList *responseList = [[ResponseList alloc] init];
        
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            for (NSDictionary *currenCategory in responseArray) {
                ProductDto *productDto = [[ProductDto alloc] init];
                productDto.imagePath = [currenCategory valueForKey:IMAGE_PATH];//TODO [SERVERROOT stringByAppendingString:[currenCategory valueForKey:@"imagePath"]];
                productDto._id = [currenCategory valueForKey:PRODUCT_ID];
                productDto.categoryId = [currenCategory valueForKey:CATEGORY_ID];
                productDto.name = [currenCategory valueForKey:NAME];
                productDto.calories = [[currenCategory valueForKey:CALORRIES] integerValue];
                productDto.minutes = [[currenCategory valueForKey:MINUTES] integerValue];
                productDto.price = [[currenCategory valueForKey:PRICE] integerValue];
                productDto.descyption = [currenCategory valueForKey:DESCRYPTION];
                productDto.raiting = [[currenCategory valueForKey:RAITING] doubleValue];
                
                [responseList.dataList addObject:productDto];
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
