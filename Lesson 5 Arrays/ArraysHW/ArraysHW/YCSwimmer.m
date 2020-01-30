//
//  YCSwimmer.m
//  ArraysHW
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCSwimmer.h"

@implementation YCSwimmer

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
    NSLog(@"Swimmer is swimming!");
}

@end
