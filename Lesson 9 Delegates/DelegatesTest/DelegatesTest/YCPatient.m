//
//  YCPatient.m
//  DelegatesTest
//
//  Created by Yuriy on 10.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCPatient.h"

@implementation YCPatient

-(BOOL) howAreYou
{
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood)
        [self.delegate patientFeelsBad:self];
    
    return iFeelGood;
}

-(void) takePill
{
    NSLog(@"%@ takes a pill!", self.name);
}

-(void) makeShot
{
    NSLog(@"%@ makes a shot!", self.name);
}

@end
