//
//  YCDirectoryViewController.h
//  FileManagerTest
//
//  Created by Yuriy on 27.04.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCDirectoryViewController : UITableViewController

- (instancetype)initWithFolderPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
