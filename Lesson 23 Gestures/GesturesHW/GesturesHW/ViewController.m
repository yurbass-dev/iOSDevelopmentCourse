//
//  ViewController.m
//  GesturesHW
//
//  Created by Yuriy on 01.12.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)


@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIImageView *imageView;
@property (assign, nonatomic) CGFloat currentAngleView;
@property (assign, nonatomic) CGFloat currentScaleView;

@end

@implementation ViewController

#pragma mark - Tasks
/*
 Ученик
 1. Добавьте квадратную картинку на вьюху вашего контроллера
 2. Если хотите, можете сделать ее анимированной
 
 Студент
 3. По тачу анимационно передвигайте картинку со ее позиции в позицию тача
 4. Если я вдруг делаю тач во время анимации, то картинка должна двигаться в новую точку без рывка (как будто она едет себе и все)
 
 Мастер
 5. Если я делаю свайп вправо, то давайте картинке анимацию поворота по часовой стрелке на 360 градусов
 6. То же самое для свайпа влево, только анимация должна быть против часовой (не забудьте остановить предыдущее кручение)
 7. По двойному тапу двух пальцев останавливайте анимацию
 
 Супермен
 8. Добавьте возможность зумить и отдалять картинку используя пинч
 9. Добавьте возможность поворачивать картинку используя ротейшн
 */

- (void)viewDidLoad {
    [super viewDidLoad];
 
#pragma mark - Pupil
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 130)];
    
    imageView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    
    imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
                                 UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

    NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < 6; i++) {
        [imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"Apple%lu", i + 1]]];
    }
    
    [self.view addSubview:imageView];
    imageView.animationImages = imagesArray;
    imageView.animationDuration = 3.f;
    [imageView startAnimating];
    
#pragma mark - Student
    
    self.imageView = imageView;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];

#pragma mark - Master
    
    UITapGestureRecognizer *doubleTapDoubleTouchesGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleDoubleTapDoubleTouches:)];
    doubleTapDoubleTouchesGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchesGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapDoubleTouchesGesture];
    [tapGesture requireGestureRecognizerToFail:doubleTapDoubleTouchesGesture];
    
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(handleSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(handleSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
#pragma mark - Superman
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self
                                                                                      action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
}


#pragma mark - Rotation

- (void)startRotateView:(UIView *)view withAngle:(double)angle andWithAnimationKey:(NSString *)key {
    
    CATransform3D transform = [(CALayer*)[view.layer presentationLayer] transform];
    double currentAngle = atan2(transform.m12, transform.m11);
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.fromValue = [NSNumber numberWithDouble:currentAngle];
    rotationAnimation.byValue = [NSNumber numberWithDouble:angle];
    rotationAnimation.duration = 2.5f;
    
    [view.layer addAnimation:rotationAnimation forKey:key];
}

- (void)stopRotateView:(UIView *)view withAnimationKey:(NSString *)key {
    
    if ([view.layer animationForKey:key] != nil) {
        CATransform3D transform = [(CALayer*)[view.layer presentationLayer] transform];
        view.layer.transform = transform;
        [view.layer removeAnimationForKey:key];
    }
}

#pragma mark - Gestures

- (void)handleTap:(UITapGestureRecognizer *)tapGesture {
     
    [UIImageView animateWithDuration:2.5f
                               delay:0.f
                             options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                          animations:^{
                              self.imageView.center = [tapGesture locationInView:self.view];
                          } completion:^(BOOL finished) {
                    
                          }];
}

- (void)handleDoubleTapDoubleTouches:(UITapGestureRecognizer *)doubleTapDoubleTouchesGesture {
    
    [self stopRotateView:self.imageView withAnimationKey:@"rotationAnimation"];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipeGesture {
    
    [self stopRotateView:self.imageView withAnimationKey:@"rotationAnimation"];
    
    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [self startRotateView:self.imageView
                    withAngle:(double) DEGREES_TO_RADIANS(360)
          andWithAnimationKey:@"rotationAnimation"];
    }
    else if (swipeGesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        [self startRotateView:self.imageView
                    withAngle:(double) DEGREES_TO_RADIANS(-360)
          andWithAnimationKey:@"rotationAnimation"];
    }
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinchGesture {
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.currentScaleView = 1.0f;
    }
    
    CGFloat scale = 1.0f - (self.currentScaleView - pinchGesture.scale);
    
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         self.imageView.transform = newTransform;
                     }];
    
    self.currentScaleView = pinchGesture.scale;
}

- (void)handleRotation:(UIRotationGestureRecognizer *)rotationGesture {
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.currentAngleView = 0.f;
        [self stopRotateView:self.imageView withAnimationKey:@"rotationAnimation"];
    }
    
    CGFloat angle = rotationGesture.rotation - self.currentAngleView;
    
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, angle);
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         self.imageView.transform = newTransform;
                     }];
    
    self.currentAngleView = rotationGesture.rotation;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}



@end
