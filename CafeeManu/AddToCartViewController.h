//
//  AddToCartViewController.h
//  CafeeManu
//
//  Created by Artak on 8/10/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToCartViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageViewProduct;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelCount;
@property (weak, nonatomic) IBOutlet UILabel *labelNoties;
@property (weak, nonatomic) IBOutlet UIStepper *steperCount;
@property (weak, nonatomic) IBOutlet UITextView *textFieldNoties;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;


- (IBAction)cancelAction:(UIButton *)sender;
- (IBAction)addAction:(UIButton *)sender;
@end
