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
#import "DetailViewController.h"



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
    
    for (int i = 0; i < 20; ++i) {
        ProductDto *productCellData = [[ProductDto alloc] init];
        productCellData.imagePath = @"entree.png";
        productCellData.name = @"Entree";
        [_productList addObject:productCellData];
    
        productCellData = [[ProductDto alloc] init];
        productCellData.imagePath = @"sushi.png";
        productCellData.name = @"Sushi";
        [_productList addObject:productCellData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@""])
    {
        
    }
}
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
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    [self presentViewController:nav animated:YES completion:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(240, 240);
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_productList count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClicked:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
