//
//  ViewController.m
//  TextFieldHW
//
//  Created by Yuriy on 09.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.textFieldsCollection firstObject] becomeFirstResponder];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag != self.textFieldsCollection.count - 1) {
        [[self.textFieldsCollection objectAtIndex:textField.tag + 1] becomeFirstResponder];
    }
    else {
        [[self.textFieldsCollection objectAtIndex:textField.tag] resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
    label.text = @"";
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    if (textField.tag == YCTextFieldTypeEmail && textField.text.length != 0 && ![self validateEmailWithString:textField.text]) {

        UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
        label.text = @"Please enter email correctly.";
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    BOOL shouldChange = YES;
    UILabel *label = nil;
    
    switch (textField.tag) {
        case YCTextFieldTypeFirstName:
            shouldChange = [self nameTextField:textField shouldChangeCharactersInRange:range replacementString:string];
            break;
        case YCTextFieldTypeLastName:
            shouldChange = [self nameTextField:textField shouldChangeCharactersInRange:range replacementString:string];
            break;
        case YCTextFieldTypeLogin:
            shouldChange = [self loginTextField:textField shouldChangeCharactersInRange:range replacementString:string];
            break;
        case YCTextFieldTypePassword:
            shouldChange = [self passwordTextField:textField shouldChangeCharactersInRange:range replacementString:string];
            break;
        case YCTextFieldTypeAge:
            shouldChange = [self ageTextField:textField shouldChangeCharactersInRange:range replacementString:string];
            break;
        case YCTextFieldTypePhone:
            shouldChange = [self phoneTextField:textField shouldChangeCharactersInRange:range replacementString:string];
            break;
        default:
            label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
            label.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
    }
    
    return shouldChange;
}

#pragma mark - Additional Methods

- (BOOL)phoneTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([components count] > 1) {
        return NO;
    }
    
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    
    newString = [validComponents componentsJoinedByString:@""];
    
    static const NSInteger localNumberMaxLength = 7;
    static const NSInteger areaCodeMaxLength = 3;
    static const NSInteger countryCodeMaxLength = 3;
    
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
        return NO;
    }
    
    NSMutableString *resultString = [NSMutableString string];
    
    NSInteger localNumberLength = MIN(newString.length, localNumberMaxLength);
    
    if (localNumberLength > 0) {
        
        NSString *number = [newString substringFromIndex:(NSInteger)newString.length - localNumberLength];
        
        [resultString appendString:number];
        
        if (resultString.length > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if (newString.length > localNumberMaxLength) {
        
        NSInteger areaCodeLength = MIN((NSInteger)newString.length - localNumberMaxLength, areaCodeMaxLength);
        
        NSRange areaRange = NSMakeRange((NSInteger)newString.length - localNumberMaxLength - areaCodeLength, areaCodeLength);
        
        NSString *area = [newString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        
        [resultString insertString:area atIndex:0];
    }
    
    if (newString.length > localNumberMaxLength + areaCodeMaxLength) {
        
        NSInteger countryCodeLength = MIN((NSInteger)newString.length - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
        
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        
        NSString *countryCode = [newString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        
        [resultString insertString:countryCode atIndex:0];
    }
    
    UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
    label.text = resultString;
    
    textField.text = resultString;
    
    return NO;
}

- (BOOL)nameTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
 
    NSCharacterSet *validSet = [[NSCharacterSet letterCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validSet];
    
    NSUInteger lengthString = textField.text.length + string.length;
    
    if (components.count == 1 && lengthString <= 20) {
        
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
        label.text = textField.text;
    }
    
    return NO;
}

- (BOOL)loginTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *validSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validSet];
    
    NSUInteger lengthString = textField.text.length + string.length;
    
    if (components.count == 1 && lengthString <= 20) {
        
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
        label.text = textField.text;
    }
    
    return NO;
}

- (BOOL)ageTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *validSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validSet];
    
    NSUInteger lengthString = textField.text.length + string.length;
    
    if (components.count == 1 && lengthString <= 3) {
        
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
        label.text = textField.text;
    }
    
    return NO;
}

- (BOOL)passwordTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableCharacterSet *validSet = [NSMutableCharacterSet alphanumericCharacterSet];
    
    [validSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    
    [validSet invert];
    
    NSArray *components = [string componentsSeparatedByCharactersInSet:validSet];
    
    NSUInteger lengthString = textField.text.length + string.length;
    
    if (components.count == 1 && lengthString <= 10) {
        
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        UILabel *label = [self.textFieldLabelCollection objectAtIndex:textField.tag];
        label.text = textField.text;
    }
    
    return NO;
}

- (BOOL)validateEmailWithString:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    return [emailTest evaluateWithObject:email];
}

@end
