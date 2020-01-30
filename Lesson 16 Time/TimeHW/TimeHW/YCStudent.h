//
//  YCStudent.h
//  TimeHW
//
//  Created by Yuriy on 26.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YCStudentGender)
{
    YCStudentGenderMale,
    YCStudentGenderFemale
};

@interface YCStudent : NSObject

@property (strong, nonatomic) NSDate *dateOfBirth;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) YCStudentGender gender;

- (void) getFirstAndLastNames;

@end

NS_ASSUME_NONNULL_END
