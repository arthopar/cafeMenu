//
//  ProductDto.h
//  CafeeManu
//
//  Created by Artak on 10/22/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductDto : NSObject

@property (strong, nonatomic) NSString *_id;
@property (strong, nonatomic) NSString *categoryId;
@property (strong, nonatomic) NSString *imagePath;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger price;
@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger calories;
@property (nonatomic) NSString *descyption;
@property (nonatomic) double raiting;

@end
