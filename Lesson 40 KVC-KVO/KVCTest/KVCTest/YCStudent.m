//
//  YCStudent.m
//  KVCTest
//
//  Created by Yuriy on 9/24/19.
//  Copyright © 2019 Yuriy. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

- (void)setName:(NSString *)name {
    
    _name = name;
    
    NSLog(@"student setName: %@", name);
}

- (void)setAge:(NSInteger)age {
    
    _age = age;
    
    NSLog(@"student setAge: %ld", age);
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Student: %@ %ld", self.name, self.age];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    NSLog(@"Student setValue:%@ forKey:%@", value, key);
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"setValueforUndefinedKey");
}

- (id)valueForUndefinedKey:(NSString *)key {
    
    NSLog(@"valueForUndefinedKey");
    
    return nil;
}

- (void)changeName {
    
    [self willChangeValueForKey:@"name"];
    _name = @"FakeName";
    [self didChangeValueForKey:@"name"];
}

@end
