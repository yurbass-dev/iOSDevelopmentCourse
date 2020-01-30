//
//  YCBicycler.m
//  ArraysHW
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCBicycler.h"

@implementation YCBicycler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"SomeName";
        self.gender = @"male";
        self.height = 1.78f;
        self.weight = 75.f;
    }
    return self;
}

-(void) move
{
    NSLog(@"Bicycler is driving!");
}

@end
