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
    [self getCategories];
}

-(void) getCategories
{
    _categoryList = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; ++i) {
        CommonDto *productCellData = [[CommonDto alloc] init];
        productCellData.imagePath = @"entree.png";
        productCellData.name = @"Entree";
        [_categoryList addObject:productCellData];
    
        productCellData = [[CommonDto alloc] init];
        productCellData.imagePath = @"sushi.png";
        productCellData.name = @"Sushi";
        [_categoryList addObject:productCellData];
    }
}

// TODO Uncomment when the server will be available
//-(void) getCategories
//{
//    _categoryList = [[NSMutableArray alloc] init];
//    
//    [ServerInterface requestWithData:@"Category" parameters:nil success:^(id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        if ([responseObject isKindOfClass:[NSArray class]]) {
//            NSArray *responseArray = responseObject;
//            for (NSDictionary *currenCategory in responseArray) {
//                CategoryDto *currentCellData = [[CategoryDto alloc] init];
//                currentCellData.imagePath = [currenCategory valueForKey:@"imagePath"];
//                currentCellData.imagePath = [SERVERROOT stringByAppendingString:currentCellData.imagePath];
//                currentCellData.name = [currenCategory valueForKey:@"name"];
//                [_categoryList addObject:currentCellData];
//            }
//            [_collectionView reloadData];
//        } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            //NSDictionary *responseDict = responseObject;
//            /* do something with responseDict */
//        }
//    } failure:^(NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//}

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
    
    CommonDto *currentProductItem = _categoryList[indexPath.row];
    
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
    [self presentViewController:detailViewController animated:YES completion:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(240, 240);
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
