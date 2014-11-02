//
//  CategoryDto.h
//  CafeeManu
//
//  Created by Artak on 10/20/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryDto : NSObject

@property (nonatomic) NSInteger _id;
@property (strong, nonatomic) NSString *imagePath;
@property (strong, nonatomic) NSString *name;

@end
