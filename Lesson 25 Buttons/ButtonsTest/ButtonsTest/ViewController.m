//
//  ViewController.m
//  ButtonsTest
//
//  Created by Yuriy on 23.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    button.frame = CGRectMake(200.f, 200.f, 200.f, 200.f);
    button.backgroundColor = [UIColor lightGrayColor];
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitle:@"Button Pressed" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    /*
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30.f],
                                 NSForegroundColorAttributeName: [UIColor orangeColor]};
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
    
    [button setAttributedTitle:title forState:UIControlStateNormal];
    
    NSDictionary *attributes2 = @{NSFontAttributeName: [UIFont systemFontOfSize:20.f],
                                 NSForegroundColorAttributeName: [UIColor redColor]};
    
    NSAttributedString *title2 = [[NSAttributedString alloc] initWithString:@"Button Pressed" attributes:attributes2];
    
    [button setAttributedTitle:title2 forState:UIControlStateHighlighted];
    */
    
//    UIEdgeInsets insets = UIEdgeInsetsMake(100.f, 200.f, 0.f, 0.f);
//    button.titleEdgeInsets = insets;
    
//    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(actionTest:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(actionTestOutside:) forControlEvents:UIControlEventTouchUpOutside];
    
}

- (void)actionTest:(UIButton *)button {
    
    NSLog(@"Button Pressed Inside");
}

- (void)actionTestOutside:(UIButton *)button {
    
    NSLog(@"Button Pressed Outside");
}


- (IBAction)actionTest2:(UIButton *)sender {
    
    NSLog(@"actionTest2 tag = %ld", sender.tag);
    
    self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", sender.tag];
}

- (IBAction)actionTestTouchDown:(UIButton *)sender {
    
   // NSLog(@"actionTestTouchDown");
}

@end
