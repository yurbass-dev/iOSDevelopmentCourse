//
//  YCSettingsViewController.h
//  SettingsHW
//
//  Created by Yuriy on 24.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YCTextFieldType) {
    
    YCTextFieldTypeFirstName,
    YCTextFieldTypeLastName,
    YCTextFieldTypeLogin,
    YCTextFieldTypePassword,
    YCTextFieldTypePhone,
    YCTextFieldTypeEmail,
    YCTextFieldTypeAge
};

@interface YCSettingsViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *textLabelCollection;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;
@property (strong, nonatomic) IBOutletCollection(id) NSArray *textFieldsAndControlsCollection;

@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;

- (IBAction)actionControls:(id)sender;

@end

NS_ASSUME_NONNULL_END
