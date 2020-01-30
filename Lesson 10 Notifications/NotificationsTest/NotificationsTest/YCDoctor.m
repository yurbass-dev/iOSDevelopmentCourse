//
//  YCDoctor.m
//  NotificationsTest
//
//  Created by Yuriy on 24.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDoctor.h"
#import "YCGovernment.h"

@implementation YCDoctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver: self
               selector: @selector(salaryChangedNotification:)
                   name: YCGovernmentSalaryDidChangeNotification
                 object: nil];
        
        [nc addObserver: self
               selector: @selector(averagePriceChangedNotification:)
                   name: YCGovernmentAveragePriceDidChangeNotification
                 object: nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Notifications

-(void) salaryChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey: YCGovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary)
        NSLog(@"Doctors are NOT happy");
    else
        NSLog(@"Doctors are happy");
    
    self.salary = salary;
}

-(void) averagePriceChangedNotification: (NSNotification*) notification
{
    
}


@end
