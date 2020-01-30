//
//  ViewController.m
//  TextFieldsTest
//
//  Created by Yuriy on 29.01.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.firstNameField.keyboardAppearance = UIKeyboardAppearanceDark;
//    self.lastNameField.keyboardAppearance = UIKeyboardAppearanceLight;
    
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    
    [self.firstNameField becomeFirstResponder];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidChangeEditing:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Actions

- (IBAction)actionLog:(UIButton *)sender {
    
    NSLog(@"First name: %@, Last name: %@", self.firstNameField.text, self.lastNameField.text);
    
    if ([self.firstNameField becomeFirstResponder]) {
        [self.firstNameField resignFirstResponder];
    }
    else if ([self.lastNameField becomeFirstResponder]) {
        [self.lastNameField resignFirstResponder];
    }
}

- (IBAction)actionTextChanged:(UITextField *)sender {
    
    NSLog(@"%@", sender.text);
}

#pragma mark - UITextFieldDelegate

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//
//    return [textField isEqual:self.firstNameField];
//}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - Notifications

-(void)notificationTextDidBeginEditing:(NSNotification *)notification {
    
    NSLog(@"notificationTextDidBeginEditing");
}


-(void)notificationTextDidEndEditing:(NSNotification *)notification {
    
    NSLog(@"notificationTextDidEndEditing");
}

-(void)notificationTextDidChangeEditing:(NSNotification *)notification {
    
    NSLog(@"notificationTextDidChangeEditing");
}

@end
