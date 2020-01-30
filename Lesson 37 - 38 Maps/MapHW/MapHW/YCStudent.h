//
//  YCStudent.h
//  MapHW
//
//  Created by Yuriy on 13.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YCStudentGender) {
    YCStudentGenderMale,
    YCStudentGenderFemale
};

@interface YCStudent : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) NSUInteger dayOfBirth;
@property (assign, nonatomic) NSUInteger monthOfBirth;
@property (assign, nonatomic) NSUInteger yearOfBirth;
@property (assign, nonatomic) YCStudentGender gender;
@property (strong, nonatomic) CLPlacemark *placemark;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

+ (YCStudent *)createRandomStudent;
- (NSString *)randomFirstName;
- (NSString *)randomLastName;
- (NSDate *)randomDateOfBirth;
- (YCStudentGender)randomGender;

@end

NS_ASSUME_NONNULL_END
