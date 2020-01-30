//
//  ViewController.m
//  GesturesTest
//
//  Created by Yuriy on 30.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIView *testView;
@property (assign, nonatomic) CGFloat testViewScale;
@property (assign, nonatomic) CGFloat testViewRotation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50,
                                                            CGRectGetMidY(self.view.bounds) - 50,
                                                            100, 100)];
    
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    self.testView = view;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handleDoubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:doubleTapGesture];
    
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    
    UITapGestureRecognizer *doubleTapDoubleTouchGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                  action:@selector(handleDoubleTapDoubleTouch:)];
    doubleTapDoubleTouchGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchGesture.numberOfTouchesRequired = 2;
    
    [self.view addGestureRecognizer:doubleTapDoubleTouchGesture];
    
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGesture];
    
    
    UISwipeGestureRecognizer *verticalSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                               action:@selector(handleVerticalSwipe:)];
    
    verticalSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:verticalSwipeGesture];
    
    
    UISwipeGestureRecognizer *horizontalSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                               action:@selector(handleHorizontalSwipe:)];
    
    horizontalSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:horizontalSwipeGesture];
}

#pragma mark - Methods

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.f
                           green:arc4random_uniform(256) / 255.f
                            blue:arc4random_uniform(256) / 255.f
                           alpha:1.f];
}

#pragma mark - Gestures

- (void)scaleAndAnimateView:(UIView *)view withScaleX:(CGFloat)sx withScaleY:(CGFloat)sy andDuration:(CGFloat)duration {
    
    CGAffineTransform currentTransform = view.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, sx, sy);
    
    [UIView animateWithDuration:duration
                     animations:^{
                         view.transform = newTransform;
                     }];
    
    self.testViewScale = sx;
}

- (void)handleTap:(UITapGestureRecognizer *)tapGesture {
    
    NSLog(@"Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    self.testView.backgroundColor = [self randomColor];
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)doubleTapGesture {
    
    NSLog(@"Double tap: %@", NSStringFromCGPoint([doubleTapGesture locationInView:self.view]));
    
    [self scaleAndAnimateView:self.testView withScaleX:1.2f withScaleY:1.2f andDuration:0.3f];
}

- (void)handleDoubleTapDoubleTouch:(UITapGestureRecognizer *)doubleTapDoubleTouchGesture {
    
    NSLog(@"Double tap double touches: %@", NSStringFromCGPoint([doubleTapDoubleTouchGesture locationInView:self.view]));

    [self scaleAndAnimateView:self.testView withScaleX:0.8f withScaleY:0.8f andDuration:0.3f];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinchGesture {
    
    NSLog(@"Pinch %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
    CGFloat newScale = 1.f + pinchGesture.scale - self.testViewScale;
    [self scaleAndAnimateView:self.testView withScaleX:newScale withScaleY:newScale andDuration:0.1f];
    self.testViewScale = pinchGesture.scale;
}

- (void)handleRotation:(UIRotationGestureRecognizer *)rotationGesture {
    
    NSLog(@"Rotation %1.3f", rotationGesture.rotation);
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0.f;
    }
    
    CGFloat newRotation =  rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, newRotation);
    
    self.testView.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
}

- (void)handlePan:(UIPanGestureRecognizer *)panGesture {
    
    NSLog(@"Pan");
    
    self.testView.center = [panGesture locationInView:self.view];
}

- (void)handleVerticalSwipe:(UISwipeGestureRecognizer *)swipeGesture {
    
    NSLog(@"Vertical Swipe");
}

- (void)handleHorizontalSwipe:(UISwipeGestureRecognizer *)swipeGesture {
    
    NSLog(@"Horizontal Swipe");
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
        shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}



@end
