//
//  ViewController.m
//  ViewsHW
//
//  Created by Yuriy on 08.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *boardView;
@property (strong, nonatomic) NSMutableArray *whiteCheckers;
@property (strong, nonatomic) NSMutableArray *redCheckers;


@end

@implementation ViewController

#pragma mark - Tasks
    /*
     Ученик
     
     1. В цикле создавайте квадратные UIView с черным фоном и расположите их в виде шахматной доски
     2. доска должна иметь столько клеток, как и настоящая шахматная
     
     Студент
     
     3. Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
     4. Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не вылетало за пределы экрана.
     
     Мастер
     5. При повороте устройства все черные клетки должны менять цвет :)
     6.Сделайте так, чтобы доска при поворотах всегда строго находилась по центру
     
     Супермен
     8. Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске. Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
     9. После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView
    */

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - Pupil
    /*
    CGFloat sizeBoard;
    CGFloat sizeSquare;
    CGFloat maxWidth = CGRectGetWidth(self.view.frame);
    CGFloat maxHeight = CGRectGetHeight(self.view.frame);

    if (maxWidth <= maxHeight)
        sizeBoard = maxWidth - 50;
    else
        sizeBoard = maxHeight - 50;
    
    UIView *boardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBoard, sizeBoard)];
    
    sizeSquare = sizeBoard / 8;
    
    boardView.backgroundColor = [UIColor brownColor];
    
    boardView.center = self.view.center;
    
    boardView.autoresizingMask =        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |
                                        UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:boardView];
    
    CGRect rect = CGRectMake(0, 0, sizeSquare, sizeSquare);
    
    
    for (NSUInteger i = 0; i < 8; i++)
    {
        if (i == 0)
            rect.origin.x += sizeSquare;
        else if (i != 0 && i % 2 == 0)
        {
            rect.origin.x += sizeSquare;
            rect.origin.y += sizeSquare;
        }
        else
            rect.origin.y += sizeSquare;
        
        for (NSUInteger j = 0; j < 4; j++)
        {
            UIView *view = [[UIView alloc] initWithFrame:rect];
            view.backgroundColor = [UIColor blackColor];
            [boardView addSubview:view];
            
            rect.origin.x += sizeSquare + sizeSquare;
        }
        rect.origin.x = 0;
    }
    */
#pragma mark - Student
    /*
    CGFloat sizeBoard;
    CGFloat sizeSquare;
    CGFloat maxWidth = CGRectGetWidth(self.view.frame);
    CGFloat maxHeight = CGRectGetHeight(self.view.frame);
    
    if (maxWidth <= maxHeight)
        sizeBoard = maxWidth;
    else
        sizeBoard = maxHeight;
    
    UIView *boardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBoard, sizeBoard)];
    
    sizeSquare = sizeBoard / 8;
    
    boardView.backgroundColor = [UIColor brownColor];
    
    boardView.center = self.view.center;
    
    boardView.autoresizingMask =        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:boardView];
    
    CGRect rect = CGRectMake(0, 0, sizeSquare, sizeSquare);
    
    
    for (NSUInteger i = 0; i < 8; i++)
    {
        if (i == 0)
            rect.origin.x += sizeSquare;
        else if (i != 0 && i % 2 == 0)
        {
            rect.origin.x += sizeSquare;
            rect.origin.y += sizeSquare;
        }
        else
            rect.origin.y += sizeSquare;
        
        for (NSUInteger j = 0; j < 4; j++)
        {
            UIView *view = [[UIView alloc] initWithFrame:rect];
            view.backgroundColor = [UIColor blackColor];
            [boardView addSubview:view];
            
            rect.origin.x += sizeSquare + sizeSquare;
        }
        rect.origin.x = 0;
    }
    */
#pragma mark - Master
    /*
    CGFloat sizeBoard;
    CGFloat sizeSquare;
    CGFloat maxWidth = CGRectGetWidth(self.view.frame) - 50;
    CGFloat maxHeight = CGRectGetHeight(self.view.frame) - 50;
    
    if (maxWidth <= maxHeight)
        sizeBoard = maxWidth;
    else
        sizeBoard = maxHeight;
    
    self.boardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBoard, sizeBoard)];
    
    sizeSquare = sizeBoard / 8;
    
    self.boardView.backgroundColor = [UIColor brownColor];
    
    self.boardView.center = self.view.center;
    
    self.boardView.autoresizingMask =        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |
                                             UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:self.boardView];
    
    CGRect rect = CGRectMake(0, 0, sizeSquare, sizeSquare);
    
    
    for (NSUInteger i = 0; i < 8; i++)
    {
        if (i == 0)
            rect.origin.x += sizeSquare;
        else if (i != 0 && i % 2 == 0)
        {
            rect.origin.x += sizeSquare;
            rect.origin.y += sizeSquare;
        }
        else
            rect.origin.y += sizeSquare;
        
        for (NSUInteger j = 0; j < 4; j++)
        {
            UIView *squareView = [[UIView alloc] initWithFrame:rect];
            squareView.backgroundColor = [UIColor blackColor];
            [self.boardView addSubview:squareView];
            
            rect.origin.x += sizeSquare + sizeSquare;
        }
        rect.origin.x = 0;
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    __weak UIView *boardViewWeak = self.boardView;
    __block UIColor *color;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];

        if (UIInterfaceOrientationIsPortrait(orientation))
            color = [UIColor blackColor];
        else if (UIInterfaceOrientationIsLandscape(orientation))
            color = [UIColor purpleColor];
        
        for (UIView *view in boardViewWeak.subviews)
            view.backgroundColor = color;
    }];
    */
#pragma mark - Superman
    
    self.whiteCheckers = [NSMutableArray array];
    self.redCheckers =   [NSMutableArray array];
    
    CGFloat cellSize;
    CGFloat offset = 50.f;
    CGFloat sizeBoard = MIN(CGRectGetWidth(self.view.frame) - offset, CGRectGetHeight(self.view.frame) - offset);
    
    self.boardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBoard, sizeBoard)];
    
    self.boardView.backgroundColor = [UIColor brownColor];
    
    self.boardView.center = self.view.center;
    
    self.boardView.autoresizingMask =      UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |
                                           UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:self.boardView];
    
    cellSize = sizeBoard / 8;
    
    
    for (NSUInteger i = 0; i < 8; i++) {
        for (NSUInteger j = 0; j < 8; j++) {
            if (i % 2 != j % 2) {
                CGRect cellRect = CGRectMake(CGRectGetMinX(self.boardView.bounds) + i * cellSize,
                                             CGRectGetMinY(self.boardView.bounds) + j * cellSize,
                                             cellSize, cellSize);
                
                UIView *cellView = [[UIView alloc] initWithFrame:cellRect];
                cellView.backgroundColor = [UIColor blackColor];
                [self.boardView addSubview:cellView];
        
                if (j < 3) {
                    [self.whiteCheckers addObject: [self addCheckerOnParentView:self.boardView
                                                                       withRect:cellRect
                                                                       andColor:[UIColor whiteColor]]];
                }
                else if (j > 4) {
                    [self.redCheckers addObject: [self addCheckerOnParentView:self.boardView
                                                                     withRect:cellRect
                                                                     andColor:[UIColor redColor]]];
                }
            }
        }
    }
}

- (UIView *)addCheckerOnParentView:(UIView*)parentView withRect:(CGRect)rect andColor:(UIColor*)color {

    UIView *checkerView = [[UIView alloc] initWithFrame:CGRectMake(rect.origin.x + 10, rect.origin.y + 10, rect.size.height - 20, rect.size.width - 20)];
    checkerView.backgroundColor = color;
    [parentView addSubview:checkerView];

    return checkerView;
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {

    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {

        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];

        UIColor *color;

        if (UIInterfaceOrientationIsPortrait(orientation)) {
            color = [UIColor blackColor];
        }
        else if (UIInterfaceOrientationIsLandscape(orientation)) {
            color = [UIColor purpleColor];
        }

        for (UIView *view in self.boardView.subviews)
        {
            if ([view.backgroundColor isEqual:[UIColor blackColor]] || [view.backgroundColor isEqual:[UIColor purpleColor]])
                view.backgroundColor = color;
        }

        for (NSUInteger i = 0; i < [self.whiteCheckers count]; i++)
        {
            NSUInteger randomIndex = arc4random_uniform((uint32_t)[self.redCheckers count]);
            UIView *whiteCheckerView = [self.whiteCheckers objectAtIndex:i];
            UIView *redCheckerView = [self.redCheckers objectAtIndex:randomIndex];

            [UIView animateWithDuration:1 animations:^{
                CGRect frameTemp = whiteCheckerView.frame;
                whiteCheckerView.frame = redCheckerView.frame;
                redCheckerView.frame = frameTemp;
            }];

            [self.boardView exchangeSubviewAtIndex:i withSubviewAtIndex:randomIndex];
            [self.boardView bringSubviewToFront:whiteCheckerView];
            [self.boardView bringSubviewToFront:redCheckerView];
        }
    }];

}

@end
