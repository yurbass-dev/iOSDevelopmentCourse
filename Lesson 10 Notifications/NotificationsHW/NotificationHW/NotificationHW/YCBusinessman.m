//
//  YCBusinessman.m
//  NotificationHW
//
//  Created by Yuriy on 27.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCBusinessman.h"

@implementation YCBusinessman

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 10.f;
        _averagePrice = 10.f;
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(taxLevelChangedNotification:)
                                                     name: YCGovernmentTaxLevelDidChangeNotification
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

-(void) taxLevelChangedNotification: (NSNotification*) notification
{
    NSNumber *newTaxLevelObj = [notification.userInfo objectForKey: YCGovernmentTaxLevelUserInfoKey];
    CGFloat newTaxLevel = [newTaxLevelObj floatValue];
    
    NSLog(@"Tax level of the businessman has changed");
    NSLog(@"    previous tax level %g and new %g.", _taxLevel, newTaxLevel);
    
    _taxLevel = newTaxLevel;
}

-(void) averagePriceChangedNotification: (NSNotification*) notification
{
    NSNumber *newAveragePriceObj = [notification.userInfo objectForKey: YCGovernmentAveragePriceUserInfoKey];
    CGFloat newAveragePrice = [newAveragePriceObj floatValue];
    
    NSLog(@"Average price of the businessman has changed");
    NSLog(@"    previous average price %g and new %g.", _averagePrice, newAveragePrice);
    
    _averagePrice = newAveragePrice;
}

-(void) didEnterBackgroundNotification: (NSNotification*) notification
{
    NSLog(@"Businessman went to sleep.");
}

-(void) WillEnterForegroundNotification: (NSNotification*) notification
{
    NSLog(@"Businessman is waked up!");
}

@end
