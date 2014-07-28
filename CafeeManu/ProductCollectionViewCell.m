//
//  CategoryCollectionViewCell.m
//  Menu
//
//  Created by Artak on 7/9/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "ProductCollectionViewCell.h"

@implementation ProductCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        [self setBackgroundColor: [UIColor redColor]];
    }
    return self;
}

@end
