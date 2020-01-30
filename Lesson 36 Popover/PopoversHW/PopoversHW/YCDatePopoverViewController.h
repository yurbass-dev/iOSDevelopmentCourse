//
//  YCDatePopoverViewController.h
//  PopoversHW
//
//  Created by Yuriy on 06.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YCDatePopoverViewControllerDelegate;

@interface YCDatePopoverViewController : UIViewController

@property (weak, nonatomic) id <YCDatePopoverViewControllerDelegate> delegate;
- (IBAction)actionDateChanged:(UIDatePicker *)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthdayDatePicker;
@property (strong, nonatomic) NSDate *dateFromTextField;

@end

@protocol YCDatePopoverViewControllerDelegate <NSObject>

- (void)dateChanged:(UIDatePicker *)sender;

@end

NS_ASSUME_NONNULL_END
