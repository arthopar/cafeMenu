//
//  LanguagesViewController.m
//  CafeeManu
//
//  Created by Tigran on 8/2/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "LanguagesViewController.h"
#import "LanguageViewCell.h"

@interface LanguagesViewController ()

@end

@implementation LanguagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) getLanguages
{
    _languages = [[NSMutableArray alloc] init];
    
    CommonDto *languageCellData = [[CommonDto alloc] init];
    languageCellData.imagePath = @"am";
    languageCellData.name = @"Հայերեն";
    [_languages addObject:languageCellData];
    
    languageCellData = [[CommonDto alloc] init];
    languageCellData.imagePath = @"ru";
    languageCellData.name = @"Русский";
    [_languages addObject:languageCellData];
    
    languageCellData = [[CommonDto alloc] init];
    languageCellData.imagePath = @"en";
    languageCellData.name = @"English";
    [_languages addObject:languageCellData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getLanguages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"LanguageViewCell";
    
    LanguageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LanguageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell updateWithDto:[_languages objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_languages count];
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

@end
