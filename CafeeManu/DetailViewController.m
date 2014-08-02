//
//  DetailViewController.m
//  CafeeManu
//
//  Created by Artak on 7/29/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "DetailViewController.h"
#import "ProductDto.h"
#import "ProductCollectionViewCell.h"
#import "ProductsViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    _productList = ((ProductsViewController*)[self presentingViewController]).productList;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCollectionViewCell *cell = (ProductCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"ProductsCollectionViewCell" forIndexPath:indexPath];
    
    ProductDto *currentProductItem = _productList[indexPath.row];
    
    //  NSURL *imageUrl = [NSURL URLWithString: currentCategoryItem.imagePath];
    //	NSURL *imageUrl = [NSURL URLWithString: currentCategoryItem.imagePath];
    //  [cell.imageView sd_setImageWithURL:imageUrl];
    //    [cell.imageView setImage:[UIImage imageNamed:currentProductItem.imagePath]];
    [cell.imageView setImage:[UIImage imageNamed:@"harisa"]];
    
    [cell.nameLbl setText:currentProductItem.name];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(_collectionViewProducts.frame) / 3, CGRectGetHeight(_collectionViewProducts.frame));
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_productList count];
}

- (IBAction)backBtnClicked:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
