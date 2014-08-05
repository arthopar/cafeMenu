//
//  Localization.m
//  CafeeManu
//
//  Created by Artak on 8/5/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import "Localization.h"

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
    }
}

+(NSString*) languageSelectedStringForKey:(NSString*) key
{
    
	NSString *path;
	if(selectedLanguage == ENGLISH_LANGUAGE)
		path = [[NSBundle mainBundle] pathForResource:@"English" ofType:@"lproj"];
	else if(selectedLanguage == ARMENIAN_LANGUAGE)
		path = [[NSBundle mainBundle] pathForResource:@"hy" ofType:@"lproj"];
	else if(selectedLanguage == RUSSIAN_LANGUAGE)
		path = [[NSBundle mainBundle] pathForResource:@"ru" ofType:@"lproj"];
	
	NSBundle* languageBundle = [NSBundle bundleWithPath:path];
	NSString* str=[languageBundle localizedStringForKey:key value:@"" table:nil];
	return str;
}

+(NSDictionary*) getLanguageList
{
    return @{@(ARMENIAN_LANGUAGE):@"HAYEREN", @(ENGLISH_LANGUAGE):@"ENGLISH", @(RUSSIAN_LANGUAGE):@"RUSSKI"};
}

@end
