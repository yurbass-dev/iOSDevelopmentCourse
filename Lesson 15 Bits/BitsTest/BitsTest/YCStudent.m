//
//  YCStudent.m
//  BitsTest
//
//  Created by Yuriy on 25.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

- (NSString *) answerByType: (YCStudentSubjectType) type
{
    return self.subjectType & type ? @"yes" : @"no";
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"Student studies:\n"
                                        "biology = %@\n"
                                        "math = %@\n"
                                        "development = %@\n"
                                        "engineering = %@\n"
                                        "art = %@\n"
                                        "phycology = %@\n"
                                        "anatomy = %@\n",
                                        [self answerByType:YCStudentSubjectTypeBiology],
                                        [self answerByType:YCStudentSubjectTypeMath],
                                        [self answerByType:YCStudentSubjectTypeDevelopment],
                                        [self answerByType:YCStudentSubjectTypeEngineering],
                                        [self answerByType:YCStudentSubjectTypeArt],
                                        [self answerByType:YCStudentSubjectTypePhycology],
                                        [self answerByType:YCStudentSubjectTypeAnatomy]];
}

@end
