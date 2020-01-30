//
//  YCCalculatorModel.h
//  ButtonsHW
//
//  Created by Yuriy on 30.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

typedef NS_ENUM(NSInteger, YCButtonOperationType) {
    
    YCButtonOperationTypeNone = 0,
    YCButtonOperationTypeAddition = 13,
    YCButtonOperationTypeSubtraction,
    YCButtonOperationTypeMultiplication,
    YCButtonOperationTypeDivision,
    YCButtonOperationTypeFindPercent,
    YCButtonOperationTypeChangeSign,
};

NS_ASSUME_NONNULL_BEGIN

@interface YCCalculatorModel : NSObject

@property (assign, nonatomic) CGFloat firstNum;
@property (assign, nonatomic) CGFloat secondNum;
@property (assign, nonatomic) YCButtonOperationType operationType;

- (void)calculate;
- (CGFloat)changeSign:(BOOL)isSecondNumEntered;
- (CGFloat)findPercent:(BOOL)isSecondNumEntered;

@end

NS_ASSUME_NONNULL_END
