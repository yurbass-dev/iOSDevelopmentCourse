//
//  YCSaveAndLoadSettings.m
//  SettingsHW
//
//  Created by Yuriy on 24.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCSaveAndLoadSettings.h"

typedef NS_ENUM(NSInteger, YCSettingType) {
    
    YCSettingTypeFirstName,
    YCSettingTypeLastName,
    YCSettingTypeLogin,
    YCSettingTypePassword,
    YCSettingTypePhone,
    YCSettingTypeEmail,
    YCSettingTypeAge,
    YCSettingTypeGender,
    YCSettingTypeVolume,
    YCSettingTypeShadows,
    YCSettingTypeAntiAliasing
};

static NSString *const kSettingFirstName     = @"firstName";
static NSString *const kSettingLastName      = @"lastName";
static NSString *const kSettingLogin         = @"login";
static NSString *const kSettingPassword      = @"password";
static NSString *const kSettingPhone         = @"phone";
static NSString *const kSettingEmail         = @"email";
static NSString *const kSettingAge           = @"age";
static NSString *const kSettingGender        = @"gender";
static NSString *const kSettingVolume        = @"volume";
static NSString *const kSettingShadows       = @"shadows";
static NSString *const kSettingAntiAliasing  = @"antiAliasing";

@implementation YCSaveAndLoadSettings

- (void)saveSettings:(NSArray *)textFieldsAndControls {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypeFirstName]).text forKey:kSettingFirstName];
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypeLastName]).text  forKey:kSettingLastName];
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypeLogin]).text     forKey:kSettingLogin];
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypePassword]).text  forKey:kSettingPassword];
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypePhone]).text     forKey:kSettingPhone];
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypeEmail]).text     forKey:kSettingEmail];
    [userDefaults setObject:((UITextField *)textFieldsAndControls[YCSettingTypeAge]).text       forKey:kSettingAge];
    
    [userDefaults setInteger:((UISegmentedControl *)textFieldsAndControls[YCSettingTypeGender]).selectedSegmentIndex forKey:kSettingGender];
    [userDefaults setFloat:((UISlider *)textFieldsAndControls[YCSettingTypeVolume]).value                            forKey:kSettingVolume];
    [userDefaults setBool:((UISwitch *)textFieldsAndControls[YCSettingTypeShadows]).isOn                             forKey:kSettingShadows];
    [userDefaults setBool:((UISwitch *)textFieldsAndControls[YCSettingTypeAntiAliasing]).isOn                        forKey:kSettingAntiAliasing];
    
    [userDefaults synchronize];
}

- (void)loadSettings:(NSArray *)textFieldsAndControls andTextLabels:(NSArray *)textLabels {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    ((UITextField *)textFieldsAndControls[YCSettingTypeFirstName]).text     = [userDefaults objectForKey:kSettingFirstName];
    ((UITextField *)textFieldsAndControls[YCSettingTypeLastName]).text      = [userDefaults objectForKey:kSettingLastName];
    ((UITextField *)textFieldsAndControls[YCSettingTypeLogin]).text         = [userDefaults objectForKey:kSettingLogin];
    ((UITextField *)textFieldsAndControls[YCSettingTypePassword]).text      = [userDefaults objectForKey:kSettingPassword];
    ((UITextField *)textFieldsAndControls[YCSettingTypePhone]).text         = [userDefaults objectForKey:kSettingPhone];
    ((UITextField *)textFieldsAndControls[YCSettingTypeEmail]).text         = [userDefaults objectForKey:kSettingEmail];
    ((UITextField *)textFieldsAndControls[YCSettingTypeAge]).text           = [userDefaults objectForKey:kSettingAge];
    
    ((UISegmentedControl *)textFieldsAndControls[YCSettingTypeGender]).selectedSegmentIndex = [userDefaults integerForKey:kSettingGender];
    ((UISlider *)textFieldsAndControls[YCSettingTypeVolume]).value                          = [userDefaults floatForKey:kSettingVolume];
    ((UISwitch *)textFieldsAndControls[YCSettingTypeShadows]).on                            = [userDefaults boolForKey:kSettingShadows];
    ((UISwitch *)textFieldsAndControls[YCSettingTypeAntiAliasing]).on                       = [userDefaults boolForKey:kSettingAntiAliasing];
    
    ((UILabel *)textLabels[YCSettingTypeFirstName]).text    = [userDefaults objectForKey:kSettingFirstName];
    ((UILabel *)textLabels[YCSettingTypeLastName]).text     = [userDefaults objectForKey:kSettingLastName];
    ((UILabel *)textLabels[YCSettingTypeLogin]).text        = [userDefaults objectForKey:kSettingLogin];
    ((UILabel *)textLabels[YCSettingTypePassword]).text     = [userDefaults objectForKey:kSettingPassword];
    ((UILabel *)textLabels[YCSettingTypePhone]).text        = [userDefaults objectForKey:kSettingPhone];
    ((UILabel *)textLabels[YCSettingTypeEmail]).text        = [userDefaults objectForKey:kSettingEmail];
    ((UILabel *)textLabels[YCSettingTypeAge]).text          = [userDefaults objectForKey:kSettingAge];
    ((UILabel *)[textLabels lastObject]).text       = [NSString stringWithFormat:@"%.0f%%", [userDefaults floatForKey:kSettingVolume]];
 
}
                      
@end
