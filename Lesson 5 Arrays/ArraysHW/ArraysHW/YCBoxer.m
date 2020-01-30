//
//  YCBoxer.m
//  ArraysHW
//
//  Created by Yuriy on 20.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCBoxer.h"

@implementation YCBoxer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"SomeName";
        self.gender = @"male";
        self.height = 1.78f;
        self.weight = 75.f;
        self.age = 19.f;
        self.bouts = 0;
        self.wins = 0;
        self.kos = 0;
        self.reach = 1.8f;
        self.division = @"none";
        self.stance = @"none";
    }
    return self;
}

-(void) move
{
    [super move];
    NSLog(@"Boxer is fighting!");
}

-(NSString *) description
{
    return [NSString stringWithFormat: @"Human: name = %@, gender = %@, height = %g, weight = %g, age = %g, bouts = %lu,\n"
            "                                                      wins = %lu, KOs = %lu, reach = %g, division = %@, stance = %@\n",
        self.name, self.gender, self.height, self.weight, self.age, self.bouts, self.wins, self.kos, self.reach, self.division, self.stance];
}

@end
