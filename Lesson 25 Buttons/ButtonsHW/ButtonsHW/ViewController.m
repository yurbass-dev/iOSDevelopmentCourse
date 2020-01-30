//
//  ViewController.m
//  ButtonsHW
//
//  Created by Yuriy on 25.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "YCCalculatorModel.h"


@interface ViewController ()

@property (strong, nonatomic) YCCalculatorModel *calcModel;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;
@property (assign, nonatomic) BOOL isEqualEntered;
@property (assign, nonatomic) BOOL isSecondNumEntered;

- (IBAction)equalAction:(UIButton *)sender;
- (IBAction)clearAction:(UIButton *)sender;
- (IBAction)operationAction:(UIButton *)sender;
- (IBAction)digitAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.calcModel = [[YCCalculatorModel alloc] init];
    self.isSecondNumEntered = false;
    self.isEqualEntered = false;
}

#pragma mark - View Layout
// Make round buttons
- (void)viewWillLayoutSubviews {

    [super viewWillLayoutSubviews];
    
    for (id obj in self.view.subviews) {
        
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button = obj;
            button.layer.cornerRadius = CGRectGetHeight(button.frame) / 2.f;
        }
    }
}

#pragma mark - Actions

- (IBAction)equalAction:(UIButton *)sender {
    
    // Operation for single number, example: 7 + = 14
    if (!self.isSecondNumEntered && self.calcModel.operationType != YCButtonOperationTypeNone) {
        self.calcModel.secondNum = self.calcModel.firstNum;
    }
    // If operation is division and second number equal zero, don't calculate and also print in screen warning message
    if (self.calcModel.operationType == YCButtonOperationTypeDivision && self.calcModel.secondNum == 0.f) {
        self.screenLabel.text = @"Can't be divide by 0";
    }
    else if (self.calcModel.operationType != YCButtonOperationTypeNone) {
        [self.calcModel calculate];
        self.screenLabel.text = [NSString stringWithFormat:@"%g", self.calcModel.firstNum];
    }
    
    self.calcModel.secondNum = 0.f;
    self.calcModel.operationType = YCButtonOperationTypeNone;
    self.isSecondNumEntered = false;
    self.isEqualEntered = true;
}

- (IBAction)clearAction:(UIButton *)sender {
    
    self.screenLabel.text = @"0";
    self.calcModel.firstNum = 0.f;
    self.calcModel.secondNum = 0.f;
    self.calcModel.operationType = YCButtonOperationTypeNone;
    self.isSecondNumEntered = false;
    self.isEqualEntered = false;
}

- (IBAction)operationAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case YCButtonOperationTypeAddition:
            self.screenLabel.text = @"+";
            self.calcModel.operationType = sender.tag;
            break;
        case YCButtonOperationTypeSubtraction:
            self.screenLabel.text = @"-";
            self.calcModel.operationType = sender.tag;
            break;
        case YCButtonOperationTypeMultiplication:
            self.screenLabel.text = @"×";
            self.calcModel.operationType = sender.tag;
            break;
        case YCButtonOperationTypeDivision:
            self.screenLabel.text = @"÷";
            self.calcModel.operationType = sender.tag;
            break;
        case YCButtonOperationTypeFindPercent:
            self.screenLabel.text = [NSString stringWithFormat:@"%g", [self.calcModel findPercent:self.isSecondNumEntered]];
            break;
        case YCButtonOperationTypeChangeSign:
            self.screenLabel.text = [NSString stringWithFormat:@"%g", [self.calcModel changeSign:self.isSecondNumEntered]];
            break;
    }
}

- (IBAction)digitAction:(UIButton *)sender {
    
    NSString *stringFromScreenLabel = self.screenLabel.text;
    BOOL isPointEntered = [sender.titleLabel.text isEqualToString:@"."] && [stringFromScreenLabel containsString:@"."];
    
    // If current button isn't a point and the number don't contains a point
    if (!isPointEntered) {
        // If the equal button is pressed, clear the number
        if (self.isEqualEntered) {
            stringFromScreenLabel = @"";
            self.isEqualEntered = false;
        }
        // If the operation button is pressed and the second number is not entered. Or the string is zero, clear the number
        if ((self.calcModel.operationType != YCButtonOperationTypeNone && !self.isSecondNumEntered) ||
            [stringFromScreenLabel isEqualToString:@"0"]) {
            stringFromScreenLabel = @"";
        }
        // If the point button is pressed and the string is empty, set the string to zero so that the number starts from zero and not from the point
        if ([sender.titleLabel.text isEqualToString:@"."] && [stringFromScreenLabel isEqualToString:@""]) {
            stringFromScreenLabel = @"0";
        }
        
        stringFromScreenLabel = [stringFromScreenLabel stringByAppendingString:sender.titleLabel.text];
        self.screenLabel.text = stringFromScreenLabel;
        
        if (self.calcModel.operationType == YCButtonOperationTypeNone) {
            self.calcModel.firstNum = stringFromScreenLabel.doubleValue;
        }
        else {
            self.calcModel.secondNum = stringFromScreenLabel.doubleValue;
            self.isSecondNumEntered = true;
        }
    }
}

@end

