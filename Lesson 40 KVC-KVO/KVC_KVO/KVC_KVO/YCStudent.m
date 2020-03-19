//
//  YCStudent.m
//  KVC_KVO
//
//  Created by Yuriy on 2/9/20.
//  Copyright © 2020 Yuriy. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

+ (YCStudent *)createRandomStudent {
    
    YCStudent *student = [YCStudent new];
    
    NSArray *maleFirstNames = @[@"Ivan", @"Yuriy", @"Viktor", @"Pavel", @"Kiril", @"Alexey", @"Nikita"];
    NSArray *maleLastNames = @[@"Ivanov", @"Popov", @"Novosad", @"Mankevich", @"Aistov", @"Vorotnikov", @"Korchagin"];
    NSArray *femaleFirstNames = @[@"Aleksandra", @"Angelina", @"Ekaterina", @"Olga", @"Viktoria", @"Nina", @"Karina"];
    NSArray *femaleLastNames = @[@"Basova", @"Gordeeva", @"Gorelova", @"Demidova", @"Andreeva", @"Kovalenko", @"Pavlova"];
    
    student.gender = arc4random_uniform(2) ? YCStudentGenderFemale : YCStudentGenderMale;
    
    if (student.gender == YCStudentGenderMale) {
        student.firstName = maleFirstNames[arc4random_uniform((uint32_t)[maleFirstNames count])];
        student.lastName = maleLastNames[arc4random_uniform((uint32_t)[maleLastNames count])];
    }
    else {
        student.firstName = femaleFirstNames[arc4random_uniform((uint32_t)[femaleFirstNames count])];
        student.lastName = femaleLastNames[arc4random_uniform((uint32_t)[femaleLastNames count])];
    }
    
    NSDate *endDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitYear
                                                                    value:-17
                                                                   toDate:[NSDate date]
                                                                  options:0];
    
    NSDate *startDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitYear
                                                                 value:-30
                                                                toDate:[NSDate date]
                                                               options:0];
    
    NSTimeInterval timeBetweenDates = [endDate timeIntervalSinceDate:startDate];
    NSTimeInterval randomInterval = ((NSTimeInterval)arc4random_uniform(UINT32_MAX) / UINT32_MAX) * timeBetweenDates;
    student.dateOfBirth = [startDate dateByAddingTimeInterval:randomInterval];
    
    NSArray *gradeData = @[@"A", @"B", @"C", @"D", @"E", @"FX", @"F"];
    student.grade = gradeData[arc4random_uniform((uint32_t)gradeData.count)];
    
    return student;
}

- (void)clearStudent {
    
    [self willChangeValueForKey:@"firstName"];
    _firstName = @"";
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = @"";
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:0.0];
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"gender"];
    _gender = YCStudentGenderMale;
    [self didChangeValueForKey:@"gender"];
    
    [self willChangeValueForKey:@"grade"];
    _grade = @"";
    [self didChangeValueForKey:@"grade"];
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", self.firstName, self.lastName, self.dateOfBirth,
                                                         self.gender ? @"Female" : @"Male", self.grade];
}

@end
