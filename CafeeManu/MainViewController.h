//
//  MainViewController.h
//  CafeeManu
//
//  Created by Tigran on 7/28/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnLanguage;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (weak, nonatomic) IBOutlet UIButton *btnFeedback;
@property (weak, nonatomic) IBOutlet UIButton *btnInformation;

@property (weak, nonatomic) IBOutlet UILabel *lableInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelFeedback;
@property (weak, nonatomic) IBOutlet UILabel *labelLanguage;

@end
