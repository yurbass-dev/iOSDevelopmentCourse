//
//  YCOptionsViewController.m
//  FileManagerHW
//
//  Created by Yuriy on 26.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCPopoverOptionsViewController.h"

CGFloat const YCPopoverOptionsWidth = 200.0f;
CGFloat const YCPopoverOptionsHeight = 350.0f;

@interface YCPopoverOptionsViewController ()

@property (strong, nonatomic) NSMutableArray *options;

@end

@implementation YCPopoverOptionsViewController

#pragma mark - View Lifecycle

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.preferredContentSize = CGSizeMake(YCPopoverOptionsWidth, self.tableView.contentSize.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    
    self.options = [@[@"Create Directory", @"Delete Directory", @"Delete File", @"Back To Root"] mutableCopy];
    
    if (self.isSourceRootViewController) {
        [self.options removeObject:@"Back To Root"];
    }

    if (self.state == YCContentStateDirectoryEmpty) {
        [self.options removeObjectsInArray:@[@"Delete Directory", @"Delete File"]];
    }
    else if (self.state == YCContentStateFolderExists) {
        [self.options removeObject:@"Delete File"];
    }
    else if (self.state == YCContentStateFileExists) {
        [self.options removeObject:@"Delete Directory"];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.options[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate didSelectRow:self.options[indexPath.row]];
}


@end
