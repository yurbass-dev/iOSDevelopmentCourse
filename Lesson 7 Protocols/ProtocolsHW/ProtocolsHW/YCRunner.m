//
//  YCRunner.m
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCRunner.h"

@implementation YCRunner

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
