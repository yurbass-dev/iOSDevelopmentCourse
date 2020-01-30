//
//  YCStudent.m
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

-(void) study
{
    
}

#pragma mark - YCPatient

-(BOOL) areYouOk
{
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is student %@ okay? %@", self.name, ok ? @"YES" : @"NO");
    
    return ok;
}

-(void) takePill
{
    NSLog(@"Student %@ takes a pill.", self.name);
}

-(void) makeShot
{
    NSLog(@"Student %@ makes a shot.", self.name);
}

-(NSString*) howIsYourFamily
{
    return @"My family is doing well!";
}


@end
