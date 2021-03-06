//
//  Localization.h
//  CafeeManu
//
//  Created by Artak on 8/5/14.
//  Copyright (c) 2014 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

enum
{
    ARMENIAN_LANGUAGE = 0,
    RUSSIAN_LANGUAGE = 1,
    ENGLISH_LANGUAGE = 2,
    
} Language;

@interface Localization : NSObject

+ (int) selectedLanguage;
+ (void) setSelectedLanguage:(int)val;

+(NSDictionary*) getLanguageList;
+(NSString*) languageSelectedStringForKey:(NSString*) key;

@end
