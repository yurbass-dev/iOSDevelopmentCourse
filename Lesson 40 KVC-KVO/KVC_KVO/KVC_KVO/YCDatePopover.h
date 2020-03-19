//
//  YCDatePopoverViewController.h
//  KVC_KVO
//
//  Created by Yuriy on 3/1/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YCDatePopoverDelegate;

@interface YCDatePopover : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *birthdayDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) id <YCDatePopoverDelegate> delegate;
@property (strong, nonatomic) NSDate *dateFromTextField;

- (IBAction)actionDone:(UIButton *)sender;

@end

@protocol YCDatePopoverDelegate <NSObject>

@required

- (void)dateDidChange:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
