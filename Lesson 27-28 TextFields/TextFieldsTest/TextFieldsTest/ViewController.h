//
//  ViewController.h
//  TextFieldsTest
//
//  Created by Yuriy on 29.01.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

- (IBAction)actionLog:(UIButton *)sender;
- (IBAction)actionTextChanged:(UITextField *)sender;

@end

