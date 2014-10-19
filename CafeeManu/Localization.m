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
	NSString *lang;
	if(selectedLanguage == ENGLISH_LANGUAGE)
		lang = @"en";
	else if(selectedLanguage == ARMENIAN_LANGUAGE)
		lang = @"hy";
	else if(selectedLanguage == RUSSIAN_LANGUAGE)
		lang = @"ru";
	
    NSBundle *languageResourcesBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"]];
    NSString* str= NSLocalizedStringFromTableInBundle(key, @"localization", languageResourcesBundle, nil);
	return str;
}

+(NSDictionary*) getLanguageList
{
    return @{@(ARMENIAN_LANGUAGE):@"Հայերեն", @(ENGLISH_LANGUAGE):@"English", @(RUSSIAN_LANGUAGE):@"Русский"};
}

@end
