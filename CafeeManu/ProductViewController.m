//
//  ProductViewController.m
//  CafeeManu
//
//  Created by Artak on 10/22/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "ProductViewController.h"
#import "CommonDto.h"
#import "CategoryCollectionViewCell.h"
#import "DetailViewController.h"
#import "ServerInterface.h"
#import "Constants.h"
#import "ResponseList.h"
#import "ProductDto.h"
#import "UIImageView+WebCache.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

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
    
    __weak id weak_self = self;
    [ServerInterface getProductListForCallback:^(ResponseList* data) {
        [weak_self requestFinishedWithData:data];
    }];
}

-(void) requestFinishedWithData:(ResponseList*)data
{
    if (data.isSuccess) {
        _productList = data.dataList;
        [_collectionView reloadData];
    } else {
        //TODO error message
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
    CategoryCollectionViewCell *cell = (CategoryCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    
    ProductDto *currentProductDto= _productList[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:currentProductDto.imagePath];
    [cell.imageView sd_setImageWithURL: url];
    [cell.nameLbl setText:currentProductDto.name];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailViewController.productList = _productList;
    
    [self presentViewController:detailViewController animated:YES completion:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(220, 220);
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
