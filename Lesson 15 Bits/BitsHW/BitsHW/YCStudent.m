//
//  YCStudent.m
//  BitsHW
//
//  Created by Yuriy on 25.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

- (YCStudentTypeStudent) getTypeStudent
{
    NSUInteger countTech = 0;
    NSUInteger countHumanist = 0;
    
    if (self.subjectType & YCStudentSubjectTypeBiology)
        countHumanist++;
    
    if (self.subjectType & YCStudentSubjectTypeArt)
        countHumanist++;
    
    if (self.subjectType & YCStudentSubjectTypeAnatomy)
        countHumanist++;
    
    if (self.subjectType & YCStudentSubjectTypePhycology)
        countHumanist++;
    
    if (self.subjectType & YCStudentSubjectTypeMath)
        countTech++;
    
    if (self.subjectType & YCStudentSubjectTypeDevelopment)
        countTech++;
    
    if (self.subjectType & YCStudentSubjectTypeEngineering)
        countTech++;
    
    if (countTech > countHumanist)
        self.typeStudent = YCStudentTypeStudentTech;
    else if (countTech < countHumanist)
        self.typeStudent = YCStudentTypeStudentHumanist;
    else
        self.typeStudent = arc4random() % 2 ? YCStudentTypeStudentTech : YCStudentTypeStudentHumanist;

    return self.typeStudent;
}

- (NSString *) answerByType: (YCStudentSubjectType) type
{
    return self.subjectType & type ? @"YES" : @"NO";
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"%@ studies: "
                                        "biology = %@, "
                                        "math = %@, "
                                        "development = %@, "
                                        "engineering = %@, "
                                        "art = %@, "
                                        "phycology = %@, "
                                        "anatomy = %@",
                                        self.name,
                                        [self answerByType:YCStudentSubjectTypeBiology],
                                        [self answerByType:YCStudentSubjectTypeMath],
                                        [self answerByType:YCStudentSubjectTypeDevelopment],
                                        [self answerByType:YCStudentSubjectTypeEngineering],
                                        [self answerByType:YCStudentSubjectTypeArt],
                                        [self answerByType:YCStudentSubjectTypePhycology],
                                        [self answerByType:YCStudentSubjectTypeAnatomy]];
}

@end
