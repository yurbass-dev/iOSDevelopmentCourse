//
//  YCDatePopoverViewController.m
//  PopoversHW
//
//  Created by Yuriy on 06.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCDatePopoverViewController.h"

@interface YCDatePopoverViewController ()

@end

@implementation YCDatePopoverViewController

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

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.preferredContentSize = CGSizeMake(self.birthdayDatePicker.bounds.size.width, self.birthdayDatePicker.bounds.size.height);
}

#pragma mark - Actions

- (IBAction)actionDateChanged:(UIDatePicker *)sender {
    
    [self.delegate dateChanged:sender];
}
@end
