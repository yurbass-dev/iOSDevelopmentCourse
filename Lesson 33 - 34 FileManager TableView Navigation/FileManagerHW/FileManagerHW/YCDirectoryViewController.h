//
//  YCDirectoryViewController.h
//  FileManagerHW
//
//  Created by Yuriy on 26.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, YCContentState) {
    YCContentStateDirectoryEmpty = 0,
    YCContentStateFolderExists = 1 << 0,
    YCContentStateFileExists = 1 << 1
};

@interface YCDirectoryViewController : UITableViewController 

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSArray *contents;

- (BOOL)isDirectoryInContents:(NSArray *)contents atPath:(NSString *)path andAtIndexPath:(NSIndexPath *)indexPath;
- (void)reloadContents;

@end

NS_ASSUME_NONNULL_END
