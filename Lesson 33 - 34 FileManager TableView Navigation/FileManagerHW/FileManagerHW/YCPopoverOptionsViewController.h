//
//  YCOptionsViewController.h
//  FileManagerHW
//
//  Created by Yuriy on 26.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCDirectoryViewController.h"

NS_ASSUME_NONNULL_BEGIN

extern CGFloat const YCPopoverOptionsWidth;
extern CGFloat const YCPopoverOptionsHeight;

@protocol YCPopoverOptionsViewControllerDelegate;

@interface YCPopoverOptionsViewController : UITableViewController

@property (weak, nonatomic) id <YCPopoverOptionsViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *option;
@property (assign, nonatomic, getter=isSourceRootViewController) BOOL sourceRootViewController;
@property (assign, nonatomic) YCContentState state;

@end

@protocol YCPopoverOptionsViewControllerDelegate <NSObject>

@required
- (void)didSelectRow:(NSString *)option;

@end

NS_ASSUME_NONNULL_END
