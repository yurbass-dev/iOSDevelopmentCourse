//
//  ViewController.m
//  TextFieldFormatTest
//
//  Created by Yuriy on 05.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

//    NSLog(@"textField text = %@", textField.text);
//    NSLog(@"shouldChangeCharactersInRange = %@", NSStringFromRange(range));
//    NSLog(@"replacementString = %@", string);

    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];

    if ([components count] > 1) {
        return NO;
    }

    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"new srting = %@", newString);
    
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    
    newString = [validComponents componentsJoinedByString:@""];

    // XXXXXXXXXXXX

    NSLog(@"new string fixed = %@", newString);

    static const NSInteger localNumberMaxLength = 7;
    static const NSInteger areaCodeMaxLength = 3;
    static const NSInteger countryCodeMaxLength = 3;


    if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
        return NO;
    }
    

    NSMutableString *resultString = [NSMutableString string];

    // +XX (XXX) XXX-XXXX

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

    /*
    NSCharacterSet *charSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];

//    NSMutableCharacterSet *charSet = [NSMutableCharacterSet whitespaceCharacterSet];
//    [charSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];

    NSArray *words = [resultString componentsSeparatedByCharactersInSet:charSet];
    NSLog(@"%@", words);
    */

    textField.text = resultString;

    return NO;
}


@end
