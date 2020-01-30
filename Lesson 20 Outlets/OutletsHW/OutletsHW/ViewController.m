//
//  ViewController.m
//  OutletsHW
//
//  Created by Yuriy on 13.11.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cellsOnBoard;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *whiteCheckers;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *redCheckers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        UIColor *color;
        
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            color = [UIColor purpleColor];
        }
        else if (UIInterfaceOrientationIsPortrait(orientation)) {
            color = [UIColor blackColor];
        }
        
        for (UIView *view in self.cellsOnBoard)
        {
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
        }
    }];
}


@end
