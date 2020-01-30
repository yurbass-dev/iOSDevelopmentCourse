//
//  ViewController.m
//  ControlsTest
//
//  Created by Yuriy on 10.01.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, YCColorSchemeType) {
    
    YCColorSchemeTypeRGB,
    YCColorSchemeTypeHSV
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self refreshScreen];
}

#pragma mark - Additional Methods

- (void)refreshScreen {
    
    CGFloat red = self.redComponentSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    UIColor *color = nil;
    
    if (self.colorSchemeControl.selectedSegmentIndex == YCColorSchemeTypeRGB) {
        color = [UIColor colorWithRed:red
                                green:green
                                 blue:blue
                                alpha:1.0f];
    }
    else {
        color = [UIColor colorWithHue:red
                           saturation:green
                           brightness:blue
                                alpha:1.0f];
    }
    
    CGFloat hue, saturation, brightness, alpha;
    
    NSString *result = [NSString string];
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        
        result = [result stringByAppendingFormat:@"RGB:{%.2f %.2f %.2f}", red, green, blue];
    }
    else {
        result = [result stringByAppendingFormat:@"RGB:{NO DATA}"];
    }
    
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        
        result = [result stringByAppendingFormat:@"\tHSV:{%.2f %.2f %.2f}", hue, saturation, brightness];
    }
    else {
        result = [result stringByAppendingFormat:@"\tHSV:{NO DATA}"];
    }
    
    
    self.view.backgroundColor = color;
    
    self.infoLabel.text = result;
}



#pragma mark - Actions

- (IBAction)actionSlider:(UISlider *)sender {
    
    [self refreshScreen];
}

- (IBAction)actionSwitch:(UISwitch *)sender {
    
    if (sender.isOn) {
        self.switchLabel.text = @"Enabled";
    }
    else {
        self.switchLabel.text = @"Disabled";
    }
    
    self.redComponentSlider.enabled = self.greenComponentSlider.enabled = self.blueComponentSlider.enabled = sender.isOn;
    
//    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
//            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
//        }
//    });
}

@end
