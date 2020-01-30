//
//  YCPensioner.m
//  NotificationHW
//
//  Created by Yuriy on 27.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCPensioner.h"
#import "YCGovernment.h"

@implementation YCPensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pension = 700.f;
        _averagePrice = 10.f;
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(pensionChangedNotification:)
                                                     name: YCGovernmentPensionDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(averagePriceChangedNotification:)
                                                     name: YCGovernmentAveragePriceDidChangeNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(didEnterBackgroundNotification:)
                                                     name: UIApplicationDidEnterBackgroundNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(WillEnterForegroundNotification:)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Notifications

-(void) pensionChangedNotification: (NSNotification*) notification
{
    NSNumber *newPensionObj = [notification.userInfo objectForKey: YCGovernmentPensionUserInfoKey];
    CGFloat newPension = [newPensionObj floatValue];
    
    NSLog(@"Pension of the pensioner has changed:");
    NSLog(@"    previous pension %g and new %g.", _pension, newPension);
    
    _pension = newPension;
}

-(void) averagePriceChangedNotification: (NSNotification*) notification
{
    NSNumber *newAveragePriceObj = [notification.userInfo objectForKey: YCGovernmentAveragePriceUserInfoKey];
    CGFloat newAveragePrice = [newAveragePriceObj floatValue];
    
    NSLog(@"Average price of the pensioner has changed");
    NSLog(@"    previous average price %g and new %g.", _averagePrice, newAveragePrice);
    
    _averagePrice = newAveragePrice;
}

-(void) didEnterBackgroundNotification: (NSNotification*) notification
{
    NSLog(@"Pensioner went to sleep.");
}

-(void) WillEnterForegroundNotification: (NSNotification*) notification
{
    NSLog(@"Pensioner is waked up!");
}

@end
