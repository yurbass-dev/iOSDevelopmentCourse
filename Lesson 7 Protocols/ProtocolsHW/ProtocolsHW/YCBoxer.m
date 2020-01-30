//
//  YCBoxer.m
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCBoxer.h"

@implementation YCBoxer

#pragma mark - YCRunners - YCJumpers - YCSwimmers
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

-(NSString*) jump
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is jumping!"];
    
    return string;
}

-(NSString*) swim
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is swimming!"];
    
    return string;
}

-(NSString*) dive
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is diving!"];
    
    return string;
}

-(NSString*) rest
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is resting!"];
    
    return string;
}

-(NSString*) eat
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is eating!"];
    
    return string;
}

@end
