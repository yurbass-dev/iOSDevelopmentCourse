//
//  YCViewController.m
//  TableViewEditingHW
//
//  Created by Yuriy on 17.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCViewController.h"
#import "YCClass.h"
#import "YCPupil.h"

@interface YCViewController ()

@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *classes;
@property (assign, nonatomic) UITableViewCellEditingStyle editingStyle;

@end

@implementation YCViewController

- (void)loadView {
    [super loadView];
    
    CGRect tableViewRect = self.view.bounds;
    tableViewRect.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStyleGrouped];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.classes = [NSMutableArray array];
    
    for (NSInteger class = 0; class < 7; class++) {
        
        YCClass *newClass = [YCClass new];
        newClass.name = [NSString stringWithFormat:@"Class #%ld", class + 1];
        NSMutableArray *pupils = [NSMutableArray array];
        
        for (NSInteger pupil = 0; pupil < 15; pupil++) {
            
            [pupils addObject:[YCPupil createPupil]];
        }
        newClass.pupils = pupils.copy;
        [self.classes addObject:newClass];
    }
    
    [self.tableView reloadData];
    
    
    self.navigationItem.title = @"Pupils";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    editButton.tintColor = UIColor.redColor;
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.editingStyle = UITableViewCellEditingStyleDelete;
}


#pragma mark - Actions

- (void)actionEdit:(UIBarButtonItem *)sender {
    
    BOOL isEditing = self.tableView.isEditing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.isEditing) {
        
        item = UIBarButtonSystemItemDone;
        
        UIBarButtonItem *addClassButton = [[UIBarButtonItem alloc] initWithTitle:@"+ Class"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(actionAdd:)];
        addClassButton.tintColor = UIColor.magentaColor;
        
        UIBarButtonItem *editPupilButton = [[UIBarButtonItem alloc] initWithTitle:@"+ Pupil"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(actionEditPupil:)];
        editPupilButton.tintColor = UIColor.greenColor;
        
        [self.navigationItem setLeftBarButtonItems:@[addClassButton, editPupilButton] animated:YES];
    }
    else {
        self.navigationItem.leftBarButtonItems = nil;
    }
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    editButton.tintColor = isEditing ? UIColor.redColor : UIColor.orangeColor;
    
    [self.navigationItem setRightBarButtonItem:editButton animated:YES];
}

- (void)actionAdd:(UIBarButtonItem *)sender {
    
    YCClass *class = [YCClass new];
    class.name = [NSString stringWithFormat:@"Class #%ld", self.classes.count + 1];
    class.pupils = @[[YCPupil createPupil]];
    
    [self.classes addObject:class];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:self.classes.count - 1];
    
    [CATransaction begin];
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    [CATransaction setCompletionBlock:^{
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
    
    [self.tableView beginUpdates];
    [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView endUpdates];
    
    [CATransaction commit];
    
    
    UIBarButtonItem *addClassButton = [[UIBarButtonItem alloc] initWithTitle:@"Add Class"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(actionAdd:)];
    addClassButton.tintColor = UIColor.magentaColor;
    
    NSArray *items = [self.navigationItem leftBarButtonItems];
    
    [self.navigationItem setLeftBarButtonItems:items animated:YES];
}

- (void)actionEditPupil:(UIBarButtonItem *)sender {
    
    if (self.editingStyle == UITableViewCellEditingStyleDelete) {
        
        sender.title = @"- Pupil";
        sender.tintColor = UIColor.redColor;
        
        self.tableView.editing = NO;
        self.editingStyle = UITableViewCellEditingStyleInsert;
        self.tableView.editing = YES;
    }
    else if (self.editingStyle == UITableViewCellEditingStyleInsert) {
        
        sender.title = @"+ Pupil";
        sender.tintColor = UIColor.greenColor;
        
        self.tableView.editing = NO;
        self.editingStyle = UITableViewCellEditingStyleDelete;
        self.tableView.editing = YES;
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.classes.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return [self.classes[section] name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YCClass *class = self.classes[section];
    
    return class.pupils.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const pupilIdentifier = @"pupilCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pupilIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:pupilIdentifier];
    }

    cell.textLabel.text = @"cell";
    
    YCClass *class = self.classes[indexPath.section];
    YCPupil *pupil = class.pupils[indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", pupil.firstName, pupil.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", pupil.averageGrade];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    YCClass *sourceClass = self.classes[sourceIndexPath.section];
    NSMutableArray *sourcePupilsArray = [sourceClass.pupils mutableCopy];
    
    if (sourceIndexPath.section == destinationIndexPath.section) {
    
        [sourcePupilsArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
        sourceClass.pupils = [sourcePupilsArray copy];
    }
    else {
        YCClass *destinationClass = self.classes[destinationIndexPath.section];
        NSMutableArray *destinationPupilsArray = [destinationClass.pupils mutableCopy];
        YCPupil *pupil = sourceClass.pupils[sourceIndexPath.row];
        
        [sourcePupilsArray removeObject:pupil];
        [destinationPupilsArray insertObject:pupil atIndex:destinationIndexPath.row];
        
        sourceClass.pupils = [sourcePupilsArray copy];
        destinationClass.pupils = [destinationPupilsArray copy];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YCClass *class = self.classes[indexPath.section];
    NSMutableArray *classArray = [class.pupils mutableCopy];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [classArray removeObjectAtIndex:indexPath.row];
        class.pupils = [classArray copy];
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [tableView endUpdates];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        [classArray insertObject:[YCPupil createPupil] atIndex:indexPath.row + 1];
        class.pupils = [classArray copy];
        
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        
        [CATransaction begin];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        
        [CATransaction setCompletionBlock:^{
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }];
        
        [tableView beginUpdates];
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView endUpdates];
        
        [CATransaction commit];
    }
}


#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.editingStyle;
}


@end
