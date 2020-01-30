//
//  NSString+Random.m
//  SearchTest
//
//  Created by Yuriy on 28.06.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomAlphanumericString {

    NSUInteger randomLength = arc4random_uniform(11) + 5;
    
    return [[self randomAlphanumericStringWithLength:randomLength] capitalizedString];
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length {
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz"; //ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform((uint32_t)letters.length)]];
    }
    
    return randomString;
}

@end
