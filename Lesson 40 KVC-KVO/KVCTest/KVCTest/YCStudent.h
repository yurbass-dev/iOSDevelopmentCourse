//
//  YCStudent.h
//  KVCTest
//
//  Created by Yuriy on 9/24/19.
//  Copyright © 2019 Yuriy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCStudent : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

- (void)changeName;

@end

NS_ASSUME_NONNULL_END
