//
//  ViewController.m
//  PopoversHW
//
//  Created by Yuriy on 05.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
static NSDateFormatter *dateFormatter;

@interface ViewController ()

@property (strong, nonatomic) NSIndexPath *currentEducationIndexPath;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!dateFormatter) {
        
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"MMMM d yyyy"];
    }
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"InfoPopover"]) {
        
        UIPopoverPresentationController *popover = segue.destinationViewController.popoverPresentationController;
        popover.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"DatePopover"]) {
        
        YCDatePopoverViewController *datePopover = segue.destinationViewController;
        
        datePopover.delegate = self;
        datePopover.popoverPresentationController.delegate = self;
        
        UITextField *textField = (UITextField *)sender;
        datePopover.popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMaxY(textField.bounds),0,0);
        datePopover.dateFromTextField = [dateFormatter dateFromString:self.birthdayTextField.text];
    }
    else if ([segue.identifier isEqualToString:@"EducationPopover"]) {
        
        YCEducationPopoverViewController *educationPopover = segue.destinationViewController;
        
        educationPopover.delegate = self;
        educationPopover.popoverPresentationController.delegate = self;
        
        UITextField *textField = (UITextField *)sender;
        educationPopover.popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMaxY(textField.bounds),0,0);
        educationPopover.selectedCellIndexPath = self.currentEducationIndexPath;
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    
    return UIModalPresentationNone;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    if ([textField isEqual:self.birthdayTextField]) {
        
        [self performSegueWithIdentifier:@"DatePopover" sender:textField];
        return NO;
    }
    else if ([textField isEqual:self.educationTextField]) {
    
        [self performSegueWithIdentifier:@"EducationPopover" sender:textField];
        return NO;
    }

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if ([textField isEqual:self.firstNameTextField]) {
        [self.lastNameTextField becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - YCDatePopoverViewControllerDelegate

- (void)dateChanged:(UIDatePicker *)sender {
    
    self.birthdayTextField.text = [dateFormatter stringFromDate:sender.date];
}

#pragma mark - YCEducationPopoverViewControllerDelegate

- (void)educationChanged:(NSString *)education withIndexPath:(NSIndexPath *)indexPath {
    
    self.educationTextField.text = education;
    self.currentEducationIndexPath = indexPath;
}

@end
