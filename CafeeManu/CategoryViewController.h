//
//  CategoryViewController.h
//  CafeeManu
//
//  Created by Edvard on 7/28/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *categoryList;

- (IBAction)backBtnClicked:(id)sender;

@end
