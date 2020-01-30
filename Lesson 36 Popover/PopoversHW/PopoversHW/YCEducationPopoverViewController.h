//
//  YCEducationPopoverViewController.h
//  PopoversHW
//
//  Created by Yuriy on 07.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YCEducationPopoverViewControllerDelegate;

@interface YCEducationPopoverViewController : UITableViewController

@property (strong, nonatomic) NSIndexPath *selectedCellIndexPath;
@property (weak, nonatomic) id <YCEducationPopoverViewControllerDelegate> delegate;

@end

@protocol YCEducationPopoverViewControllerDelegate <NSObject>

- (void)educationChanged:(NSString *)education withIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
