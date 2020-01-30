//
//  YCStudent.m
//  DictionaryHW
//
//  Created by Yuriy on 05.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

- (instancetype)init
{
    return [self initWithName:@"DefaultName" andLastName:@"DefaultLastName" andGreeting:@"DefaultHello"];
}

// Назначенный инициализатор
-(instancetype) initWithName: (NSString*) name andLastName: (NSString*) lastName andGreeting: (NSString*) hello
{
    self = [super init];
    if (self)
    {
        self.firstName = name;
        self.lastName = lastName;
        self.greeting = hello;
    }
    
    return self;
}

@end
