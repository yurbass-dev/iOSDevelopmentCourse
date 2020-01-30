//
//  YCObject.m
//  TimeTest
//
//  Created by Yuriy on 26.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCObject.h"

@implementation YCObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"YCObject is initialized");
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest:) userInfo:nil repeats:YES];
        [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    }
    return self;
}

- (void) timerTest: (NSTimer *) timer
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss:SSS"];
    
    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
    
    //[timer invalidate];
}


- (void)dealloc
{
    NSLog(@"YCObject is deallocated");
}

@end
