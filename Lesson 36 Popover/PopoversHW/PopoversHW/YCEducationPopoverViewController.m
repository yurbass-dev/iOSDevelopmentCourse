//
//  YCEducationPopoverViewController.m
//  PopoversHW
//
//  Created by Yuriy on 07.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCEducationPopoverViewController.h"

@interface YCEducationPopoverViewController ()

@end

@implementation YCEducationPopoverViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    if (self.selectedCellIndexPath) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.selectedCellIndexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.preferredContentSize = CGSizeMake(self.tableView.contentSize.width, self.tableView.contentSize.height);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    for (UITableViewCell *cell in tableView.visibleCells) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [self.delegate educationChanged:cell.textLabel.text withIndexPath:indexPath];
}

@end
