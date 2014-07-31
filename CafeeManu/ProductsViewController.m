//
//  CategoryViewController.m
//  CafeeManu
//
//  Created by Edvard on 7/28/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductDto.h"
#import "ProductCollectionViewCell.h"

@interface ProductsViewController ()
{
    NSMutableArray *_productList;
}

@end

@implementation ProductsViewController

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
    [self getCategories];
}

-(void) getCategories
{
    _productList = [[NSMutableArray alloc] init];
    
    ProductDto *productCellData = [[ProductDto alloc] init];
    productCellData.imagePath = @"entree.png";
    productCellData.name = @"Entree";
    [_productList addObject:productCellData];
    
    productCellData = [[ProductDto alloc] init];
    productCellData.imagePath = @"sushi.png";
    productCellData.name = @"Sushi";
    [_productList addObject:productCellData];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCollectionViewCell *cell = (ProductCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"ProductsCollectionViewCell" forIndexPath:indexPath];
    
    ProductDto *currentProductItem = _productList[indexPath.row];
    
    //  NSURL *imageUrl = [NSURL URLWithString: currentCategoryItem.imagePath];
    //	NSURL *imageUrl = [NSURL URLWithString: currentCategoryItem.imagePath];
    //  [cell.imageView sd_setImageWithURL:imageUrl];
    [cell.imageView setImage:[UIImage imageNamed:currentProductItem.imagePath]];
    [cell.nameLbl setText:currentProductItem.name];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(160, 160);
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_productList count];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
