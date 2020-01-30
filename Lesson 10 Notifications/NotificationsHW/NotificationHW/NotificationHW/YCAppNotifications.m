//
//  YCAppNotifications.m
//  NotificationHW
//
//  Created by Yuriy on 30.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCAppNotifications.h"


@implementation YCAppNotifications

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidFinishLaunchingNotification:)
                                                     name: UIApplicationDidFinishLaunchingNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillResignActiveNotification:)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidEnterBackgroundNotification:)
                                                     name: UIApplicationDidEnterBackgroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillEnterForegroundNotification:)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidBecomeActiveNotification:)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillTerminateNotification:)
                                                     name: UIApplicationWillTerminateNotification
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Notifications

-(void) applicationDidFinishLaunchingNotification: (UIApplication *) application
{
    NSLog(@"applicationDidFinishLaunchingNotification");
    NSLog(@"");
}

-(void) applicationWillResignActiveNotification: (UIApplication *) application
{
    NSLog(@"applicationWillResignActiveNotification");
    NSLog(@"");
}

-(void) applicationDidEnterBackgroundNotification: (UIApplication *) application
{
    NSLog(@"applicationDidEnterBackgroundNotification");
    NSLog(@"");
}

-(void) applicationWillEnterForegroundNotification: (UIApplication *) application
{
    NSLog(@"applicationWillEnterForegroundNotification");
    NSLog(@"");
}

-(void) applicationDidBecomeActiveNotification: (UIApplication *) application
{
    NSLog(@"applicationDidBecomeActiveNotification");
    NSLog(@"");
}

-(void) applicationWillTerminateNotification: (UIApplication *) application
{
    NSLog(@"applicationWillTerminateNotification");
    NSLog(@"");
}

@end
