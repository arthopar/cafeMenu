//
//  ProductViewController.h
//  CafeeManu
//
//  Created by Artak on 10/22/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *productList;

- (IBAction)backBtnClicked:(id)sender;

@end
