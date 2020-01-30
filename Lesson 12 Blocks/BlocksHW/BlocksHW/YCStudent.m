//
//  YCStudent.m
//  BlocksHW
//
//  Created by Yuriy on 03.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

- (instancetype)init
{
    return [self initWithName: @"Ivan" andLastName: @"Ivanov"];
}

// Назначенный инициализатор
- (instancetype)initWithName: (NSString*) firstName andLastName: (NSString*) lastName
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    return self;
}

@end
