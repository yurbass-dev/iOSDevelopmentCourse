//
//  YCDog.m
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDog.h"

@implementation YCDog

#pragma mark - YCRunners
-(NSString*) run1
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is running!"];
    
    return string;
}

-(NSString*) acceleration
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is acceleration!"];
    
    return string;
}

-(NSString*) eat
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is eating!"];
    
    return string;
}

@end
