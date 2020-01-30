//
//  YCAnimal.m
//  ArraysHW
//
//  Created by Yuriy on 21.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCAnimal.h"

@implementation YCAnimal

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
    NSLog(@"Animal is running!");
}

-(NSString *) description
{
    return [NSString stringWithFormat: @"Animal: nickname = %@, says = %@, legs = %lu, age = %g\n",
            self.nickname, self.says, self.legs, self.age];
}

@end
