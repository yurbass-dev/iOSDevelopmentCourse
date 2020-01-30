//
//  ViewController.m
//  TouchesTest
//
//  Created by Yuriy on 24.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *testView;
@property (weak, nonatomic) UIView *draggingView;
@property (assign, nonatomic) CGPoint touchOffSet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    */
    
    for (NSUInteger i = 0; i < 8; i++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10 + 110 * i, 100, 100, 100)];
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
    }
    
    //self.testView = view;
    
    //self.view.multipleTouchEnabled = YES;
}

#pragma mark - Touches

- (void)logTouches:(NSSet<UITouch *> *)touches withMethod:(NSString *) nameMethod {
    
    NSMutableString *string = [[NSMutableString alloc] initWithString:nameMethod];
    
    for (UITouch *touch in touches) {
        
        CGPoint point = [touch locationInView:self.view];
        [string appendFormat:@" %@", NSStringFromCGPoint(point)];
    }
    
    NSLog(@"%@", string);
}

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.f
                           green:arc4random_uniform(256) / 255.f
                            blue:arc4random_uniform(256) / 255.f
                           alpha:1.f];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    [self logTouches:touches withMethod:@"touchesBegan"];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint pointOnMainView = [touch locationInView:self.view];
    
    UIView *view = [self.view hitTest:pointOnMainView withEvent:event];
    
    if (![view isEqual:self.view]) {
        
        self.draggingView = view;
        
        [self.view bringSubviewToFront:self.draggingView];
        
        CGPoint touchPoint = [touch locationInView:self.draggingView];
        
        self.touchOffSet = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
        
        [UIView animateWithDuration:0.3f
                         animations:^{
                             self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                             self.draggingView.alpha = 0.3f;
                         }];
    }
    else {
        self.draggingView = nil;
    }
    
    
    //NSLog(@"inside = %d", [self.testView pointInside:pointOnMainView withEvent:event]);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    [self logTouches:touches withMethod:@"touchesMoved"];
    
    if (self.draggingView) {
        
        UITouch *touch = [touches anyObject];
        
        CGPoint pointOnMainView = [touch locationInView:self.view];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffSet.x, pointOnMainView.y + self.touchOffSet.y);
        
        self.draggingView.center = correction;
    }
    else {
        self.draggingView = nil;
    }
}

- (void) onTouchesEnded {
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity;
                         self.draggingView.alpha = 1.f;
                     }];
    
    self.draggingView = nil;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    [self logTouches:touches withMethod:@"touchesEnded"];
    
    [self onTouchesEnded];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    [self logTouches:touches withMethod:@"touchesCancelled"];
    
    [self onTouchesEnded];
}


@end
