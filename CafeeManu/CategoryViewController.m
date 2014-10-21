//
//  CategoryViewController.m
//  CafeeManu
//
//  Created by Edvard on 7/28/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "CategoryViewController.h"
#import "CommonDto.h"
#import "CategoryCollectionViewCell.h"
#import "DetailViewController.h"
#import "ServerInterface.h"
#import "Constants.h"
#import "ResponseList.h"
#import "CategoryDto.h"
#import "UIImageView+WebCache.h"

@implementation CategoryViewController

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
    [ServerInterface getCategoryListForCallback:^(ResponseList* data) {
        [weak_self requestFinishedWithData:data];
    }];
}

-(void) requestFinishedWithData:(ResponseList*)data
{
    if (data.isSuccess) {
        _categoryList = data.dataList;
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
    
    CategoryDto *currentCategoryDto = _categoryList[indexPath.row];

    NSURL *url = [NSURL URLWithString:currentCategoryDto.imagePath];
    [cell.imageView sd_setImageWithURL: url];
    [cell.nameLbl setText:currentCategoryDto.name];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailViewController.productList = _categoryList;
    
    [self presentViewController:detailViewController animated:YES completion:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(220, 220);
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_categoryList count];
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
