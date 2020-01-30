//
//  YCDirectoryViewController.m
//  FileManagerTest
//
//  Created by Yuriy on 27.04.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCDirectoryViewController.h"

@interface YCDirectoryViewController ()

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSArray *contents;

@end

@implementation YCDirectoryViewController

#pragma mark - Lifecycle

- (instancetype)initWithFolderPath:(NSString *)path {
 
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
        
        NSError *error = nil;
        
        self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path
                                                                            error:&error];
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            self.contents = [self sortContent:self.contents];
        }
    }
    
    return self;
}

- (void)dealloc {
    
    NSLog(@"controller with path %@ is dealocated", self.path);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.path.lastPathComponent;
    
    if (self.navigationController.viewControllers.count > 1) {
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Back to root"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(actionBackToRoot:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    NSLog(@"path = %@", self.path);
    NSLog(@"view controllers on stack = %lu", self.navigationController.viewControllers.count);
    NSLog(@"index on stack = %lu", [self.navigationController.viewControllers indexOfObject:self]);
}

#pragma mark - Actions

- (void)actionBackToRoot:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Additional methods

- (BOOL)isDirectoryAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *fileName = self.contents[indexPath.row];
    NSString *filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}

- (NSArray *)sortContent:(NSArray *)content {
    
    content = [content sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        NSIndexPath *obj1IndexPath = [NSIndexPath indexPathForRow:[content indexOfObject:obj1] inSection:0];
        NSIndexPath *obj2IndexPath = [NSIndexPath indexPathForRow:[content indexOfObject:obj2] inSection:0];
        
        BOOL isObj1Directory = [self isDirectoryAtIndexPath:obj1IndexPath];
        BOOL isObj2Directory = [self isDirectoryAtIndexPath:obj2IndexPath];
        
        NSComparisonResult result;
        
        if (isObj1Directory > isObj2Directory) {
            result = NSOrderedAscending;
        }
        else if (isObj1Directory < isObj2Directory) {
            result = NSOrderedDescending;
        }
        else {
            result = [(NSString *)obj1 compare:(NSString *)obj2 options:(NSNumericSearch)];
        }
        
        return result;
    }];
    
    return content;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
    if (!cell) {
     
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *fileName = self.contents[indexPath.row];
    
    cell.textLabel.text = fileName;
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    }
    else {
        cell.imageView.image = [UIImage imageNamed:@"file.png"];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString *name = self.contents[indexPath.row];
        
        NSString *path = [self.path stringByAppendingPathComponent:name];
        
        YCDirectoryViewController *vc = [[YCDirectoryViewController alloc] initWithFolderPath:path];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
