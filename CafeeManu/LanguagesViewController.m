//
//  LanguagesViewController.m
//  CafeeManu
//
//  Created by Tigran on 8/2/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "LanguagesViewController.h"
#import "LanguageViewCell.h"
#import "Localization.h"

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
    NSDictionary *lang = [Localization getLanguageList];
    _languages = [[NSMutableArray alloc] init];
    
    CommonDto *languageCellData = [[CommonDto alloc] init];
    languageCellData.imagePath = @"am";
    languageCellData.name = [lang objectForKey:@(ARMENIAN_LANGUAGE)];
    [_languages addObject:languageCellData];
    
    languageCellData = [[CommonDto alloc] init];
    languageCellData.imagePath = @"ru";
    languageCellData.name = [lang objectForKey:@(RUSSIAN_LANGUAGE)];
    [_languages addObject:languageCellData];
    
    languageCellData = [[CommonDto alloc] init];
    languageCellData.imagePath = @"en";
    languageCellData.name = [lang objectForKey:@(ENGLISH_LANGUAGE)];
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

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_languages count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Localization setSelectedLanguage:indexPath.row];
    if ([self.presentingViewController conformsToProtocol:@protocol(Localizable) ]) {
        [(UIViewController <Localizable> *)self.presentingViewController updateLocalizableTexts];
    }
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
};


@end
