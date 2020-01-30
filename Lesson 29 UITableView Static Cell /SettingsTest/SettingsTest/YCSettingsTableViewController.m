//
//  YCSettingsTableViewController.m
//  SettingsTest
//
//  Created by Yuriy on 18.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCSettingsTableViewController.h"

@interface YCSettingsTableViewController ()

@end

static  NSString *kSettingsLogin        = @"login";
static  NSString *kSettingsPassword     = @"password";
static  NSString *kSettingsLevel        = @"level";
static  NSString *kSettingsShadow       = @"shadow";
static  NSString *kSettingsDetalization = @"detalization";
static  NSString *kSettingsSound        = @"sound";
static  NSString *kSettingsMusic        = @"music";

@implementation YCSettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettings];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)notificationKeyboardWillShow:(NSNotification *)notification {
    
    NSLog(@"notificationKeyboardWillShow:\n%@", notification.userInfo);
}

- (void)notificationKeyboardWillHide:(NSNotification *)notification {
    
    NSLog(@"notificationKeyboardWillHide:\n%@", notification.userInfo);
}


#pragma mark - Save and Load

- (void)saveSettings {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    [userDefaults setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userDefaults setBool:self.shadowSwitch.isOn forKey:kSettingsShadow];
    [userDefaults setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    [userDefaults setFloat:self.soundSlider.value forKey:kSettingsSound];
    [userDefaults setFloat:self.musicSlider.value forKey:kSettingsMusic];
   
    [userDefaults synchronize];
}

- (void)loadSettings {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text                           = [userDefaults objectForKey:kSettingsLogin];
    self.passwordField.text                        = [userDefaults objectForKey:kSettingsPassword];
    self.levelControl.selectedSegmentIndex         = [userDefaults integerForKey:kSettingsLevel];
    self.shadowSwitch.on                           = [userDefaults boolForKey:kSettingsShadow];
    self.detalizationControl.selectedSegmentIndex  = [userDefaults integerForKey:kSettingsDetalization];
    self.soundSlider.value                         = [userDefaults floatForKey:kSettingsSound];
    self.musicSlider.value                         = [userDefaults floatForKey:kSettingsMusic];
}

#pragma mark - Actions

- (IBAction)actionTextChanged:(UITextField *)sender {
    
    [self saveSettings];
}

- (IBAction)actionValueChanged:(id)sender {

    [self saveSettings];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
