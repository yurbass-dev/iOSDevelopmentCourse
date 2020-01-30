//
//  YCDoctor.m
//  NotificationsTest
//
//  Created by Yuriy on 24.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDoctor.h"


@implementation YCDoctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _salary = 1100.f;
        _averagePrice = 10.f;
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(salaryChangedNotification:)
                                                     name: YCGovernmentSalaryDidChangeNotification
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
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Notifications

-(void) salaryChangedNotification: (NSNotification*) notification
{
    NSNumber *newSalaryObj = [notification.userInfo objectForKey: YCGovernmentSalaryUserInfoKey];
    CGFloat newSalary = [newSalaryObj floatValue];
    
    NSLog(@"Salary of the doctor has changed:");
    NSLog(@"    previous salary %g and new %g.", _salary, newSalary);
    
    _salary = newSalary;
}

-(void) averagePriceChangedNotification: (NSNotification*) notification
{
    NSNumber *newAveragePriceObj = [notification.userInfo objectForKey: YCGovernmentAveragePriceUserInfoKey];
    CGFloat newAveragePrice = [newAveragePriceObj floatValue];
    
    NSLog(@"Average price of the doctor has changed:");
    NSLog(@"    previous average price %g and new %g.", _averagePrice, newAveragePrice);
    
    _averagePrice = newAveragePrice;
}

-(void) didEnterBackgroundNotification: (NSNotification*) notification
{
    NSLog(@"Doctor went to sleep.");
}

-(void) WillEnterForegroundNotification: (NSNotification*) notification
{
    NSLog(@"Doctor is waked up!");
}

@end
