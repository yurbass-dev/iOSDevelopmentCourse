//
//  YCGovernment.m
//  NotificationsTest
//
//  Created by Yuriy on 24.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCGovernment.h"

NSString *const YCGovernmentTaxLevelDidChangeNotification = @"YCGovernmentTaxLevelDidChangeNotification";
NSString *const YCGovernmentSalaryDidChangeNotification = @"YCGovernmentSalaryDidChangeNotification";
NSString *const YCGovernmentPensionDidChangeNotification = @"YCGovernmentPensionDidChangeNotification";
NSString *const YCGovernmentAveragePriceDidChangeNotification = @"YCGovernmentAveragePriceDidChangeNotification";

NSString *const YCGovernmentTaxLevelUserInfoKey = @"YCGovernmentTaxLevelUserInfoKey";
NSString *const YCGovernmentSalaryUserInfoKey = @"YCGovernmentSalaryUserInfoKey";
NSString *const YCGovernmentPensionUserInfoKey = @"YCGovernmentPensionUserInfoKey";
NSString *const YCGovernmentAveragePriceUserInfoKey = @"YCGovernmentAveragePriceUserInfoKey";

@implementation YCGovernment

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000.f;
        _pension = 500.f;
        _averagePrice = 10.f;
    }

    return self;
}

#pragma mark - Notifications

-(void) setTaxLevel:(CGFloat)taxLevel
{
    _taxLevel = taxLevel;

    NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat: taxLevel]
                                                           forKey: YCGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: YCGovernmentTaxLevelDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}

-(void) setSalary:(CGFloat)salary
{
    _salary = salary;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat: salary]
                                                           forKey: YCGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: YCGovernmentSalaryDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}

-(void) setPension:(CGFloat)pension
{
    _pension = pension;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat: pension]
                                                           forKey: YCGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: YCGovernmentPensionDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}

-(void) setAveragePrice:(CGFloat)averagePrice
{
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithFloat: _averagePrice]
                                                           forKey: YCGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: YCGovernmentAveragePriceDidChangeNotification
                                                        object: nil
                                                      userInfo: dictionary];
}


@end
