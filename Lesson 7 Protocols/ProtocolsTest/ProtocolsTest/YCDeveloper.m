//
//  YCDeveloper.m
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDeveloper.h"

@implementation YCDeveloper

-(void) work
{
    
}

#pragma mark - YCPatient

-(BOOL) areYouOk
{
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is developer %@ okay? %@", self.name, ok ? @"YES" : @"NO");
    
    return ok;
}

-(void) takePill
{
    NSLog(@"Developer %@ takes a pill.", self.name);
}

-(void) makeShot
{
    NSLog(@"Developer %@ makes a shot.", self.name);
}

-(NSString*) howIsYourJob
{
    return @"My job is awesome!";
}

@end
