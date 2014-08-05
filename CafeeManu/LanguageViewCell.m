//
//  LanguageViewCell.m
//  CafeeManu
//
//  Created by Tigran on 8/5/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "LanguageViewCell.h"

@implementation LanguageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithDto:(CommonDto*) dto
{
    [_imageViewFlag setImage:[UIImage imageNamed:dto.imagePath]];
    [_labelTitle setText:dto.name];

}

@end
