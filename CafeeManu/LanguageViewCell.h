//
//  LanguageViewCell.h
//  CafeeManu
//
//  Created by Tigran on 8/5/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDto.h"

@interface LanguageViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewFlag;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

- (void)updateWithDto:(CommonDto*) dto;

@end
