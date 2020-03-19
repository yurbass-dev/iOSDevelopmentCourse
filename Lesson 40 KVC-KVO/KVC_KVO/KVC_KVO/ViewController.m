//
//  ViewController.m
//  KVC_KVO
//
//  Created by Yuriy on 2/8/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import "ViewController.h"
#import "YCDatePopover.h"
#import "YCGradePopover.h"
#import "YCStudent.h"

static void *YCStudentContext = &YCStudentContext;

@interface ViewController () <UITextFieldDelegate, YCDatePopoverDelegate, UIPopoverPresentationControllerDelegate, YCGradePopoverDelegate>

@property (strong, nonatomic) UITextField *prevTextField;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) YCStudent *student;
@property (strong, nonatomic) NSMutableArray *students;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.students = @[].mutableCopy;
    
    NSInteger studentsCount = 20;
    
    for (NSInteger index = 0; index < studentsCount; index++) {
        YCStudent *student = [YCStudent createRandomStudent];
        
        if (index != 0) {
            [self.students[index - 1] setMyFriend:student];
        }
        [self.students addObject:student];
        
        if (index + 1 == studentsCount) {
            [self.students[index] setMyFriend:self.students[0]];
        }
    }
    
    self.student = self.students[3];
    
    [self.student addObserver:self
                   forKeyPath:@"firstName"
                      options:NSKeyValueObservingOptionNew
                      context:YCStudentContext];
    
    [self.student addObserver:self
                   forKeyPath:@"lastName"
                      options:NSKeyValueObservingOptionNew
                      context:YCStudentContext];
    
    [self.student addObserver:self
                   forKeyPath:@"dateOfBirth"
                      options:NSKeyValueObservingOptionNew
                      context:YCStudentContext];
    
    [self.student addObserver:self
                   forKeyPath:@"gender"
                      options:NSKeyValueObservingOptionNew
                      context:YCStudentContext];
    
    [self.student addObserver:self
                   forKeyPath:@"grade"
                      options:NSKeyValueObservingOptionNew
                      context:YCStudentContext];
    
    [self.students[0] setValue:@"A" forKeyPath:@"myFriend.grade"];
    [self.students[0] setValue:@"B" forKeyPath:@"myFriend.myFriend.grade"];
    [self.students[0] setValue:@"C" forKeyPath:@"myFriend.myFriend.myFriend.grade"];
    [self.students[0] setValue:@"D" forKeyPath:@"myFriend.myFriend.myFriend.myFriend.grade"];
    [self.students[0] setValue:@"E" forKeyPath:@"myFriend.myFriend.myFriend.myFriend.myFriend.grade"];
    
    for (YCStudent *student in self.students) {
        NSLog(@"%@", student);
    }
    
    NSMutableArray *studentNames = [self.students mutableArrayValueForKeyPath:@"firstName"];
    NSLog(@"%@", studentNames);
    
    NSDate *minDateOfBirth = [self.students valueForKeyPath:@"@min.dateOfBirth"];
    NSLog(@"%@", minDateOfBirth);
    
    NSDate *maxDateOfBirth = [self.students valueForKeyPath:@"@max.dateOfBirth"];
    NSLog(@"%@", maxDateOfBirth);
}

- (void)dealloc {

    [self.student removeObserver:self forKeyPath:@"firstName"];
    [self.student removeObserver:self forKeyPath:@"lastName"];
    [self.student removeObserver:self forKeyPath:@"dateOfBirth"];
    [self.student removeObserver:self forKeyPath:@"gender"];
    [self.student removeObserver:self forKeyPath:@"grade"];
}

#pragma mark - Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == YCStudentContext) {
        
        if ([keyPath isEqualToString:@"firstName"]) {
            NSLog(@"New student name is %@", change[NSKeyValueChangeNewKey]);
        }
        else if ([keyPath isEqualToString:@"lastName"]) {
            NSLog(@"New student surname is %@", change[NSKeyValueChangeNewKey]);
        }
        else if ([keyPath isEqualToString:@"dateOfBirth"]) {
            NSLog(@"New student date of birth is %@", [self.dateFormatter stringFromDate:change[NSKeyValueChangeNewKey]]);
        }
        else if ([keyPath isEqualToString:@"gender"]) {
            if ([change[NSKeyValueChangeNewKey] intValue] == YCStudentGenderMale) {
                NSLog(@"New student gender is male");
            }
            else {
                NSLog(@"New student gender is female");
            }
        }
        else if ([keyPath isEqualToString:@"grade"]) {
            NSLog(@"New student grade is %@", change[NSKeyValueChangeNewKey]);
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Lazy Instantiation

- (NSDateFormatter *)dateFormatter {
    
    if (!_dateFormatter) {
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateStyle = NSDateFormatterLongStyle;
    }
    
    return _dateFormatter;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DatePopover"]) {
        
        YCDatePopover *datePopover = segue.destinationViewController;
        datePopover.popoverPresentationController.delegate = self;
        datePopover.delegate = self;
        
        if (self.birthdayTextField.text.length != 0) {
            datePopover.dateFromTextField = [self.dateFormatter dateFromString:self.birthdayTextField.text];
        }
    }
    else if ([segue.identifier isEqualToString:@"GradePopover"]) {
        
        YCGradePopover *gradePopover = segue.destinationViewController;
        gradePopover.popoverPresentationController.delegate = self;
        gradePopover.delegate = self;
        
        if (self.gradeTextField.text.length != 0) {
            gradePopover.gradeFromTextField = self.gradeTextField.text;
        }
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.birthdayTextField]) {
        
        [self.prevTextField resignFirstResponder];
        [self performSegueWithIdentifier:@"DatePopover" sender:textField];
        return NO;
    }
    else if ([textField isEqual:self.gradeTextField]) {
        
        [self.prevTextField resignFirstResponder];
        [self performSegueWithIdentifier:@"GradePopover" sender:textField];
        return NO;
    }
    
    self.prevTextField = textField;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if ([textField isEqual:self.firstNameTextField]) {
        [self.lastNameTextField becomeFirstResponder];
    }
    else if ([textField isEqual:self.lastNameTextField]) {
        [self.birthdayTextField becomeFirstResponder];
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.firstNameTextField] && textField.text.length != 0) {
        self.student.firstName = self.firstNameTextField.text;
    }
    else if ([textField isEqual:self.lastNameTextField] && textField.text.length != 0) {
        self.student.lastName = self.lastNameTextField.text;
    }
}

#pragma mark - YCDatePopoverDelegate

- (void)dateDidChange:(NSDate *)date {
    
    self.birthdayTextField.text = [self.dateFormatter stringFromDate:date];
    self.student.dateOfBirth = date;
}

#pragma mark - YCGradePopoverDelegate

- (void)gradeDidChange:(NSString *)grade {
    
    self.gradeTextField.text = grade;
    self.student.grade = grade;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    
    return UIModalPresentationNone;
}

#pragma mark - Actions

- (IBAction)actionGenderChange:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == YCStudentGenderMale) {
        self.student.gender = YCStudentGenderMale;
    }
    else {
        self.student.gender = YCStudentGenderFemale;
    }
}

- (IBAction)actionClear:(UIButton *)sender {

    [self.student clearStudent];

    self.firstNameTextField.text = @"";
    self.lastNameTextField.text = @"";
    self.birthdayTextField.text = @"";
    self.genderSegmentedControl.selectedSegmentIndex = YCStudentGenderMale;
    self.gradeTextField.text = @"";
}

@end
