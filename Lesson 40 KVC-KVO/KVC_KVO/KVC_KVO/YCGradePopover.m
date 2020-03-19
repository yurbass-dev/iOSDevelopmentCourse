//
//  YCGradePopover.m
//  KVC_KVO
//
//  Created by Yuriy on 3/15/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import "YCGradePopover.h"

@interface YCGradePopover ()

@property (copy, nonatomic) NSArray *gradeData;

@end

@implementation YCGradePopover

#pragma mark - View Lyfecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gradeData = @[@"A", @"B", @"C", @"D", @"E", @"FX", @"F"];
    
    if (!self.gradeFromTextField) {
        [self.gradePickerView selectRow:(self.gradeData.count / 2) inComponent:0 animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    if (self.gradeFromTextField) {
        [self.gradePickerView selectRow:[self.gradeData indexOfObject:self.gradeFromTextField] inComponent:0 animated:YES];
    }
}

#pragma mark - Actions

- (IBAction)actionDone:(UIButton *)sender {
    
    NSInteger row = [self.gradePickerView selectedRowInComponent:0];
    NSString *grade = self.gradeData[row];
    [self.delegate gradeDidChange:grade];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.gradeData.count;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.gradeData[row];
}

@end
