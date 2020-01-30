//
//  ViewController.m
//  PopoversTest
//
//  Created by Yuriy on 04.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "YCDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Actions

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    YCDetailsViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"YCDetailsViewController"];
    
    [self showController:detailsVC inPopoverFromSender:sender withSize:CGSizeMake(200, 300) andWithDirection:UIPopoverArrowDirectionUp];
}

- (IBAction)actionPressMe:(UIButton *)sender {
    
    YCDetailsViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"YCDetailsViewController"];
    
    [self showController:detailsVC inPopoverFromSender:sender withSize:CGSizeMake(300, 300) andWithDirection:UIPopoverArrowDirectionAny];
}

- (void)showController:(nonnull UIViewController *)vc inPopoverFromSender:(nonnull id)sender withSize:(CGSize)size andWithDirection:(UIPopoverArrowDirection)direction {
    
    if(!sender) {
        return;
    }

    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    navigationVC.modalPresentationStyle = UIModalPresentationPopover;
    navigationVC.popoverPresentationController.delegate = self;
    navigationVC.preferredContentSize = size;
    
    [self presentViewController:navigationVC animated:YES completion:nil];
    
    UIPopoverPresentationController *popover = navigationVC.popoverPresentationController;
    popover.permittedArrowDirections = direction;
    popover.passthroughViews = @[self.viewTest];
    
    if ([sender isMemberOfClass:[UIBarButtonItem class]]) {
        popover.barButtonItem = (UIBarButtonItem *)sender;
    }
    else if ([sender isMemberOfClass:[UIButton class]]) {
        popover.sourceRect = [(UIButton *)sender bounds];
        popover.sourceView = (UIButton *)sender;
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    
    return UIModalPresentationNone;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"prepareForSegue %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        
        UIPopoverPresentationController *popover = segue.destinationViewController.popoverPresentationController;
        popover.passthroughViews = @[self.viewTest];
        popover.delegate = self;
    }
    

}

@end
