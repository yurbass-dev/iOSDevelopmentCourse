//
//  YCObject.m
//  ParametersTest
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCObject.h"

@implementation YCObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"object is created");
    }
    return self;
}

-(void) dealloc
{
    NSLog(@"object is deallocated");
}

-(id) copyWithZone:(NSZone *)zone
{
    return [[YCObject alloc] init];
}

@end
