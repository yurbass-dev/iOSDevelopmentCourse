//
//  ViewController.m
//  TableViewDynamicCells
//
//  Created by Yuriy on 05.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "YCColorCell.h"
#import "YCStudent.h"

#pragma mark - Pupil
/*
static const NSInteger kRowsInSection = 1000;
static NSString *const YCColorCellIdentifier = @"ColorCell";

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return kRowsInSection;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YCColorCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YCColorCellIdentifier];
    }
    
    NSString *rgbColorString = nil;

    cell.backgroundColor = [self getRandomColorAndGetConvertedToStringColor:&rgbColorString];
    cell.textLabel.text = rgbColorString;
    
    return cell;
}


#pragma mark - Additional Methods

- (UIColor *)getRandomColorAndGetConvertedToStringColor:(NSString **)rgbColorString {
    
    CGFloat red = (CGFloat)arc4random_uniform(256);
    CGFloat green = (CGFloat)arc4random_uniform(256);
    CGFloat blue = (CGFloat)arc4random_uniform(256);
    
    *rgbColorString = [NSString stringWithFormat:@"RGB (%g %g %g)", red, green, blue];
    
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1.0f];
}
*/

#pragma mark - Student
/*
static const NSInteger kColorCellCount = 1000;
static NSString *const YCColorCellIdentifier = @"ColorCell";

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *colorCells;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorCells = [NSMutableArray array];
    
    NSString *rgbColorString = nil;
    
    for (NSInteger i = 0; i < kColorCellCount; i++) {
     
        YCColorCell *colorCell = [YCColorCell new];
        
        colorCell.color = [self getRandomColorAndGetConvertedToStringColor:&rgbColorString];
        colorCell.name = rgbColorString;
        [self.colorCells addObject:colorCell];
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return kColorCellCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YCColorCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YCColorCellIdentifier];
    }
    
    YCColorCell *colorCell = self.colorCells[indexPath.row];
    
    cell.backgroundColor = colorCell.color;
    cell.textLabel.text = colorCell.name;;
    
    return cell;
}


#pragma mark - Additional Methods

- (UIColor *)getRandomColorAndGetConvertedToStringColor:(NSString **)rgbColorString {
    
    CGFloat red = (CGFloat)arc4random_uniform(256);
    CGFloat green = (CGFloat)arc4random_uniform(256);
    CGFloat blue = (CGFloat)arc4random_uniform(256);
    
    *rgbColorString = [NSString stringWithFormat:@"RGB (%g %g %g)", red, green, blue];
    
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1.0f];
}
*/

#pragma mark - Master
/*
static NSString *const YCStudentCellIdentifier = @"StudentCell";

@interface ViewController ()

@property (strong, nonatomic) NSArray *students;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
 
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.students = [self createStudents];
    self.students = [self.students sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [[(YCStudent *)obj1 lastName] compare:[(YCStudent *)obj2 lastName]];
    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YCStudentCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:YCStudentCellIdentifier];
    }
    
    YCStudent *student = self.students[indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", student.averageGrade];
    
    if (student.averageGrade < 4.0f) {
        cell.textLabel.textColor = UIColor.redColor;
    }
    cell.textLabel.text = [student.lastName stringByAppendingFormat:@" %@", student.firstName];
    
    return cell;
}


#pragma mark - Additional Methods

- (NSArray *)createStudents {
    
    NSArray *firstNames = @[@"Ivan", @"Yuriy", @"Viktor", @"Pavel", @"Kiril", @"Nikita", @"Aleksandra", @"Alexey",
                                   @"Angelina", @"Anna", @"Anna", @"Nikita"];
    
    NSArray *lastNames = @[@"Ivanov", @"Popov", @"Novosad", @"Mankevich", @"Aistov", @"Baydin", @"Basova", @"Vorotnikov",
                                  @"Gordeeva", @"Gorelova", @"Demidova", @"Korchagin"];
    
    NSArray *grades = @[@(3.3f), @(4.4f), @(4.8f), @(3.0f), @(5.0f), @(4.2f), @(3.9f), @(4.5f), @(4.0f), @(3.7f), @(4.6f), @(4.3f)];
    
    NSMutableArray *students = [NSMutableArray array];
    
    for (NSInteger i = 0; i < firstNames.count; i++) {
     
        YCStudent *student = [YCStudent new];
        
        student.firstName = firstNames[i];
        student.lastName = lastNames[i];
        student.averageGrade = [grades[i] floatValue];
        
        [students addObject:student];
    }
    
    return [students copy];
}
*/

#pragma mark - Superman
/*
static NSString *const YCStudentCellIdentifier = @"StudentCell";

@interface ViewController ()

@property (strong, nonatomic) NSArray *allStudents;
@property (strong, nonatomic) NSDictionary *studentsByLevel;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
 
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allStudents = [self createStudents];
    
    self.studentsByLevel = [self groupStudentsByLevel:self.allStudents];
    self.studentsByLevel = [self sortStudentsByLastName:self.studentsByLevel];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = 0;
    
    switch (section) {
        case YCStudentLevelExelent:
            rows = [[self.studentsByLevel objectForKey:exelentStudentKey] count];
            break;
        case YCStudentLevelGood:
            rows = [[self.studentsByLevel objectForKey:goodStudentKey] count];
            break;
        case YCStudentLevelNormal:
            rows = [[self.studentsByLevel objectForKey:normalStudentKey] count];
            break;
        case YCStudentLevelBad:
            rows = [[self.studentsByLevel objectForKey:badStudentKey] count];
            break;
    }
    
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.studentsByLevel.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *sectionName = nil;
    
    switch (section) {
        case YCStudentLevelExelent:
            sectionName = @"Exelent students:";
            break;
        case YCStudentLevelGood:
            sectionName = @"Good students:";
            break;
        case YCStudentLevelNormal:
            sectionName = @"Normal students:";
            break;
        case YCStudentLevelBad:
            sectionName = @"Bad students:";
            break;
    }
    
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YCStudentCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:YCStudentCellIdentifier];
    }
    
    YCStudent *student = nil;
    
    switch (indexPath.section) {
        case YCStudentLevelExelent:
            student = [self.studentsByLevel objectForKey:exelentStudentKey][indexPath.row];
            break;
        case YCStudentLevelGood:
            student = [self.studentsByLevel objectForKey:goodStudentKey][indexPath.row];
            break;
        case YCStudentLevelNormal:
            student = [self.studentsByLevel objectForKey:normalStudentKey][indexPath.row];
            break;
        case YCStudentLevelBad:
            student = [self.studentsByLevel objectForKey:badStudentKey][indexPath.row];
            break;
    }
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", student.averageGrade];
    
    if (student.averageGrade < 3.0f) {
        cell.textLabel.textColor = UIColor.redColor;
    }
    cell.textLabel.text = [student.lastName stringByAppendingFormat:@" %@", student.firstName];
    
    return cell;
}


#pragma mark - Additional Methods

- (NSArray *)createStudents {
    
    NSArray *firstNames = @[@"Ivan", @"Yuriy", @"Viktor", @"Pavel", @"Kiril", @"Nikita", @"Aleksandra", @"Alexey",
                            @"Angelina", @"Anna", @"Anna", @"Nikita"];
    
    NSArray *lastNames = @[@"Ivanov", @"Popov", @"Novosad", @"Mankevich", @"Aistov", @"Baydin", @"Basova", @"Vorotnikov",
                           @"Gordeeva", @"Gorelova", @"Demidova", @"Korchagin"];
    
    NSMutableArray *students = [NSMutableArray array];
    
    for (NSInteger i = 0; i < firstNames.count; i++) {
        
        YCStudent *student = [YCStudent new];
        
        student.firstName = firstNames[i];
        student.lastName = lastNames[i];
        student.averageGrade = (CGFloat)arc4random_uniform(UINT32_MAX) / UINT32_MAX * (5 - 2) + 2;
        
        if (student.averageGrade <= 5.0f && student.averageGrade >= 4.5f) {
            student.level = YCStudentLevelExelent;
        }
        else if (student.averageGrade >= 4.0f && student.averageGrade < 4.5f) {
            student.level = YCStudentLevelGood;
        }
        else if (student.averageGrade >= 3.0f && student.averageGrade < 4.0f) {
            student.level = YCStudentLevelNormal;
        }
        else if (student.averageGrade < 3.0f) {
            student.level = YCStudentLevelBad;
        }
        
        [students addObject:student];
    }
    
    return [students copy];
}

- (NSDictionary *)groupStudentsByLevel:(NSArray *)students {
 
    NSMutableDictionary *studentsDictionary = [NSMutableDictionary dictionary];
    NSMutableArray *exelentStudents = [NSMutableArray array];
    NSMutableArray *goodStudents = [NSMutableArray array];
    NSMutableArray *normalStudents = [NSMutableArray array];
    NSMutableArray *badStudents = [NSMutableArray array];
    
    for (YCStudent *student in students) {
     
        switch (student.level) {
            case YCStudentLevelExelent:
                [exelentStudents addObject:student];
                break;
            case YCStudentLevelGood:
                [goodStudents addObject:student];
                break;
            case YCStudentLevelNormal:
                [normalStudents addObject:student];
                break;
            case YCStudentLevelBad:
                [badStudents addObject:student];
                break;
        }
    }
    
    [studentsDictionary setObject:[exelentStudents copy] forKey:exelentStudentKey];
    [studentsDictionary setObject:[goodStudents copy] forKey:goodStudentKey];
    [studentsDictionary setObject:[normalStudents copy] forKey:normalStudentKey];
    [studentsDictionary setObject:[badStudents copy] forKey:badStudentKey];
    
    return [studentsDictionary copy];
}

- (NSDictionary *)sortStudentsByLastName:(NSDictionary *)students {
 
    NSArray *keys = @[exelentStudentKey, goodStudentKey, normalStudentKey, badStudentKey];
    NSArray *sortedArray = [NSArray array];
    NSMutableDictionary *sortedStudentsDictionary = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < keys.count; i++) {
        
        sortedArray = [[students objectForKey:keys[i]] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
            return [[(YCStudent *)obj1 lastName] compare:[(YCStudent *)obj2 lastName]];
        }];
        
        [sortedStudentsDictionary setObject:sortedArray forKey:keys[i]];
    }
    
    return [sortedStudentsDictionary copy];
}
*/

#pragma mark - Impossible 1
/*
typedef NS_ENUM(NSInteger, YCColorSection) {
    YCColorSectionType = 4
};

static NSString *const YCStudentCellIdentifier = @"StudentCell";
static NSString *const YCColorCellIdentifier = @"ColorCell";
static const NSInteger kColorCellCount = 10;

@interface ViewController ()

@property (strong, nonatomic) NSArray *allStudents;
@property (strong, nonatomic) NSDictionary *studentsByLevel;
@property (strong, nonatomic) NSMutableArray *colorCells;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
 
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allStudents = [self createStudents];
    
    self.studentsByLevel = [self groupStudentsByLevel:self.allStudents];
    self.studentsByLevel = [self sortStudentsByLastName:self.studentsByLevel];
    
    self.colorCells = [NSMutableArray array];
    NSString *rgbColorString = nil;
    
    for (NSInteger i = 0; i < kColorCellCount; i++) {
        
        YCColorCell *colorCell = [YCColorCell new];
        
        colorCell.color = [self getRandomColorAndGetConvertedToStringColor:&rgbColorString];
        colorCell.name = rgbColorString;
        [self.colorCells addObject:colorCell];
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = 0;
    
    switch (section) {
        case YCStudentLevelExelent:
            rows = [[self.studentsByLevel objectForKey:exelentStudentKey] count];
            break;
        case YCStudentLevelGood:
            rows = [[self.studentsByLevel objectForKey:goodStudentKey] count];
            break;
        case YCStudentLevelNormal:
            rows = [[self.studentsByLevel objectForKey:normalStudentKey] count];
            break;
        case YCStudentLevelBad:
            rows = [[self.studentsByLevel objectForKey:badStudentKey] count];
            break;
        case YCColorSectionType:
            rows = kColorCellCount;
            break;
    }
    
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.studentsByLevel.count + 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *sectionName = nil;
    
    switch (section) {
        case YCStudentLevelExelent:
            sectionName = @"Exelent students:";
            break;
        case YCStudentLevelGood:
            sectionName = @"Good students:";
            break;
        case YCStudentLevelNormal:
            sectionName = @"Normal students:";
            break;
        case YCStudentLevelBad:
            sectionName = @"Bad students:";
            break;
        case YCColorSectionType:
            sectionName = @"Colors:";
            break;
    }
    
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section != YCColorSectionType) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:YCStudentCellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:YCStudentCellIdentifier];
        }
        
        YCStudent *student = nil;
        
        switch (indexPath.section) {
            case YCStudentLevelExelent:
                student = [self.studentsByLevel objectForKey:exelentStudentKey][indexPath.row];
                break;
            case YCStudentLevelGood:
                student = [self.studentsByLevel objectForKey:goodStudentKey][indexPath.row];
                break;
            case YCStudentLevelNormal:
                student = [self.studentsByLevel objectForKey:normalStudentKey][indexPath.row];
                break;
            case YCStudentLevelBad:
                student = [self.studentsByLevel objectForKey:badStudentKey][indexPath.row];
                break;
        }
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", student.averageGrade];
        
        if (student.averageGrade < 3.0f) {
            cell.textLabel.textColor = UIColor.redColor;
        }
        cell.textLabel.text = [student.lastName stringByAppendingFormat:@" %@", student.firstName];
    }
    else {
    
        cell = [tableView dequeueReusableCellWithIdentifier:YCColorCellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YCColorCellIdentifier];
        }
        
        YCColorCell *colorWithName = self.colorCells[indexPath.row];
        
        cell.backgroundColor = colorWithName.color;
        cell.textLabel.text = colorWithName.name;;
    }
    
    return cell;
}


#pragma mark - Additional Methods

- (NSArray *)createStudents {
    
    NSArray *firstNames = @[@"Ivan", @"Yuriy", @"Viktor", @"Pavel", @"Kiril", @"Nikita", @"Aleksandra", @"Alexey",
                            @"Angelina", @"Anna", @"Anna", @"Nikita"];
    
    NSArray *lastNames = @[@"Ivanov", @"Popov", @"Novosad", @"Mankevich", @"Aistov", @"Baydin", @"Basova", @"Vorotnikov",
                           @"Gordeeva", @"Gorelova", @"Demidova", @"Korchagin"];
    
    NSMutableArray *students = [NSMutableArray array];
    
    for (NSInteger i = 0; i < firstNames.count; i++) {
        
        YCStudent *student = [YCStudent new];
        
        student.firstName = firstNames[i];
        student.lastName = lastNames[i];
        student.averageGrade = (CGFloat)arc4random_uniform(UINT32_MAX) / UINT32_MAX * (5 - 2) + 2;
        
        if (student.averageGrade <= 5.0f && student.averageGrade >= 4.5f) {
            student.level = YCStudentLevelExelent;
        }
        else if (student.averageGrade >= 4.0f && student.averageGrade < 4.5f) {
            student.level = YCStudentLevelGood;
        }
        else if (student.averageGrade >= 3.0f && student.averageGrade < 4.0f) {
            student.level = YCStudentLevelNormal;
        }
        else if (student.averageGrade < 3.0f) {
            student.level = YCStudentLevelBad;
        }
        
        [students addObject:student];
    }
    
    return [students copy];
}

- (NSDictionary *)groupStudentsByLevel:(NSArray *)students {
    
    NSMutableDictionary *studentsDictionary = [NSMutableDictionary dictionary];
    NSMutableArray *exelentStudents = [NSMutableArray array];
    NSMutableArray *goodStudents = [NSMutableArray array];
    NSMutableArray *normalStudents = [NSMutableArray array];
    NSMutableArray *badStudents = [NSMutableArray array];
    
    for (YCStudent *student in students) {
        
        switch (student.level) {
            case YCStudentLevelExelent:
                [exelentStudents addObject:student];
                break;
            case YCStudentLevelGood:
                [goodStudents addObject:student];
                break;
            case YCStudentLevelNormal:
                [normalStudents addObject:student];
                break;
            case YCStudentLevelBad:
                [badStudents addObject:student];
                break;
        }
    }
    
    [studentsDictionary setObject:[exelentStudents copy] forKey:exelentStudentKey];
    [studentsDictionary setObject:[goodStudents copy] forKey:goodStudentKey];
    [studentsDictionary setObject:[normalStudents copy] forKey:normalStudentKey];
    [studentsDictionary setObject:[badStudents copy] forKey:badStudentKey];
    
    return [studentsDictionary copy];
}

- (NSDictionary *)sortStudentsByLastName:(NSDictionary *)students {
    
    NSArray *keys = @[exelentStudentKey, goodStudentKey, normalStudentKey, badStudentKey];
    NSArray *sortedArray = [NSArray array];
    NSMutableDictionary *sortedStudentsDictionary = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < keys.count; i++) {
        
        sortedArray = [[students objectForKey:keys[i]] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
            return [[(YCStudent *)obj1 lastName] compare:[(YCStudent *)obj2 lastName]];
        }];
        
        [sortedStudentsDictionary setObject:sortedArray forKey:keys[i]];
    }
    
    return [sortedStudentsDictionary copy];
}

- (UIColor *)getRandomColorAndGetConvertedToStringColor:(NSString **)rgbColorString {
    
    CGFloat red = (CGFloat)arc4random_uniform(256);
    CGFloat green = (CGFloat)arc4random_uniform(256);
    CGFloat blue = (CGFloat)arc4random_uniform(256);
    
    *rgbColorString = [NSString stringWithFormat:@"RGB (%g %g %g)", red, green, blue];
    
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1.0f];
}
*/

#pragma mark - Impossible

typedef NS_ENUM(NSInteger, YCColorSection) {
    YCColorSectionType = 4
};

static NSString *const YCStudentCellIdentifier = @"StudentCell";
static NSString *const YCColorCellIdentifier = @"ColorCell";
static const NSInteger kColorCellCount = 10;

@interface ViewController ()

@property (strong, nonatomic) NSArray *allStudents;
@property (strong, nonatomic) NSArray *studentsGroupByLevel;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];

    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;

    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];

    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    tableView.dataSource = self;

    [self.view addSubview:tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allStudents = [self createStudents];
    
    self.studentsGroupByLevel = [self groupStudentsByLevel:self.allStudents];
    self.studentsGroupByLevel = [self sortStudentsByLastName:self.studentsGroupByLevel];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = 0;
    
    if (section != YCColorSectionType) {
        rows = [self.studentsGroupByLevel[section] count];
    }
    else {
        rows = kColorCellCount;
    }
    
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.studentsGroupByLevel.count + 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *sectionName = nil;
    NSArray *name = @[@"Exelent students:", @"Good students:", @"Normal students:", @"Bad students:", @"Colors:"];
    
    sectionName = name[section];
    
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    NSString *rgbColorString = nil;
    
    if (indexPath.section != YCColorSectionType) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:YCStudentCellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:YCStudentCellIdentifier];
        }
        
        YCStudent *student = self.studentsGroupByLevel[indexPath.section][indexPath.row];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", student.averageGrade];
        
        if (student.averageGrade < 3.0f) {
            cell.textLabel.textColor = UIColor.redColor;
        }
        cell.textLabel.text = [student.lastName stringByAppendingFormat:@" %@", student.firstName];
    }
    else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:YCColorCellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YCColorCellIdentifier];
        }
        
        YCColorCell *colorCell = [YCColorCell new];
        
        colorCell.color = [self getRandomColorAndGetConvertedToStringColor:&rgbColorString];
        colorCell.name = rgbColorString;
        cell.backgroundColor = colorCell.color;
        cell.textLabel.text = colorCell.name;;
    }
    
    return cell;
}


#pragma mark - Additional Methods

- (NSArray *)createStudents {
    
    NSArray *firstNames = @[@"Ivan", @"Yuriy", @"Viktor", @"Pavel", @"Kiril", @"Nikita", @"Aleksandra", @"Alexey",
                            @"Angelina", @"Anna", @"Anna", @"Nikita"];
    
    NSArray *lastNames = @[@"Ivanov", @"Popov", @"Novosad", @"Mankevich", @"Aistov", @"Baydin", @"Basova", @"Vorotnikov",
                           @"Gordeeva", @"Gorelova", @"Demidova", @"Korchagin"];
    
    NSMutableArray *students = [NSMutableArray array];
    
    for (NSInteger i = 0; i < firstNames.count; i++) {
        
        YCStudent *student = [YCStudent new];
        
        student.firstName = firstNames[i];
        student.lastName = lastNames[i];
        student.averageGrade = (CGFloat)arc4random_uniform(UINT32_MAX) / UINT32_MAX * (5 - 2) + 2;
        
        if (student.averageGrade <= 5.0f && student.averageGrade >= 4.5f) {
            student.level = YCStudentLevelExelent;
        }
        else if (student.averageGrade >= 4.0f && student.averageGrade < 4.5f) {
            student.level = YCStudentLevelGood;
        }
        else if (student.averageGrade >= 3.0f && student.averageGrade < 4.0f) {
            student.level = YCStudentLevelNormal;
        }
        else if (student.averageGrade < 3.0f) {
            student.level = YCStudentLevelBad;
        }
        
        [students addObject:student];
    }
    
    return [students copy];
}

- (NSArray *)groupStudentsByLevel:(NSArray *)students {
    
    NSArray *groupedStudents = [NSMutableArray array];
    NSMutableArray *exelentStudents = [NSMutableArray array];
    NSMutableArray *goodStudents = [NSMutableArray array];
    NSMutableArray *normalStudents = [NSMutableArray array];
    NSMutableArray *badStudents = [NSMutableArray array];
    
    for (YCStudent *student in students) {
        
        switch (student.level) {
            case YCStudentLevelExelent:
                [exelentStudents addObject:student];
                break;
            case YCStudentLevelGood:
                [goodStudents addObject:student];
                break;
            case YCStudentLevelNormal:
                [normalStudents addObject:student];
                break;
            case YCStudentLevelBad:
                [badStudents addObject:student];
                break;
        }
    }
    
    groupedStudents = @[[exelentStudents copy], [goodStudents copy], [normalStudents copy], [badStudents copy]];
    
    return groupedStudents;
}

- (NSArray *)sortStudentsByLastName:(NSArray *)students {

    NSMutableArray *sortedStudents = [NSMutableArray array];
    NSArray *tempArray = nil;
    
    for (NSInteger i = 0; i < students.count; i++) {
        
        tempArray = [students[i] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
            return [[(YCStudent *)obj1 lastName] compare:[(YCStudent *)obj2 lastName]];
        }];
        
        [sortedStudents addObject:tempArray];
    }
    
    return [sortedStudents copy];
}

- (UIColor *)getRandomColorAndGetConvertedToStringColor:(NSString **)rgbColorString {
    
    CGFloat red = (CGFloat)arc4random_uniform(256);
    CGFloat green = (CGFloat)arc4random_uniform(256);
    CGFloat blue = (CGFloat)arc4random_uniform(256);
    
    *rgbColorString = [NSString stringWithFormat:@"RGB (%g %g %g)", red, green, blue];
    
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1.0f];
}


@end
