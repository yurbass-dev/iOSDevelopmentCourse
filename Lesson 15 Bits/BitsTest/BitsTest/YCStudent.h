//
//  YCStudent.h
//  BitsTest
//
//  Created by Yuriy on 25.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, YCStudentSubjectType)
{
    YCStudentSubjectTypeBiology         = 1 << 0,
    YCStudentSubjectTypeMath            = 1 << 1,
    YCStudentSubjectTypeDevelopment     = 1 << 2,
    YCStudentSubjectTypeEngineering     = 1 << 3,
    YCStudentSubjectTypeArt             = 1 << 4,
    YCStudentSubjectTypePhycology       = 1 << 5,
    YCStudentSubjectTypeAnatomy         = 1 << 6
};

@interface YCStudent : NSObject

@property (assign, nonatomic) YCStudentSubjectType subjectType;

/*
@property (assign, nonatomic) BOOL studiesBiology;
@property (assign, nonatomic) BOOL studiesMath;
@property (assign, nonatomic) BOOL studiesDevelopment;
@property (assign, nonatomic) BOOL studiesEngineering;
@property (assign, nonatomic) BOOL studiesArt;
@property (assign, nonatomic) BOOL studiesPhycology;
@property (assign, nonatomic) BOOL studiesAnatomy;
*/

@end

NS_ASSUME_NONNULL_END

