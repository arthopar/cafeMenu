//
//  ResponseList.h
//  CafeeManu
//
//  Created by Artak on 10/20/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseList : NSObject

@property (strong, nonatomic) NSMutableArray *dataList;
@property (strong, nonatomic) NSString *errorMessage;
@property (nonatomic) BOOL isSuccess;

@end
