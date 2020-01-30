//
//  YCCat.m
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCCat.h"

@implementation YCCat

#pragma mark - YCJumpers
-(NSString*) jump
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is jumping!"];
    
    return string;
}

-(NSString*) acceleration
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is acceleration!"];
    
    return string;
}

-(NSString*) rest
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @" is resting!"];
    
    return string;
}

@end
