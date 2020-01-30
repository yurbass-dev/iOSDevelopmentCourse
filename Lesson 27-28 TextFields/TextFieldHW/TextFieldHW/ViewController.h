//
//  ViewController.h
//  TextFieldHW
//
//  Created by Yuriy on 09.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YCTextFieldType) {
    
    YCTextFieldTypeFirstName,
    YCTextFieldTypeLastName,
    YCTextFieldTypeLogin,
    YCTextFieldTypePassword,
    YCTextFieldTypeAge,
    YCTextFieldTypePhone,
    YCTextFieldTypeEmail
};

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldsCollection;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *textFieldLabelCollection;

@end

