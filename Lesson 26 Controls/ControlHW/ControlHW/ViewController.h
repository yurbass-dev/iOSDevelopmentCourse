//
//  ViewController.h
//  ControlHW
//
//  Created by Yuriy on 13.01.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YCImageName) {
  
    YCImageNameApple,
    YCImageNameAndroid,
    YCImageNameWindows
};

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewForImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *changeImageControl;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;


- (IBAction)actionRotation:(UISwitch *)sender;
- (IBAction)actionScale:(UISwitch *)sender;
- (IBAction)actionTranslation:(UISwitch *)sender;
- (IBAction)actionChangeImage:(UISegmentedControl *)sender;
- (IBAction)actionSpeed:(UISlider *)sender;
- (IBAction)actionReset:(UIButton *)sender;


@end

