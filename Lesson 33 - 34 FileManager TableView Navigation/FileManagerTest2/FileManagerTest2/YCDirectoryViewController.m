//
//  YCDirectoryViewController.m
//  FileManagerTest2
//
//  Created by Yuriy on 21.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCDirectoryViewController.h"
#import "YCFileCell.h"
#import "UIView+UITableVIewCell.h"

@interface YCDirectoryViewController ()

@property (strong, nonatomic) NSArray *contents;
@property (strong,  nonatomic) NSString *selectedPath;

@end

@implementation YCDirectoryViewController

#pragma mark - Lifecycle

- (instancetype)initWithFolderPath:(NSString *)path {
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
    }
    
    return self;
}


- (void)dealloc {
    
    NSLog(@"controller with path %@ is dealocated", self.path);
}

- (void)setPath:(NSString *)path {
    
    _path = path;
    
    NSError *error = nil;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path
                                                                        error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        self.contents = [self sortContent:self.contents];
    }
    
    [self.tableView reloadData];
    self.navigationItem.title = self.path.lastPathComponent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.path) {
        self.path = @"/Users/yurbass/Documents/iOSCource";
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
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

- (IBAction)actionInfoCell:(UIButton *)sender {
    
    NSLog(@"actionInfoCell");
    
    UITableViewCell *cell = [sender superCell];
    
    if (cell) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
//        [[[UIAlertView alloc] initWithTitle:@"Yahoo!"
//                                    message:[NSString stringWithFormat:@"action %ld %ld", indexPath.section, indexPath.row]
//                                   delegate:nil
//                          cancelButtonTitle:@"OK"
//                          otherButtonTitles:nil] show];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Yahoo!"
                                                                                 message:[NSString stringWithFormat:@"action %ld %ld",
                                                                                          indexPath.section, indexPath.row]
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {}];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

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
    
    static NSString *FileIdentifier = @"FileCell";
    static NSString *FolderIdentifier = @"FolderCell";
    
    NSString *fileName = self.contents[indexPath.row];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FolderIdentifier];
        cell.textLabel.text = fileName;
        
        return cell;
    }
    else {
        
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        YCFileCell *cell = [tableView dequeueReusableCellWithIdentifier:FileIdentifier];
        
        cell.nameLabel.text = fileName;
        cell.sizeLabel.text = [NSByteCountFormatter stringFromByteCount:[attributes fileSize] countStyle:NSByteCountFormatterCountStyleFile];
        
        static NSDateFormatter *dateFormatter = nil;
        
        if (!dateFormatter) {
            
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm a"];
        }
        cell.dateLabel.text = [dateFormatter stringFromDate:[attributes fileModificationDate]];
        
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString *name = self.contents[indexPath.row];
        
        NSString *path = [self.path stringByAppendingPathComponent:name];
        
//        YCDirectoryViewController *vc = [[YCDirectoryViewController alloc] initWithFolderPath:path];
//        [self.navigationController pushViewController:vc animated:YES];
        
//        YCDirectoryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"YCDirectoryViewController"];
//        vc.path = path;
//        [self.navigationController pushViewController:vc animated:YES];
        
        self.selectedPath = path;
        [self performSegueWithIdentifier:@"navigateDeep" sender:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        return 44.0f;
    }
    else {
        return 90.0f;
    }
}

#pragma mark - Segue

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    NSLog(@"shouldPerformSegueWithIdentifier: %@", identifier);
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    YCDirectoryViewController *vc = segue.destinationViewController;
    vc.path = self.selectedPath;
}

@end
