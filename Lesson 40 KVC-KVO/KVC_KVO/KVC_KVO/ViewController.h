//
//  ViewController.h
//  KVC_KVO
//
//  Created by Yuriy on 2/8/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *gradeTextField;

- (IBAction)actionGenderChange:(UISegmentedControl *)sender;
- (IBAction)actionClear:(UIButton *)sender;

@end

