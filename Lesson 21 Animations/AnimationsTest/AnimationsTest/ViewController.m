//
//  ViewController.m
//  AnimationsTest
//
//  Created by Yuriy on 20.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

@interface ViewController ()

@property (weak, nonatomic) UIView *testView;

@property (weak, nonatomic) UIImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.backgroundColor = [UIColor clearColor];
    
    
    UIImage *image1 = [UIImage imageNamed:@"1.png"];
    UIImage *image2 = [UIImage imageNamed:@"2.png"];
    UIImage *image3 = [UIImage imageNamed:@"3.png"];
    
    NSArray *imagesArray = @[image1, image2, image1, image3];
    
    imageView.animationImages = imagesArray;
    imageView.animationDuration = 1.f;
    [imageView startAnimating];
    
    [self.view addSubview:imageView];
    
    self.testImageView = imageView;
    /*
     UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
     view.backgroundColor = [UIColor greenColor];
     [self.view addSubview:view];
     
     self.testView = view;
     */
    
    
    /*
     [UIView animateWithDuration:5
     animations:^{
     view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, 150);
     }];
     */
    
    
    /*
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     [view.layer removeAllAnimations];
     
     [UIView animateWithDuration:4
     delay:0
     options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
     animations:^{
     view.center = CGPointMake(500, 500);
     }
     completion:^(BOOL finished) {
     NSLog(@"animation finished!  %d", finished);
     }];
     });
     */
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //[self moveView:self.testView];
    [self moveView:self.testImageView];
}

- (UIColor*)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.f;
    CGFloat g = arc4random_uniform(256) / 255.f;
    CGFloat b = arc4random_uniform(256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void)moveView:(UIView*) view {
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    NSLog(@"rect frame %@", NSStringFromCGRect(rect));
    
    CGFloat x = arc4random_uniform((uint32_t)CGRectGetWidth(rect) + CGRectGetMinX(rect));
    CGFloat y = arc4random_uniform((uint32_t)CGRectGetHeight(rect) + CGRectGetMinY(rect));
    
    // scale from 0.5 to 2.0
    CGFloat s = arc4random_uniform(151) / 100.f + 0.5f;
    // rotation from -180 to 180 degrees in radians
    CGFloat r = DEGREES_TO_RADIANS(arc4random_uniform(180 * 2 + 1) - 180);
    // duration from 2.0 to 4.0
    CGFloat d = arc4random_uniform(20000 + 1) / 10000.f + 2.f;
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear /*| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse*/
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                         
//                         view.transform = CGAffineTransformMakeScale(2, 0.5);
//                         view.transform = CGAffineTransformMakeRotation(M_PI);
//                         view.transform = CGAffineTransformMakeTranslation(800, 0);
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished!  %d", finished);
                         NSLog(@"\nview frame %@\nview bounds %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView *v = view;
                         [self moveView:v];
                     }];
}
/*
- (void)moveView:(UIView*) view {
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    NSLog(@"rect frame %@", NSStringFromCGRect(rect));
    
    CGFloat x = arc4random_uniform((uint32_t)CGRectGetWidth(rect) + CGRectGetMinX(rect));
    CGFloat y = arc4random_uniform((uint32_t)CGRectGetHeight(rect) + CGRectGetMinY(rect));
    
    // scale from 0.5 to 2.0
    CGFloat s = arc4random_uniform(151) / 100.f + 0.5f;
    // rotation from -180 to 180 degrees in radians
    CGFloat r = DEGREES_TO_RADIANS(arc4random_uniform(180 * 2 + 1) - 180);
    // duration from 2.0 to 4.0
    CGFloat d = arc4random_uniform(20000 + 1) / 10000.f + 2.f;
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                         
                         //                         view.transform = CGAffineTransformMakeScale(2, 0.5);
                         //                         view.transform = CGAffineTransformMakeRotation(M_PI);
                         //                         view.transform = CGAffineTransformMakeTranslation(800, 0);
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished!  %d", finished);
                         NSLog(@"\nview frame %@\nview bounds %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView *v = view;
                         [self moveView:v];
                     }];
}
*/
/*
- (void)moveView:(UIView*) view {

    [UIView animateWithDuration:10
                          delay:1
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, view.center.y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(2, 0.5);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                         
                         //                         view.transform = CGAffineTransformMakeScale(2, 0.5);
                         //                         view.transform = CGAffineTransformMakeRotation(M_PI);
                         //                         view.transform = CGAffineTransformMakeTranslation(800, 0);
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished!  %d", finished);
                         NSLog(@"\nview frame %@\nview bounds %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                     }];
}
*/








@end
