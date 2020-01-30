//
//  ParentClass.m
//  FunctionsTest
//
//  Created by Yuriy on 28.07.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ParentClass.h"

@implementation ParentClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class is initialized");
    }
    return self;
}

- (void)sayHello
{
    NSLog(@"Parent says hello! %@", self);
}

- (void) say:(NSString *) string
{
    NSLog(@"%@", string);
}

- (void) say:(NSString *) string and:(NSString *) string2
{
    NSLog(@"%@, %@", string, string2);
}

- (void) say:(NSString *) string and:(NSString *) string2 andAfterThat:(NSString *) string3
{
    NSLog(@"%@, %@, %@", string, string2, string3);
}

- (NSString *) saySomeNumberString
{
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString *) saySomething
{
    NSString *string = [self saySomeNumberString];
    
    return string;
}

+ (void) whoAreYou
{
    NSLog(@"I am ParentClass %@", self);
}



@end
