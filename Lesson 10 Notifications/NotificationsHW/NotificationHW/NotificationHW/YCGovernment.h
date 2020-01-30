//
//  YCGovernment.h
//  NotificationsTest
//
//  Created by Yuriy on 24.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const YCGovernmentTaxLevelDidChangeNotification;
extern NSString *const YCGovernmentSalaryDidChangeNotification;
extern NSString *const YCGovernmentPensionDidChangeNotification;
extern NSString *const YCGovernmentAveragePriceDidChangeNotification;

extern NSString *const YCGovernmentTaxLevelUserInfoKey;
extern NSString *const YCGovernmentSalaryUserInfoKey;
extern NSString *const YCGovernmentPensionUserInfoKey;
extern NSString *const YCGovernmentAveragePriceUserInfoKey;

@interface YCGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end
