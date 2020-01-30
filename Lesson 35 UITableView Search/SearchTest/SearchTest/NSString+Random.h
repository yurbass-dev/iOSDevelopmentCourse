//
//  NSString+Random.h
//  SearchTest
//
//  Created by Yuriy on 28.06.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Random)

+ (NSString *)randomAlphanumericString;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

@end

NS_ASSUME_NONNULL_END
