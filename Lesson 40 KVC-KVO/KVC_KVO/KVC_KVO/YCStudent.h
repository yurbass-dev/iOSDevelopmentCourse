//
//  YCStudent.h
//  KVC_KVO
//
//  Created by Yuriy on 2/9/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YCStudentGender) {
    YCStudentGenderMale,
    YCStudentGenderFemale
};

NS_ASSUME_NONNULL_BEGIN

@interface YCStudent : NSObject

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) YCStudentGender gender;
@property (copy, nonatomic) NSString *grade;
@property (weak, nonatomic) YCStudent *myFriend;

+ (YCStudent *)createRandomStudent;
- (void)clearStudent;

@end

NS_ASSUME_NONNULL_END
