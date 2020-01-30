//
//  ViewController.h
//  ButtonsTest
//
//  Created by Yuriy on 23.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;

- (IBAction)actionTest2:(UIButton *)sender;

- (IBAction)actionTestTouchDown:(UIButton *)sender;

@end

