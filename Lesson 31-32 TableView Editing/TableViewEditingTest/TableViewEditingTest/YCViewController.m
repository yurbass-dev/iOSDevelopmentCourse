//
//  YCViewController.m
//  TableViewEditingTest
//
//  Created by Yuriy on 09.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCViewController.h"
#import "YCGroup.h"
#import "YCStudent.h"

@interface YCViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *groups;

@end

@implementation YCViewController

- (void)loadView {
    
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.groups = [NSMutableArray array];
    
//    for (NSInteger i = 0; i < arc4random_uniform(6) + 5; i++) {
//
//        YCGroup *group = [YCGroup new];
//        group.name = [NSString stringWithFormat:@"Group #%ld", i + 1];
//
//        NSMutableArray *studentsArray = [NSMutableArray array];
//
//        for (NSInteger j = 0; j < arc4random_uniform(11) + 15; j++) {
//
//            [studentsArray addObject:[YCStudent randomStudent]];
//        }
//
//        group.students = studentsArray;
//        [self.groups addObject:group];
//    }
    
    [self.tableView reloadData];
    
    self.navigationItem.title = @"Students";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    UIBarButtonItem *addSectionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self
                                                                                action:@selector(actionAddSection:)];
    self.navigationItem.leftBarButtonItem = addSectionButton;
    
}

#pragma mark - Actions

- (void)actionEdit:(UIBarButtonItem *)sender {
    
    BOOL isEditing = self.tableView.editing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    
    [self.navigationItem setRightBarButtonItem:editButton animated:YES];
}

- (void)actionAddSection:(UIBarButtonItem *)sender {
    
    YCGroup *group = [YCGroup new];
    group.name = [NSString stringWithFormat:@"Group #%ld", self.groups.count + 1];
    group.students = @[[YCStudent randomStudent], [YCStudent randomStudent]];
    
    NSInteger newSectionIndex = 0;
    
    [self.groups insertObject:group atIndex:newSectionIndex];
    
    NSIndexSet *insertSection = [NSIndexSet indexSetWithIndex:newSectionIndex];
    
    UITableViewRowAnimation animation = UITableViewRowAnimationFade;
    
    if (self.groups.count > 1) {
        
        animation = self.groups.count % 2 ? UITableViewRowAnimationLeft : UITableViewRowAnimationRight;
    }
    
    [CATransaction begin];
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];

    [CATransaction setCompletionBlock:^{
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];

    [self.tableView beginUpdates];

    [self.tableView insertSections:insertSection
                  withRowAnimation:animation];

    [self.tableView endUpdates];

    [CATransaction commit];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.groups[section] name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.groups[section] students] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        static NSString *addStudentIdentifier = @"AddStudentCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addStudentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addStudentIdentifier];
        }
        cell.textLabel.textColor = UIColor.greenColor;
        cell.textLabel.text = @"Tap to add new student";
     
        return cell;
    }
    else {
    
        static NSString *const studentIdentifier = @"StudentCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:studentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:studentIdentifier];
        }
        
        YCGroup *group = self.groups[indexPath.section];
        YCStudent *student = group.students[indexPath.row - 1];

        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", student.averageGrade];
        
        if (student.averageGrade >= 4.0f) {
            cell.detailTextLabel.textColor = UIColor.greenColor;
        }
        else if (student.averageGrade >= 3.0f) {
            cell.detailTextLabel.textColor = UIColor.orangeColor;
        }
        else if (student.averageGrade < 3.0f) {
            cell.detailTextLabel.textColor = UIColor.redColor;
        }
        
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row > 0;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    YCGroup *sourceGroup = self.groups[sourceIndexPath.section];
    YCStudent *student = sourceGroup.students[sourceIndexPath.row - 1];
    YCGroup *destinationGroup = self.groups[destinationIndexPath.section];

    
    NSMutableArray *studentsArray = [NSMutableArray arrayWithArray:sourceGroup.students];

    if (sourceIndexPath.section == destinationIndexPath.section) {

        [studentsArray exchangeObjectAtIndex:sourceIndexPath.row - 1 withObjectAtIndex:destinationIndexPath.row - 1];
        sourceGroup.students = studentsArray;
    }
    else {

        [studentsArray removeObject:student];
        sourceGroup.students = studentsArray;

        studentsArray = [NSMutableArray arrayWithArray:destinationGroup.students];
        [studentsArray insertObject:student atIndex:destinationIndexPath.row - 1];
        destinationGroup.students = studentsArray;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        YCGroup *group = self.groups[indexPath.section];
        YCStudent *student = group.students[indexPath.row - 1];
        
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:group.students];
        [tempArray removeObject:student];
        group.students = tempArray.copy;
    
        [CATransaction begin];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        
        [CATransaction setCompletionBlock:^{
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
        
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        
        [CATransaction commit];
    }
}

#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove the student";
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
    if (proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    }
    else {
       return proposedDestinationIndexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        YCGroup *group = self.groups[indexPath.section];
        
        NSMutableArray *tempArray = nil;
        
        if (group.students) {
            tempArray = [NSMutableArray arrayWithArray:group.students];
        }
        else {
            tempArray = [NSMutableArray array];
        }
        
        NSInteger newStudentndex = 0;
        [tempArray insertObject:[YCStudent randomStudent] atIndex:newStudentndex];
        group.students = tempArray.copy;
        
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:newStudentndex + 1 inSection:indexPath.section];
        
        [CATransaction begin];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        
        [CATransaction setCompletionBlock:^{
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        
        [CATransaction commit];
    }
}


@end
