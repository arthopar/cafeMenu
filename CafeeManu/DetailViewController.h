//
//  DetailViewController.h
//  CafeeManu
//
//  Created by Artak on 7/29/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblCalories;
@property (weak, nonatomic) IBOutlet UILabel *lblMinutes;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imgCalories;
@property (weak, nonatomic) IBOutlet UIImageView *imgMinutes;
@property (weak, nonatomic) IBOutlet UIImageView *imgProductLarg;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnEntree;
@property (weak, nonatomic) IBOutlet UIButton *btnFeedback;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewProducts;

@property (strong, nonatomic) NSMutableArray *productList;

- (IBAction)backBtnClicked:(id)sender;
- (IBAction)addProductAction:(UIButton *)sender;

@end
