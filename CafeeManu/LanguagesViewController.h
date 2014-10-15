//
//  LanguagesViewController.h
//  CafeeManu
//
//  Created by Tigran on 8/2/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Localizable <NSObject>

- (void) updateLocalizableTexts;

@end

@interface LanguagesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewLanguage;

@property (strong, nonatomic) NSMutableArray *languages;

@end
