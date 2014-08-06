//
//  Localization.m
//  CafeeManu
//
//  Created by Artak on 8/5/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "Localization.h"
#import "Constants.h"

@implementation Localization

static int selectedLanguage;

+ (int) selectedLanguage
{
     @synchronized(self) {
         return selectedLanguage;
     }
}

+ (void) setSelectedLanguage:(int)val
{
    @synchronized(self) {
        selectedLanguage = val;
        NSUserDefaults* userDef = [NSUserDefaults standardUserDefaults];
        [userDef setInteger:val forKey:LANGUAGEKEY];
        [userDef synchronize];
    }
}

+(NSString*) languageSelectedStringForKey:(NSString*) key
{
    
	NSString *path;
	if(selectedLanguage == ENGLISH_LANGUAGE)
		path = [[NSBundle mainBundle] pathForResource:@"English" ofType:@"lproj"];
	else if(selectedLanguage == ARMENIAN_LANGUAGE)
		path = [[NSBundle mainBundle] pathForResource:[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0]  ofType:@"lproj"];
	else if(selectedLanguage == RUSSIAN_LANGUAGE)
		path = [[NSBundle mainBundle] pathForResource:@"ru" ofType:@"lproj"];
	
	NSBundle* languageBundle = [NSBundle bundleWithPath:path];
    [languageBundle load];
	NSString* str=[languageBundle localizedStringForKey:key value:@"" table:nil];
	return str;
}

+(NSDictionary*) getLanguageList
{
    return @{@(ARMENIAN_LANGUAGE):@"Հայերեն", @(ENGLISH_LANGUAGE):@"English", @(RUSSIAN_LANGUAGE):@"Русский"};
}

@end
