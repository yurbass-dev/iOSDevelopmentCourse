//
//  YCStudentInfoPopoverController.h
//  MapHW
//
//  Created by Yuriy on 17.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCAnnotationInfoPopoverController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *surnameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *dateOfBirthCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *genderCell;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (strong, nonatomic) YCStudent *student;



@end

NS_ASSUME_NONNULL_END
