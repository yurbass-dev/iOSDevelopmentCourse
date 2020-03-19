//
//  YCGradePopover.h
//  KVC_KVO
//
//  Created by Yuriy on 3/15/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YCGradePopoverDelegate;

@interface YCGradePopover : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *gradePickerView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) id <YCGradePopoverDelegate> delegate;
@property (copy, nonatomic) NSString *gradeFromTextField;

- (IBAction)actionDone:(UIButton *)sender;

@end

@protocol YCGradePopoverDelegate <NSObject>

@required

- (void)gradeDidChange:(NSString *)grade;

@end

NS_ASSUME_NONNULL_END
