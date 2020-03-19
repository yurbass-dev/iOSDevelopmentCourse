//
//  YCDatePopoverViewController.m
//  KVC_KVO
//
//  Created by Yuriy on 3/1/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import "YCDatePopover.h"

@interface YCDatePopover ()

@end

@implementation YCDatePopover

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    if (self.dateFromTextField) {
        self.birthdayDatePicker.date = self.dateFromTextField;
    }
}

#pragma mark - Actions

- (IBAction)actionDone:(UIButton *)sender {
    
    [self.delegate dateDidChange:self.birthdayDatePicker.date];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
