//
//  YCDirectoryViewController.h
//  FileManagerTest2
//
//  Created by Yuriy on 21.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCDirectoryViewController : UITableViewController

@property (strong, nonatomic) NSString *path;


- (instancetype)initWithFolderPath:(NSString *)path;

- (IBAction)actionInfoCell:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
