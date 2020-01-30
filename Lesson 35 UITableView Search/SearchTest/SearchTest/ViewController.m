//
//  ViewController.m
//  SearchTest
//
//  Created by Yuriy on 24.06.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Random.h"
#import "YCSection.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *namesArray;
@property (strong, nonatomic) NSArray *sectionsArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSBlockOperation *blockOp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSInteger index = 0; index < 2000000; index++) {
        [array addObject:[NSString randomAlphanumericString]];
    }
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [array sortUsingDescriptors:@[sortDescriptor]];

    self.namesArray = array;
    [self generateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
}

- (void)generateSectionsInBackgroundFromArray:(NSArray *)array withFilter:(NSString *)filterString {
    
    [self.blockOp cancel];
    self.blockOp = [NSBlockOperation new];
    
    __weak NSBlockOperation *weakBlockOp = self.blockOp;
    __weak ViewController *weakSelf = self;
    
    [self.blockOp addExecutionBlock:^{
        
        NSMutableArray *sectionsArray = [NSMutableArray array];
        NSString *currentLetter = nil;
        
        for (NSString *name in array) {
            
            if (weakBlockOp.isCancelled) {
                NSLog(@"break");
                break;
            }
            
            if (filterString.length > 0 && [name rangeOfString:filterString].location == NSNotFound) {
                continue;
            }
            
            NSString *firstLetter = [name substringToIndex:1];
            YCSection *section = nil;
            
            if (![currentLetter isEqualToString:firstLetter]) {
                
                section = [YCSection new];
                section.sectionName = firstLetter;
                section.itemsArray = [NSMutableArray array];
                [sectionsArray addObject:section];
                currentLetter = firstLetter;
            }
            else {
                section = [sectionsArray lastObject];
            }
            
            [section.itemsArray addObject:name];
        }
        
        weakSelf.sectionsArray = sectionsArray;
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf.tableView reloadData];
        }];
    }];
    
    [[NSOperationQueue new] addOperation:self.blockOp];
    
//    __weak ViewController *weakSelf = self;
//
//    [[NSOperationQueue new] addOperationWithBlock:^{
//        weakSelf.sectionsArray = [weakSelf generateSectionsFromArray:array withFilter:filterString];
//
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            [weakSelf.tableView reloadData];
//        }];
//    }];
    
//    __weak ViewController *weakSelf = self;
//
//    dispatch_queue_t customQueue = dispatch_queue_create("com.ychizh.searchTest.customQueue", NULL);
//
//    dispatch_async(customQueue, ^{
//        weakSelf.sectionsArray = [weakSelf generateSectionsFromArray:array withFilter:filterString];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [weakSelf.tableView reloadData];
//        });
//    });
}

- (NSArray *)generateSectionsFromArray:(NSArray *)array withFilter:(NSString *)filterString {
    
    NSMutableArray *sectionsArray = [NSMutableArray array];
    NSString *currentLetter = nil;
    
    for (NSString *name in array) {
        
        if (filterString.length > 0 && [name rangeOfString:filterString].location == NSNotFound) {
            continue;
        }
        
        NSString *firstLetter = [name substringToIndex:1];
        YCSection *section = nil;
        
        if (![currentLetter isEqualToString:firstLetter]) {
            
            section = [YCSection new];
            section.sectionName = firstLetter;
            section.itemsArray = [NSMutableArray array];
            [sectionsArray addObject:section];
            currentLetter = firstLetter;
        }
        else {
            section = [sectionsArray lastObject];
        }
        
        [section.itemsArray addObject:name];
    }
    
    return sectionsArray;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YCSection *sec = self.sectionsArray[section];

    return sec.itemsArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    YCSection *section = self.sectionsArray[indexPath.section];
    NSString *name = section.itemsArray[indexPath.row];
    cell.textLabel.text = name;
    
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (YCSection *section in self.sectionsArray) {
        [array addObject:section.sectionName];
    }
    
    return array;
}

#pragma mark - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.sectionsArray[section] sectionName];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"text changed %@", searchText);
    
    [self generateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
}

@end
