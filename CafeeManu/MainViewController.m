//
//  MainViewController.m
//  CafeeManu
//
//  Created by Tigran on 7/28/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "MainViewController.h"
#import "Localization.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    // Round buttons
    CALayer * l = [_btnMenu layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:75.0];
    [l setBorderWidth:2.0];
    
    l = [_btnInformation layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:50.0];
    [l setBorderWidth:2.0];
    
    l = [_btnLanguage layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:50.0];
    [l setBorderWidth:2.0];

    l = [_btnFeedback layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:50.0];
    [l setBorderWidth:2.0];

}

- (void) viewWillAppear:(BOOL)animated
{
    [self setLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setLabels
{
    _labelLanguage.text = [Localization languageSelectedStringForKey:@"XcN-Fg-dDM.text"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
