//
//  ViewController.m
//  TouchesHW
//
//  Created by Yuriy on 26.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

typedef NS_OPTIONS(NSUInteger, YCSubviewTag) {
    YCSubviewTagBoard = 1 << 0,
    YCSubviewTagBlackCell = 2 << 0,
    YCSubviewTagWhiteChecker = 3 << 0,
    YCSubviewTagRedChecker = 4 << 0,
    
    YCSubviewTagCheckerOnBlackCell = 1 << 8         // Маркер того, что на клетке находиться шашка
};

@interface ViewController ()

@property (strong, nonatomic) UIView *boardView;
@property (strong, nonatomic) NSMutableArray *blackCells;
@property (strong, nonatomic) NSMutableArray *whiteCheckers;
@property (strong, nonatomic) NSMutableArray *redCheckers;
@property (weak, nonatomic) UIView *draggingCheckerView;
@property (assign, nonatomic) CGPoint touchOffSet;
@property (assign, nonatomic) CGPoint previousCenterOfChecker;

- (void)createBoardAndCheckers;
- (UIView*)addCheckerOnParentView:(UIView*)parentView withRect:(CGRect)rect andColor:(UIColor*)color;
- (void) onTouchesEnded;
- (void)animateViewWithDuration:(CGFloat)duration andTransform:(CGAffineTransform)transform andAlpha:(CGFloat)alpha;
- (CGFloat)distanceFrom:(CGPoint)point1 to:(CGPoint)point2;

@end

@implementation ViewController

#pragma mark - Tasks
/*
 Уровень супермен (остальных уровней не будет)
 
 1. Создайте шахматное поле (8х8), используйте черные сабвьюхи
 2. Добавьте балые и красные шашки на черные клетки (используйте начальное расположение в шашках)
 3. Реализуйте механизм драг'н'дроп подобно тому, что я сделал в примере, но с условиями:
 4. Шашки должны ставать в центр черных клеток.
 5. Даже если я отпустил шашку над центром белой клетки - она должна переместиться в центр ближайшей к отпусканию черной клетки.
 6. Шашки не могут становиться друг на друга
 7. Шашки не могут быть поставлены за пределы поля.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self createBoardAndCheckers];
}

- (void)createBoardAndCheckers {
    
    self.blackCells = [NSMutableArray array];
    self.whiteCheckers = [NSMutableArray array];
    self.redCheckers =   [NSMutableArray array];
    
    CGFloat cellSize;
    CGFloat offset = 50.f;
    CGFloat sizeBoard = MIN(CGRectGetWidth(self.view.frame) - offset, CGRectGetHeight(self.view.frame) - offset);
    
    self.boardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizeBoard, sizeBoard)];
    self.boardView.backgroundColor = [UIColor brownColor];
    self.boardView.center = self.view.center;
    self.boardView.tag = YCSubviewTagBoard;
    
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
                cellView.tag = YCSubviewTagBlackCell;
                [self.boardView addSubview:cellView];
                
                if (j < 3) {
                    [self.whiteCheckers addObject: [self addCheckerOnParentView:self.boardView
                                                                       withRect:cellRect
                                                                       andColor:[UIColor whiteColor]]];
                    cellView.tag |= YCSubviewTagCheckerOnBlackCell;
                }
                else if (j > 4) {
                    [self.redCheckers addObject: [self addCheckerOnParentView:self.boardView
                                                                     withRect:cellRect
                                                                     andColor:[UIColor redColor]]];
                    cellView.tag |= YCSubviewTagCheckerOnBlackCell;
                }
            }
        }
    }
}

- (UIView*)addCheckerOnParentView:(UIView*)parentView withRect:(CGRect)rect andColor:(UIColor*)color {
    
    UIView *checkerView = [[UIView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.height, rect.size.width)];
    checkerView.transform = CGAffineTransformMakeScale(0.65f, 0.65f);
    checkerView.layer.cornerRadius = CGRectGetWidth(checkerView.bounds) / 2;
    checkerView.backgroundColor = color;
    [parentView addSubview:checkerView];
    
    if ([color isEqual:[UIColor whiteColor]]) {
        checkerView.tag = YCSubviewTagWhiteChecker;
    }
    else if ([color isEqual:[UIColor redColor]]) {
        checkerView.tag = YCSubviewTagRedChecker;
    }
    
    return checkerView;
}

- (void)animateViewWithDuration:(CGFloat)duration andTransform:(CGAffineTransform)transform andAlpha:(CGFloat)alpha {
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.draggingCheckerView.transform = transform;
                         self.draggingCheckerView.alpha = alpha;
                     }];
}

#pragma mark - TouchesMethods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint pointOnBoardView = [touch locationInView:self.boardView];
    UIView *view = [self.boardView hitTest:pointOnBoardView withEvent:event];

    if (view.tag == YCSubviewTagWhiteChecker || view.tag == YCSubviewTagRedChecker) {
        self.draggingCheckerView = view;
        [self.boardView bringSubviewToFront:self.draggingCheckerView];
        self.previousCenterOfChecker = self.draggingCheckerView.center;
        CGPoint touchPoint = [touch locationInView:self.draggingCheckerView];
        
        self.touchOffSet = CGPointMake(CGRectGetMidX(self.draggingCheckerView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingCheckerView.bounds) - touchPoint.y);
        
        [self animateViewWithDuration:0.3f
                         andTransform:CGAffineTransformMakeScale(0.9f, 0.9f)
                             andAlpha:0.5f];
    }
    else {
        self.draggingCheckerView = nil;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    if (self.draggingCheckerView) {
         UITouch *touch = [touches anyObject];
         CGPoint pointOnBoardView = [touch locationInView:self.boardView];
         CGPoint correction = CGPointMake(pointOnBoardView.x + self.touchOffSet.x, pointOnBoardView.y + self.touchOffSet.y);
         self.draggingCheckerView.center = correction;
    }
    else {
        self.draggingCheckerView = nil;
    }
}

- (void) onTouchesEnded {
    
    [self animateViewWithDuration:0.3f
                    andTransform:CGAffineTransformMakeScale(0.65f, 0.65f)
                        andAlpha:1.f];
    
    self.draggingCheckerView = nil;
}

- (CGFloat)distanceFrom:(CGPoint)point1 to:(CGPoint)point2 {
    
    return hypotf(point1.x - point2.x, point1.y - point2.y);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    // Идея заключаеться в том, чтобы найти все свободные клетки и найти наименьшее расстояние от центра нашей шашки
    // до центра свободной клетки и поместить шашку в центр этой клетки
    
    if (self.draggingCheckerView) {
        UIView *previousBlackCell = [self.boardView hitTest:self.previousCenterOfChecker withEvent:event];
        UIView *currentBlackCell = [self.boardView hitTest:self.draggingCheckerView.center withEvent:event];
        
        if (![previousBlackCell isEqual:currentBlackCell]) {
            previousBlackCell.tag = YCSubviewTagBlackCell;
        }
        
        CGPoint centerCurrentViewPoint = self.draggingCheckerView.center;
        UIView *targetBlackCell = nil;
        CGFloat currentDistance = 0;
        CGFloat minDistance = 0;
        
        for (UIView *view in self.boardView.subviews) {
            if (view.tag == YCSubviewTagBlackCell) {
                if (minDistance == 0) {
                    minDistance = [self distanceFrom:centerCurrentViewPoint to:view.center];
                    targetBlackCell = view;
                }
                else {
                    currentDistance = [self distanceFrom:centerCurrentViewPoint to:view.center];
                    
                    if (currentDistance < minDistance) {
                        minDistance = currentDistance;
                        targetBlackCell = view;
                    }
                }
            }
        }
        
        if ([previousBlackCell isEqual:currentBlackCell]) {
            self.draggingCheckerView.center = self.previousCenterOfChecker;
        }
        else if (targetBlackCell) {
            targetBlackCell.tag = YCSubviewTagBlackCell | YCSubviewTagCheckerOnBlackCell;
            self.draggingCheckerView.center = targetBlackCell.center;
        }
        [self onTouchesEnded];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    if (self.draggingCheckerView) {
        [self onTouchesEnded];
    }
}


@end
