//
//  YCSwimmer.m
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCSwimmer.h"

@implementation YCSwimmer

#pragma mark - YCSwimmers
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

-(NSString*) drink
{
    NSString *string = [NSString stringWithFormat: @"%@ %@", self.name, @"is drinking!"];
    
    return string;
}

@end
