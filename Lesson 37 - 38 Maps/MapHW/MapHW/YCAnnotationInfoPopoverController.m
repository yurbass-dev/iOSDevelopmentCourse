//
//  YCStudentInfoPopoverController.m
//  MapHW
//
//  Created by Yuriy on 17.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCAnnotationInfoPopoverController.h"

@interface YCAnnotationInfoPopoverController ()

@property (readonly, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation YCAnnotationInfoPopoverController

@synthesize dateFormatter = _dateFormatter;

#pragma mark - Lazy Instantiation

- (NSDateFormatter *)dateFormatter {
    
    if (!_dateFormatter) {
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateFormat = @"dd MMM yyyy";
    }
    return _dateFormatter;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.preferredContentSize = CGSizeMake(self.tableView.contentSize.width, self.tableView.contentSize.height);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.nameCell.detailTextLabel.text = self.student.firstName;
    self.surnameCell.detailTextLabel.text = self.student.lastName;
    self.dateOfBirthCell.detailTextLabel.text = [self.dateFormatter stringFromDate:self.student.dateOfBirth];
    
    if (self.student.gender == YCStudentGenderMale) {
        self.genderCell.detailTextLabel.text = @"Male";
    }
    else if (self.student.gender == YCStudentGenderFemale) {
        self.genderCell.detailTextLabel.text = @"Female";
    }
    
    CLPlacemark *placemark = self.student.placemark;
    
    if (placemark.name) {
        self.streetLabel.text = placemark.name;
    }
    if (placemark.locality) {
        self.cityLabel.text = placemark.locality;
    }
    if (placemark.country) {
        self.countryLabel.text = placemark.country;
    }
}


@end
