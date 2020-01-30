//
//  ViewController.m
//  AnimationsHW
//
//  Created by Yuriy on 21.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Tasks
/*
Ученик.

1. Создайте 4 вьюхи у левого края ипада.
2. Ваша задача всех передвинуть горизонтально по прямой за одно и тоже время
3. Для каждой вьюхи используйте свою интерполяцию (EasyInOut, EasyIn и т.д.). Это для того, чтобы вы увидели разницу своими собственными глазами :)
4. Добавте реверсивную анимацию и бесконечные повторения
5. добавьте смену цвета на рандомный

Студент

5. Добавьте еще четыре квадратные вьюхи по углам - красную, желтую, зеленую и синюю
6. За одинаковое время и при одинаковой интерполяции двигайте их всех случайно, либо по, либо против часовой стрелки в другой угол.
7. Когда анимация закончиться повторите все опять: выберите направление и передвиньте всех :)
8. Вьюха должна принимать в новом углу цвет той вьюхи, что была здесь до него ;)

Мастер

8. Нарисуйте несколько анимационных картинок человечка, который ходит.
9. Добавьте несколько человечков на эту композицию и заставьте их ходить
*/

#pragma mark - Pupil
/*
- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 150, 100)];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 250, 150, 100)];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 150, 100)];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 550, 150, 100)];
    
    NSArray *viewsArray = @[view1, view2, view3, view4];
    
    for (UIView *view in viewsArray)
    {
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
    }
    
    [self moveView:view1 withOptions:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view2 withOptions:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view3 withOptions:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view4 withOptions:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
}

- (void)moveView:(UIView*)view withOptions:(UIViewAnimationOptions)options {
    
    [UIView animateWithDuration:5
                          delay:1
                        options:options
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, view.center.y);
                         view.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (UIColor*)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.f;
    CGFloat g = arc4random_uniform(256) / 255.f;
    CGFloat b = arc4random_uniform(256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}
*/

#pragma mark - Student
/*
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 150, 100)];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 250, 150, 100)];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 150, 100)];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 550, 150, 100)];
    
    CGFloat maxWidth = CGRectGetWidth(self.view.bounds);
    CGFloat maxHeight = CGRectGetHeight(self.view.bounds);
    CGFloat squareSize = 75.f;
    
    UIView *redSquareView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, squareSize, squareSize)];
    UIView *yellowSquareView = [[UIView alloc] initWithFrame:CGRectMake(maxWidth - squareSize, 0, squareSize, squareSize)];
    UIView *greenSquareView = [[UIView alloc] initWithFrame:CGRectMake(maxWidth - squareSize, maxHeight - squareSize, squareSize, squareSize)];
    UIView *blueSquareView = [[UIView alloc] initWithFrame:CGRectMake(0, maxHeight - squareSize, squareSize, squareSize)];
    
    
    NSArray *viewsArray = @[view1, view2, view3, view4];
    NSArray *squareViewsArray = @[redSquareView, yellowSquareView, greenSquareView, blueSquareView];
    NSArray *colorsArray = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]];
    
    for (UIView *view in viewsArray)
    {
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
    }
    
    for (NSUInteger i = 0; i < [squareViewsArray count]; i++)
    {
        UIView *view = [squareViewsArray objectAtIndex:i];
        view.backgroundColor = [colorsArray objectAtIndex:i];
        [self.view addSubview:view];
    }
    
    [self moveView:view1 withOptions:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view2 withOptions:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view3 withOptions:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view4 withOptions:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    
    [self moveSquareView:squareViewsArray];
}

- (void)moveSquareView:(NSArray*)squareViewsArray {
    
    NSArray *array;
    NSArray *reversedArray = [[squareViewsArray reverseObjectEnumerator] allObjects];
    
    if (arc4random_uniform(2))
        array = squareViewsArray;
    else
        array = reversedArray;

    [UIView animateWithDuration:4
                          delay:1
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                        UIColor *colorFirstSquare;
                        CGPoint centerFirstSquare;
                         
                        for (NSUInteger i = 0; i < [array count]; i++)
                        {
                            UIView *view = [array objectAtIndex:i];
                            UIView *nextView = [[UIView alloc] init];
                            
                            if (i == 0)
                            {
                                UIView *view = [array firstObject];
                                centerFirstSquare = view.center;
                                colorFirstSquare = view.backgroundColor;
                            }
                            
                            if (i != [array count] - 1)
                                nextView = [array objectAtIndex:i + 1];
                            else
                            {
                                nextView.center = centerFirstSquare;
                                nextView.backgroundColor = colorFirstSquare;
                            }
                     
                            view.center = nextView.center;
                            view.backgroundColor = nextView.backgroundColor;
                        }
                     }
                     completion:^(BOOL finished) {
                         __weak NSArray *array = squareViewsArray;
                         [self moveSquareView:array];
                     }];
}

- (void)moveView:(UIView*)view withOptions:(UIViewAnimationOptions)options {
    
    [UIView animateWithDuration:5
                          delay:1
                        options:options
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, view.center.y);
                         view.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (UIColor*)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.f;
    CGFloat g = arc4random_uniform(256) / 255.f;
    CGFloat b = arc4random_uniform(256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}
*/

#pragma mark - Master

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 500, 75, 125)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 630, 75, 125)];
    
    UIImage *image1 = [UIImage imageNamed:@"1.png"];
    UIImage *image2 = [UIImage imageNamed:@"2.png"];
    UIImage *image3 = [UIImage imageNamed:@"3.png"];
    UIImage *image4 = [UIImage imageNamed:@"4.png"];
    UIImage *image5 = [UIImage imageNamed:@"5.png"];
    UIImage *image6 = [UIImage imageNamed:@"6.png"];
    UIImage *image7 = [UIImage imageNamed:@"7.png"];
    UIImage *image8 = [UIImage imageNamed:@"8.png"];
    
    NSArray *imagesArray = @[image1, image2, image3, image4, image5, image6, image7, image8];
    
    imageView1.animationImages = imagesArray;
    imageView1.animationDuration = 1.f;
    [imageView1 startAnimating];
    
    imageView2.animationImages = imagesArray;
    imageView2.animationDuration = 1.5f;
    [imageView2 startAnimating];
    
    [self.view addSubview:imageView1];
    [self moveView:imageView1 withOptions:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    
    [self.view addSubview:imageView2];
    [self moveView:imageView2 withOptions:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 150, 100)];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 185, 150, 100)];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 290, 150, 100)];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 395, 150, 100)];
    
    CGFloat maxWidth = CGRectGetWidth(self.view.bounds);
    CGFloat maxHeight = CGRectGetHeight(self.view.bounds);
    CGFloat squareSize = 75.f;
    
    UIView *redSquareView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, squareSize, squareSize)];
    UIView *yellowSquareView = [[UIView alloc] initWithFrame:CGRectMake(maxWidth - squareSize, 0, squareSize, squareSize)];
    UIView *greenSquareView = [[UIView alloc] initWithFrame:CGRectMake(maxWidth - squareSize, maxHeight - squareSize, squareSize, squareSize)];
    UIView *blueSquareView = [[UIView alloc] initWithFrame:CGRectMake(0, maxHeight - squareSize, squareSize, squareSize)];
    
    
    NSArray *viewsArray = @[view1, view2, view3, view4];
    NSArray *squareViewsArray = @[redSquareView, yellowSquareView, greenSquareView, blueSquareView];
    NSArray *colorsArray = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]];
    
    for (UIView *view in viewsArray)
    {
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
    }
    
    for (NSUInteger i = 0; i < [squareViewsArray count]; i++)
    {
        UIView *view = [squareViewsArray objectAtIndex:i];
        view.backgroundColor = [colorsArray objectAtIndex:i];
        [self.view addSubview:view];
    }
    
    [self moveView:view1 withOptions:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view2 withOptions:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view3 withOptions:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view4 withOptions:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    
    [self moveSquareView:squareViewsArray];
}

- (void)moveSquareView:(NSArray*)squareViewsArray {
    
    NSArray *array;
    NSArray *reversedArray = [[squareViewsArray reverseObjectEnumerator] allObjects];
    
    if (arc4random_uniform(2))
        array = squareViewsArray;
        else
            array = reversedArray;
            
            [UIView animateWithDuration:4
                                  delay:1
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 UIColor *colorFirstSquare;
                                 CGPoint centerFirstSquare = CGPointZero;
                                 
                                 for (NSUInteger i = 0; i < [array count]; i++)
                                 {
                                     UIView *view = [array objectAtIndex:i];
                                     UIView *nextView = [[UIView alloc] init];
                                     
                                     if (i == 0)
                                     {
                                         UIView *view = [array firstObject];
                                         centerFirstSquare = view.center;
                                         colorFirstSquare = view.backgroundColor;
                                     }
                                     
                                     if (i != [array count] - 1)
                                         nextView = [array objectAtIndex:i + 1];
                                     else
                                     {
                                         nextView.center = centerFirstSquare;
                                         nextView.backgroundColor = colorFirstSquare;
                                     }
                                     
                                     view.center = nextView.center;
                                     view.backgroundColor = nextView.backgroundColor;
                                 }
                             }
                             completion:^(BOOL finished) {
                                 __weak NSArray *array = squareViewsArray;
                                 [self moveSquareView:array];
                             }];
}

- (void)moveView:(UIView*)view withOptions:(UIViewAnimationOptions)options {
    
    [UIView animateWithDuration:5
                          delay:1
                        options:options
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, view.center.y);
                         view.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (UIColor*)randomColor {
    
    CGFloat r = arc4random_uniform(256) / 255.f;
    CGFloat g = arc4random_uniform(256) / 255.f;
    CGFloat b = arc4random_uniform(256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


@end
