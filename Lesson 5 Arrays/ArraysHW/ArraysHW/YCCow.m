//
//  YCCow.m
//  ArraysHW
//
//  Created by Yuriy on 22.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCCow.h"

@implementation YCCow

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nickname = @"SomeNickname";
        self.says = @"Rrrr";
        self.legs = 4;
        self.age = 3.5f;
        
    }
    return self;
}

-(void) move
{
    NSLog(@"Cow is grazing");
}

@end
