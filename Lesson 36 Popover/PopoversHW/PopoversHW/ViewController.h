//
//  ViewController.h
//  PopoversHW
//
//  Created by Yuriy on 05.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCDatePopoverViewController.h"
#import "YCEducationPopoverViewController.h"

typedef NS_ENUM(NSInteger, YCTextFieldType) {
    YCTextFieldTypeFirstName,
    YCTextFieldTypeLastName,
    YCTextFieldTypeBirthday,
    YCTextFieldTypeEducation
};

@interface ViewController : UITableViewController <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, YCDatePopoverViewControllerDelegate, YCEducationPopoverViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;

@end

