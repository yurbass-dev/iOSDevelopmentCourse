//
//  YCDirectoryViewController.m
//  FileManagerHW
//
//  Created by Yuriy on 26.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCDirectoryViewController.h"
#import "YCFileCell.h"
#import "YCPopoverOptionsViewController.h"

static NSDateFormatter *dateFormatter = nil;
static const CGFloat kFolderCellHeight = 44.0f;
static const CGFloat kFileCellHeight = 60.0f;

@interface YCDirectoryViewController () <UIPopoverPresentationControllerDelegate, YCPopoverOptionsViewControllerDelegate>

@property (assign, nonatomic) NSString *option;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)actionDone:(UIBarButtonItem *)sender;

@end

@implementation YCDirectoryViewController

- (void)setPath:(NSString *)path {
    
    _path = path;
    [self reloadContents];
    [self.tableView reloadData];
    
    self.navigationItem.title = [self.path lastPathComponent];
}

#pragma mark - init

- (instancetype)init {
    
    return [self initWithPath:@"/Users/yurbass/Documents/iOSCource"];
}

- (instancetype)initWithPath:(NSString *)path {
    
    self = [super init];
    if (self) {
        self.path = path;
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.path) {
        self.path = @"/Users/yurbass/Documents/iOSCourse";
    }
    
    self.navigationItem.leftBarButtonItem = nil;
    
    if (!dateFormatter) {
        
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd.MM.yy HH:mm"];
    }
}

#pragma mark - Methods

- (BOOL)isDirectoryInContents:(NSArray *)contents atPath:(NSString *)path andAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL isDirectory = NO;
    
    NSString *contentPath = [path stringByAppendingPathComponent:contents[indexPath.row]];
    [[NSFileManager defaultManager] fileExistsAtPath:contentPath isDirectory:&isDirectory];
    
    return isDirectory;
}

- (NSArray *)sortContent:(NSArray *)content {
    
    content = [content sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        NSIndexPath *obj1IndexPath = [NSIndexPath indexPathForRow:[content indexOfObject:obj1] inSection:0];
        NSIndexPath *obj2IndexPath = [NSIndexPath indexPathForRow:[content indexOfObject:obj2] inSection:0];
        
        BOOL isObj1Directory = [self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:obj1IndexPath];
        BOOL isObj2Directory = [self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:obj2IndexPath];
        
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

- (NSArray *)removeHiddenFilesAtPath:(NSString *)path {
    
    NSError *error = nil;
    NSMutableArray *contentsWithoutHiddenFiles = nil;
    
    NSArray *URLContentsWithoutHiddenFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:[NSURL fileURLWithPath:path]
                                                         includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                                                            options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                              error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
    else {
        contentsWithoutHiddenFiles = [NSMutableArray array];
        
        for (NSInteger index = 0; index < URLContentsWithoutHiddenFiles.count; index++) {
            [contentsWithoutHiddenFiles addObject:[[URLContentsWithoutHiddenFiles[index] path] lastPathComponent]];
        }
    }
    
    return [contentsWithoutHiddenFiles copy];
}

- (void)reloadContents {
    
    NSError *contentsError = nil;
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&contentsError];
    
    if (contentsError) {
        NSLog(@"%@", contentsError.localizedDescription);
    }
    else {
        self.contents = [self removeHiddenFilesAtPath:self.path];
        self.contents = [self sortContent:self.contents];
    }
}

- (YCContentState)getStateOfDirectory {

    YCContentState state = 0;

    if (self.contents.count != 0) {
        for (NSInteger index = 0; index < self.contents.count; index++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            BOOL isDirectory = [self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:indexPath];
            
            if (isDirectory && state != YCContentStateFolderExists) {
                state |= YCContentStateFolderExists;
            }
            else if (!isDirectory && state != YCContentStateFileExists) {
                state |= YCContentStateFileExists;
            }
            
            if (state == (YCContentStateFolderExists | YCContentStateFileExists)) {
                break;
            }
        }
    }
    return state;
}

- (void)setEditingToNoAndBarButtonDoneToNil {
    
    self.tableView.editing = NO;
    self.navigationItem.leftBarButtonItem = nil;
    self.option = nil;
}

- (NSUInteger)sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSUInteger folderSize = 0;
    NSInteger index = 0;

    for (NSString *file in contents) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index++ inSection:0];
        BOOL isDirectory = [self isDirectoryInContents:contents atPath:folderPath andAtIndexPath:indexPath];
        
        if (isDirectory) {
            folderSize += [self sizeOfFolder:[folderPath stringByAppendingPathComponent:file]];
        }
        else {
            NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file]
                                                                                            error:nil];
            folderSize += [fileAttributes fileSize];
        }
    }
    
    return folderSize;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *const FolderCellIdentifier = @"FolderCell";
    static NSString *const FileCellIdentifier = @"FileCell";
    
    NSString *contentName = self.contents[indexPath.row];
    
    if ([self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:indexPath]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FolderCellIdentifier];
        cell.textLabel.text = contentName;
        
        return cell;
    }
    else {
        YCFileCell *cell = [tableView dequeueReusableCellWithIdentifier:FileCellIdentifier];

        cell.nameLabel.text = contentName;
        NSString *path = [self.path stringByAppendingPathComponent:contentName];
        
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        cell.sizeLabel.text = [NSByteCountFormatter stringFromByteCount:[fileAttributes fileSize] countStyle:NSByteCountFormatterCountStyleFile];
        
        cell.dateLabel.text = [dateFormatter stringFromDate:[fileAttributes fileModificationDate]];
        
        return cell;
    }

    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:indexPath]) {
        return kFolderCellHeight;
    }
    else {
        return kFileCellHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:indexPath]) {
    
        NSString *newContentPath = [self.path stringByAppendingPathComponent:self.contents[indexPath.row]];

        YCDirectoryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"YCDirectoryViewController"];
        vc.path = newContentPath;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSError *error = nil;
        NSString *path = [self.path stringByAppendingPathComponent:self.contents[indexPath.row]];
        
        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
        else {
            [self reloadContents];
            
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
            
            if (self.contents.count == 0) {
                [self setEditingToNoAndBarButtonDoneToNil];
            }
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    BOOL isCanEdit = NO;

    if ([self.option isEqualToString:@"Delete Directory"] || [self.option isEqualToString:@"Delete File"]) {

        BOOL isDirectory = [self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:indexPath];

        if ([self.option isEqualToString:@"Delete Directory"] && isDirectory) {
            isCanEdit = YES;
        }
        else if ([self.option isEqualToString:@"Delete File"] && !isDirectory) {
            isCanEdit = YES;
        }
    }
    else {
        isCanEdit = YES;
    }

    return isCanEdit;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
    NSString *contentName = self.contents[indexPath.row];
    NSString *path = [self.path stringByAppendingPathComponent:contentName];
    NSString *sizeContent = nil;
    NSUInteger size;
    
    BOOL isDirectory = [self isDirectoryInContents:self.contents atPath:self.path andAtIndexPath:indexPath];
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    
    if (isDirectory) {
        size = [self sizeOfFolder:path];
    }
    else {
        size = [fileAttributes fileSize];
    }
    
    sizeContent = [NSByteCountFormatter stringFromByteCount:size countStyle:NSByteCountFormatterCountStyleFile];
    NSString *dateFile = [dateFormatter stringFromDate:[fileAttributes fileModificationDate]];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:contentName
                                                                             message:[NSString stringWithFormat:@"Size: %@\nDate: %@", sizeContent, dateFile]
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];

    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"PopoverVC"]) {
        
        YCPopoverOptionsViewController *vc = segue.destinationViewController;
        
        vc.delegate = self;
        vc.popoverPresentationController.delegate = self;
        vc.preferredContentSize = CGSizeMake(YCPopoverOptionsWidth, YCPopoverOptionsHeight);
        
        if (self.navigationController.viewControllers.count == 1) {
            vc.sourceRootViewController = YES;
        }
        else {
            vc.sourceRootViewController = NO;
        }
        vc.state = [self getStateOfDirectory];
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {

    return UIModalPresentationNone;
}

#pragma mark - YCPopoverOptionsViewControllerDelegate

- (void)didSelectRow:(NSString *)option {
    
    self.option = option;
    typedef void (^CaseBlock)(void);

    NSDictionary *options = @{
                        @"Create Directory":
                            ^{
                                [self createDirectory];
                            },
                        @"Delete Directory":
                            ^{
                                [self enableEditingModeWithDoneBarButton];
                            },
                        @"Delete File":
                            ^{
                                [self enableEditingModeWithDoneBarButton];
                            },
                        @"Back To Root":
                            ^{
                                [self.navigationController popToRootViewControllerAnimated:YES];
                            }
                        };

    ((CaseBlock)options[option])();
}

#pragma mark - Option Methods

- (void)createDirectory {
    
    if (self.tableView.editing) {
        [self setEditingToNoAndBarButtonDoneToNil];
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Create new directory"
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Enter directory name";
    }];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        NSString *newDirectoryName = alertController.textFields.firstObject.text;
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:[self.path stringByAppendingPathComponent:newDirectoryName]]) {
            
            if (newDirectoryName.length > 0) {
                
                NSError *error = nil;
                NSString *newDirectoryPath = [self.path stringByAppendingPathComponent:newDirectoryName];
                
                [[NSFileManager defaultManager] createDirectoryAtPath:newDirectoryPath
                                          withIntermediateDirectories:YES
                                                           attributes:nil
                                                                error:&error];
                if (error) {
                    NSLog(@"%@", error.localizedDescription);
                }
                else {
                    [self reloadContents];
                    
                    NSIndexPath *contentIndexPath = [NSIndexPath indexPathForRow:[self.contents indexOfObject:newDirectoryName] inSection:0];
                    
                    [self.tableView beginUpdates];
                    [self.tableView insertRowsAtIndexPaths:@[contentIndexPath] withRowAnimation:UITableViewRowAnimationTop];
                    [self.tableView endUpdates];
                }
            }
        }
        else {
            alertController.message = [NSString stringWithFormat:@"Directory name \"%@\" is already taken. Please enter new name.", newDirectoryName];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:doneAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)enableEditingModeWithDoneBarButton {
    
    self.tableView.editing = NO;
    self.tableView.editing = YES;
    self.navigationItem.leftBarButtonItem = self.doneBarButton;
}

#pragma mark - Actions

- (IBAction)actionDone:(UIBarButtonItem *)sender {
    
    if (self.tableView.editing) {
        [self setEditingToNoAndBarButtonDoneToNil];
    }
}

@end
