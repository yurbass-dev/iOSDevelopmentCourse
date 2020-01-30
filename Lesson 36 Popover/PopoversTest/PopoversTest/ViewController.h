//
//  ViewController.h
//  PopoversTest
//
//  Created by Yuriy on 04.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPopoverPresentationControllerDelegate>

- (IBAction)actionAdd:(UIBarButtonItem *)sender;
- (IBAction)actionPressMe:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *viewTest;

@end

