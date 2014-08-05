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
    ENGLISH_LANGUAGE = 1,
    RUSSIAN_LANGUAGE = 2,
    
} Language;

@interface Localization : NSObject

+ (int) selectedLanguage;
+ (void) setSelectedLanguage:(int)val;

+(NSDictionary*) getLanguageList;
@end
