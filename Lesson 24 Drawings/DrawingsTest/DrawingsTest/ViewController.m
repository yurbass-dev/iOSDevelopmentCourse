//
//  ViewController.m
//  DrawingsTest
//
//  Created by Yuriy on 07.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "YCDrawingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [self.drawingView setNeedsDisplay];
}




@end
