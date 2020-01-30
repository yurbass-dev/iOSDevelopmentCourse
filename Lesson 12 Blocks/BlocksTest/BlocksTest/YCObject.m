//
//  YCObject.m
//  BlocksTest
//
//  Created by Yuriy on 02.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCObject.h"

@interface YCObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end

@implementation YCObject

/*
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.objectBlock = ^{
            NSLog(@"%@", self.name);        // Блок создает стронг ссылку на обьект, поэтому обьект не будет удален
        };
    }
    return self;
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak YCObject *weakSelf = self;
        
        self.objectBlock = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}

-(void) dealloc
{
    NSLog(@"YCObject is deallocated");
}

-(void) testMetod: (ObjectBlock) block
{
    block();
}

@end
