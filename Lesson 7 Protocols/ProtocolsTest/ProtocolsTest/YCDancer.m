//
//  YCDancer.m
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDancer.h"

@implementation YCDancer

-(void) dance
{
    
}

#pragma mark - YCPatient

-(BOOL) areYouOk
{
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is dancer %@ okay? %@", self.name, ok ? @"YES" : @"NO");
    
    return ok;
}

-(void) takePill
{
    NSLog(@"Dancer %@ takes a pill.", self.name);
}

-(void) makeShot
{
    NSLog(@"Dancer %@ makes a shot.", self.name);
}

@end
