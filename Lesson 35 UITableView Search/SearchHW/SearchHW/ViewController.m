//
//  ViewController.m
//  SearchHW
//
//  Created by Yuriy on 02.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "YCStudent.h"
#import "YCSection.h"

typedef NS_ENUM(NSInteger, SortStudentControl) {
    SortStudentControlDate,
    SortStudentControlFirstName,
    SortStudentControlLastName
};

static NSDateFormatter *dateFormatter = nil;

@interface ViewController ()

@property (copy, nonatomic) NSArray *students;
@property (copy, nonatomic) NSArray *sections;
@property (weak, nonatomic) IBOutlet UISearchBar *studentsSearchBar;
@property (strong, nonatomic) NSBlockOperation *opBlock;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortStudentsSegmentedControl;
- (IBAction)actionSortStudents:(UISegmentedControl *)sender;

@end

@implementation ViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!dateFormatter) {
        
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"dd MMM yyyy"];
    }
    
    NSMutableArray *tempStudents = [NSMutableArray array];

    NSUInteger randomStudentsCount = arc4random_uniform(500) + 500;

    for (NSUInteger index = 0; index < randomStudentsCount; index++) {
        YCStudent *student = [YCStudent createRandomStudent];
        [tempStudents addObject:student];
    }
    
    self.students = tempStudents;
    self.students = [self sortStudents:self.students withDescriptorKeys:@[@"monthOfBirth", @"firstName", @"lastName"] withAscending:YES];
    [self generateSectionsInBackgroundFromStudents:self.students withFilter:self.studentsSearchBar.text];
}

#pragma mark - Additional Methods

- (NSArray *)sortStudents:(NSArray *)students withDescriptorKeys:(NSArray<NSString *> *)descriptorKeys withAscending:(BOOL)ascending {
    
    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:students];
    NSMutableArray *sortDescriptors = [NSMutableArray array];
    
    for (NSString *descriptorKey in descriptorKeys) {
        
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:descriptorKey ascending:ascending];
        [sortDescriptors addObject:sortDescriptor];
    }
    [sortedArray sortUsingDescriptors:sortDescriptors];
    
    return sortedArray;
}
/*
- (NSArray *)generateSectionsByMonthFromStudents:(NSArray *)students {
    
    NSMutableArray *sections = [NSMutableArray array];
    
    YCSection *section = nil;
    NSString *prevMonth = nil;
    NSString *currentMonth = nil;
    
    for (YCStudent *student in students) {
        
        currentMonth = [[dateFormatter monthSymbols] objectAtIndex:student.monthOfBirth - 1];

        if (![currentMonth isEqualToString:prevMonth]) {
            
            section = [YCSection new];
            section.name = currentMonth;
            section.students = [NSMutableArray arrayWithObject:student];
            [sections addObject:section];
            prevMonth = currentMonth;
        }
        else {
            [section.students addObject:student];
        }
    }
    
    return sections;
}
*/
- (void)generateSectionsInBackgroundFromStudents:(NSArray *)students withFilter:(NSString *)filter {
    
    [self.opBlock cancel];
    self.opBlock = [NSBlockOperation new];
    
    SortStudentControl control = self.sortStudentsSegmentedControl.selectedSegmentIndex;
    
    __weak NSBlockOperation *weakOpBlock = self.opBlock;
    __weak ViewController *weakSelf = self;
    
    [self.opBlock addExecutionBlock:^{
        
        NSMutableArray *sections = [NSMutableArray array];
        
        YCSection *section = nil;
        NSString *prev = nil;
        NSString *current = nil;
        
        for (YCStudent *student in students) {
            
            if (weakOpBlock.isCancelled) {
                break;
            }
            
            if (filter.length > 0 && [student.firstName rangeOfString:filter].location == NSNotFound &&
                                     [student.lastName rangeOfString:filter].location == NSNotFound) {
                continue;
            }
            
            if (control == SortStudentControlDate) {
                current = [[[dateFormatter monthSymbols] objectAtIndex:student.monthOfBirth - 1] substringToIndex:3];
            }
            else if (control == SortStudentControlFirstName) {
                current = [student.firstName substringToIndex:1];
            }
            else if (control == SortStudentControlLastName) {
                current = [student.lastName substringToIndex:1];
            }
            
            if (![current isEqualToString:prev]) {

                section = [YCSection new];
                section.name = current;
                section.students = [NSMutableArray arrayWithObject:student];
                [sections addObject:section];
                prev = current;
            }
            else {
                [section.students addObject:student];
            }
        }
        
        weakSelf.sections = sections;
       
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf.tableView reloadData];
        }];
    }];
    
    [[NSOperationQueue new] addOperation:self.opBlock];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YCSection *sect = self.sections[section];
    
    return sect.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    YCSection *section = self.sections[indexPath.section];
    YCStudent *student = section.students[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:student.dateOfBirth];
    
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray *sectionNames = [NSMutableArray array];
                     
    for (YCSection *section in self.sections) {
        [sectionNames addObject:section.name];
    }
    
    return sectionNames;
}

#pragma mark - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.sections[section] name];
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
    
    [self generateSectionsInBackgroundFromStudents:self.students withFilter:self.studentsSearchBar.text];
}

#pragma mark - Actions

- (IBAction)actionSortStudents:(UISegmentedControl *)sender {
    
    NSArray *keys = nil;
    
    if (sender.selectedSegmentIndex == SortStudentControlDate) {
        keys = @[@"monthOfBirth", @"firstName", @"lastName"];
    }
    else if (sender.selectedSegmentIndex == SortStudentControlFirstName) {
        keys = @[@"firstName", @"lastName", @"dateOfBirth"];
    }
    else if (sender.selectedSegmentIndex == SortStudentControlLastName) {
        keys = @[@"lastName", @"dateOfBirth", @"firstName"];
    }
    
    self.students = [self sortStudents:self.students withDescriptorKeys:keys withAscending:YES];
    [self generateSectionsInBackgroundFromStudents:self.students withFilter:self.studentsSearchBar.text];
}

@end
