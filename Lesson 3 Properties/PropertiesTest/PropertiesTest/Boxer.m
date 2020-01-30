//
//  Boxer.m
//  PropertiesTest
//
//  Created by Yuriy on 31.07.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "Boxer.h"

@interface Boxer ()

@property (assign, nonatomic) NSInteger nameCount;

@end

@implementation Boxer

@synthesize name = _name, age = _age, height = _height, weight = _weight;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameCount = 0;
        self.name = @"Default";
        self.age = 1;
        self.height = 0.52f;
        self.weight = 5.f;
    }
    return self;
}

- (void) setName: (NSString *) inputName
{
    NSLog(@"Setter setName is called");
    _name = inputName;
}
 

- (NSString *) name
{
    NSLog(@"name getter is called %ld times", ++self.nameCount);
    
    return _name;
}

- (NSInteger) age
{
    NSLog(@"age getter is called");
    
    return _age;
}

- (NSInteger) howOldAreYou
{
    return self.age;
}

@end
