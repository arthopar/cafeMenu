//
//  MainViewController.m
//  CafeeManu
//
//  Created by Tigran on 7/28/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "MainViewController.h"
#import "Localization.h"
#import "LanguagesViewController.h"

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
    [self setLocalizedTexts];
}

- (void) updateLocalizableTexts
{
    [self setLocalizedTexts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setLocalizedTexts
{
    _labelLanguage.text = [Localization languageSelectedStringForKey:@"language"];
    _labelFeedback.text = [Localization languageSelectedStringForKey:@"feedback"];
    _lableInfo.text = [Localization languageSelectedStringForKey:@"info"];
    [_btnMenu setTitle:[Localization languageSelectedStringForKey:@"menu"] forState:UIControlStateNormal];
}


- (IBAction)openLanguageAtion:(UIButton *)sender {
    LanguagesViewController *languageViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"LanguagesViewController"];
    _popoverLanguage = [[UIPopoverController alloc] initWithContentViewController:languageViewController];
    [_popoverLanguage setPopoverContentSize:CGSizeMake(270, 270) animated:YES];
    [_popoverLanguage presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}
@end
