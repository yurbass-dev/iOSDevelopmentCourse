//
//  YCCalculatorModel.m
//  ButtonsHW
//
//  Created by Yuriy on 30.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCCalculatorModel.h"

@implementation YCCalculatorModel

- (void)calculate {
    
    switch (self.operationType) {
        case YCButtonOperationTypeAddition:
            self.firstNum += self.secondNum;
            break;
        case YCButtonOperationTypeSubtraction:
            self.firstNum -= self.secondNum;
            break;
        case YCButtonOperationTypeMultiplication:
            self.firstNum *= self.secondNum;
            break;
        case YCButtonOperationTypeDivision:
            self.firstNum /= self.secondNum;
            break;
        default:
            break;
    }
}

- (CGFloat)changeSign:(BOOL)isSecondNumEntered {
    
    CGFloat numWithChangedSign = 0.f;
    
    if (self.firstNum != 0 && !isSecondNumEntered) {
        numWithChangedSign = self.firstNum = -self.firstNum;
    }
    else if (self.secondNum != 0 && isSecondNumEntered) {
        numWithChangedSign = self.secondNum = -self.secondNum;
    }
    
    return numWithChangedSign;
}

- (CGFloat)findPercent:(BOOL)isSecondNumEntered {
    
    CGFloat number = 0.f;
    
    if (isSecondNumEntered) {
        number = self.firstNum / 100.f;
        number *= self.secondNum;
        self.secondNum = number;
    }
    else {
        self.firstNum /= 100.f;
        number = self.firstNum;
    }
    
    return number;
}

@end
