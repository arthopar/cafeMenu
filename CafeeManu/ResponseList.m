//
//  ResponseList.m
//  CafeeManu
//
//  Created by Artak on 10/20/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "ResponseList.h"

@implementation ResponseList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
