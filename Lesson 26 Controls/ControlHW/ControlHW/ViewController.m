//
//  ViewController.m
//  ControlHW
//
//  Created by Yuriy on 13.01.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)
#define ANGLE 360.f
#define SCALE 1.5f

@interface ViewController ()

@property (assign, nonatomic) CATransform3D rotationTransform;
@property (assign, nonatomic) CATransform3D scaleTransform;
@property (assign, nonatomic) BOOL isScaleIncrease;
@property (assign, nonatomic) BOOL isFirstScaleAnimation;
@property (assign, nonatomic) CGFloat inverseSpeedSlider;

@end

@implementation ViewController

#pragma mark - Tasks
 /*
 Ученик.
 
 1. Расположите тестируюмую вьюху на верхней половине экрана
 2. На нижней половине создайте 3 свича: Rotation, Scale, Translation. По умолчанию все 3 выключены
 3. Также создайте сладер скорость, со значениями от 0.5 до 2, стартовое значение 1
 4. Создайте соответствующие проперти для свитчей и слайдера, а также методы для события valueChanged
 
 Студент.
 
 5. Добавьте сегментед контрол с тремя разными сегментами
 6. Они должны соответствовать трем разным картинкам, которые вы должны добавить
 7. Когда переключаю сегменты, то картинка должна меняться на соответствующую
 
 Мастер.
 
 8. Как только мы включаем один из свичей, наша вьюха должна начать соответствующую анимацию
 (либо поворот, либо скеил, либо перенос). Используйте свойство transform из урока об анимациях
 9. Так же следует помнить, что если вы переключили свич, но какойто другой включен одновременно с ним, то вы должны делать уже двойную анимацию. Например и увеличение и поворот одновременно (из урока про анимации)
 10. Анимации должны быть бесконечно повторяющимися, единственное что их может остановить, так это когда все три свича выключены
 
 Супермен.
 
 11. Добавляем использование слайдера. Слайдер регулирует скорость. То есть когда значение на 0.5, то скорость анимаций должна быть в два раза медленнее, а если на 2, то в два раза быстрее обычной.
 12. Попробуйте сделать так, чтобы когда двигался слайдер, то анимация обновлялась без прерывания, а скорость изменялась в соответствующую сторону.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.speedLabel.text = [NSString stringWithFormat:@"Speed: %.2f", self.speedSlider.value];
    self.inverseSpeedSlider = 1.0f / self.speedSlider.value;
}

#pragma mark - Additional Methods

- (CGPoint)getRandomCenterPointOnView:(UIView *)view thatContainsImageView:(UIImageView *)imageView {
    
    CGPoint randomCenterPoint = CGPointMake(CGRectGetMidX(imageView.frame), CGRectGetMidY(imageView.frame));
    NSInteger i = 0;
    
    while (i < 20) {
        
        randomCenterPoint = CGPointMake(arc4random_uniform((uint32_t)CGRectGetMaxX(view.bounds)),
                                        arc4random_uniform((uint32_t)CGRectGetMaxY(view.bounds)));
        
        CGRect randomRect = CGRectMake(randomCenterPoint.x - CGRectGetWidth(imageView.frame) / 2.f,
                                       randomCenterPoint.y - CGRectGetHeight(imageView.frame) / 2.f,
                                       CGRectGetWidth(imageView.frame),
                                       CGRectGetHeight(imageView.frame));
        
        if (CGRectContainsRect(view.bounds, randomRect)) {
            break;
        }
        i++;
    }
    
    return randomCenterPoint;
}

#pragma mark - Animations

- (void)startRotationAnimationImageView:(UIImageView *)imageView withDuration:(CGFloat)duration andWithAnimationKey:(NSString *)key {
    
    [CATransaction begin];
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    rotationAnimation.duration = duration;
    rotationAnimation.byValue = @(DEGREES_TO_RADIANS(ANGLE));
    
    [CATransaction setCompletionBlock:^{
        
        if (self.rotationSwitch.isOn) {
            [self startRotationAnimationImageView:imageView withDuration:self.inverseSpeedSlider andWithAnimationKey:key];
        }
    }];
    
    [imageView.layer addAnimation:rotationAnimation forKey:key];
    [CATransaction commit];
}

- (void)startScaleAnimationImageView:(UIImageView *)imageView withDuration:(CGFloat)duration andWithAnimationKey:(NSString *)key {
    
    [CATransaction begin];
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CGFloat currentScale = [[imageView.layer valueForKeyPath:@"transform.scale"] floatValue];
    
    scaleAnimation.duration = duration;
    
    if (self.isScaleIncrease) {
        
        if (self.isFirstScaleAnimation) {
            scaleAnimation.fromValue = @(currentScale);
            self.isFirstScaleAnimation = NO;
        }
        else {
            scaleAnimation.fromValue = @(1.0f);
        }
        scaleAnimation.toValue = @(SCALE);
    }
    else {
        scaleAnimation.fromValue = @(SCALE);
        scaleAnimation.toValue = @(1.0f);
    }
    
    [CATransaction setCompletionBlock:^{
        
        if (self.scaleSwitch.isOn) {
            self.isScaleIncrease = self.isScaleIncrease ? NO : YES;
            [self startScaleAnimationImageView:imageView withDuration:self.inverseSpeedSlider andWithAnimationKey:key];
        }
    }];
    
    [imageView.layer addAnimation:scaleAnimation forKey:key];
    [CATransaction commit];
}

- (void)startTranslationAnimationImageView:(UIImageView *)imageView onView:(UIView *)view withDuration:(CGFloat)duration
                       andWithAnimationKey:(NSString *)key {
 
    [CATransaction begin];
    NSValue *currentPosition = [imageView.layer valueForKeyPath:@"position"];
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint randomCenterPoint = [self getRandomCenterPointOnView:view thatContainsImageView:imageView];
    
    positionAnimation.duration = duration;
    positionAnimation.fromValue = currentPosition;
    positionAnimation.toValue = @(randomCenterPoint);
    imageView.layer.position = randomCenterPoint;
    
    [CATransaction setCompletionBlock:^{
        
        if (self.translationSwitch.isOn) {
            [self startTranslationAnimationImageView:imageView onView:view withDuration:self.inverseSpeedSlider andWithAnimationKey:key];
        }
    }];
    
    [imageView.layer addAnimation:positionAnimation forKey:key];
    [CATransaction commit];
}
- (void)stopAnimationImageView:(UIImageView *)imageView withAnimationKey:(NSString *)key {
    
    if ([imageView.layer animationForKey:key] != nil) {
        
        CATransform3D transform = [[imageView.layer presentationLayer] transform];
        CGFloat currentAngle = atan2(transform.m12, transform.m11);
        CGFloat currentScale = transform.m33;
        
        self.rotationTransform = CATransform3DMakeRotation(currentAngle, 0.0f, 0.0f, 1.0f);
        self.scaleTransform = CATransform3DMakeScale(currentScale, currentScale, currentScale);
        
        imageView.layer.transform = CATransform3DConcat(self.rotationTransform, self.scaleTransform);
        [imageView.layer removeAnimationForKey:key];
    }
}

- (void)stopTranslationAnimationImageView:(UIImageView *)imageView withAnimationKey:(NSString *)key {
    
    if ([imageView.layer animationForKey:key] != nil) {
        
        imageView.layer.position = [[imageView.layer presentationLayer] position];
        [imageView.layer removeAnimationForKey:key];
    }
}

#pragma mark - Actions

- (IBAction)actionRotation:(UISwitch *)sender {
    
    if (sender.isOn) {
        
        [self startRotationAnimationImageView:self.imageView withDuration:self.inverseSpeedSlider
                          andWithAnimationKey:@"rotationAnimation"];
    }
    else {
        [self stopAnimationImageView:self.imageView withAnimationKey:@"rotationAnimation"];
    }
}

- (IBAction)actionScale:(UISwitch *)sender {

    if (sender.isOn) {
        
        self.isScaleIncrease = YES;
        self.isFirstScaleAnimation = YES;
        [self startScaleAnimationImageView:self.imageView withDuration:self.inverseSpeedSlider
                       andWithAnimationKey:@"scaleAnimation"];
    }
    else {
        [self stopAnimationImageView:self.imageView withAnimationKey:@"scaleAnimation"];
        self.isFirstScaleAnimation = YES;
    }
}

- (IBAction)actionTranslation:(UISwitch *)sender {
    
    if (sender.isOn) {
        
        [self startTranslationAnimationImageView:self.imageView onView:self.viewForImage withDuration:self.inverseSpeedSlider                andWithAnimationKey:@"positionAnimation"];
    }
    else {
        [self stopTranslationAnimationImageView:self.imageView withAnimationKey:@"positionAnimation"];
    }
}

- (IBAction)actionChangeImage:(UISegmentedControl *)sender {
    
    UIImage *image = nil;
    
    switch (sender.selectedSegmentIndex) {
        case YCImageNameApple:
            image = [UIImage imageNamed:@"Apple.jpg"];
            break;
        case YCImageNameAndroid:
            image = [UIImage imageNamed:@"Android.jpg"];
            break;
        case YCImageNameWindows:
            image = [UIImage imageNamed:@"Windows.jpg"];
            break;
    }
    
    self.imageView.image = image;
}

- (IBAction)actionSpeed:(UISlider *)sender {
    
    self.speedLabel.text = [NSString stringWithFormat:@"Speed: %.2f", sender.value];
    self.inverseSpeedSlider = 1.0f / sender.value;
}

- (IBAction)actionReset:(UIButton *)sender {
    
    self.rotationSwitch.on = NO;
    self.scaleSwitch.on = NO;
    self.translationSwitch.on = NO;
    
    [self stopAnimationImageView:self.imageView withAnimationKey:@"rotationAnimation"];
    [self stopAnimationImageView:self.imageView withAnimationKey:@"scaleAnimation"];
    [self stopTranslationAnimationImageView:self.imageView withAnimationKey:@"positionAnimation"];
    
    self.imageView.layer.transform = CATransform3DIdentity;
    self.imageView.layer.position = CGPointMake(CGRectGetMidX(self.viewForImage.bounds), CGRectGetMidY(self.viewForImage.bounds));
    
    self.changeImageControl.selectedSegmentIndex = 0;
    self.imageView.image = [UIImage imageNamed:@"Apple.jpg"];
    
    self.speedSlider.value = 1.0f;
    self.inverseSpeedSlider = 1.0f / self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"Speed: %.2f", self.speedSlider.value];
}

@end
