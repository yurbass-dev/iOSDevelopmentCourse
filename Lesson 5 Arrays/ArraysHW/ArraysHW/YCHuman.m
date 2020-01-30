//
//  YCHuman.m
//  ArraysHW
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCHuman.h"

@implementation YCHuman

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
    NSLog(@"Human is moving!");
}

-(NSString *) description
{
    return [NSString stringWithFormat: @"Human: name = %@, gender = %@, height = %g, weight = %g\n",
            self.name, self.gender, self.height, self.weight];
}

@end
