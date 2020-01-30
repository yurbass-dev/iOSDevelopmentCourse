//
//  ChildClass.m
//  FunctionsTest
//
//  Created by Yuriy on 28.07.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ChildClass.h"

@implementation ChildClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class is initialized");
    }
    return self;
}

- (NSString *) saySomeNumberString
{
    return@"Something!";
}

- (NSString *) saySomething
{
    return [super saySomeNumberString];
}

@end
