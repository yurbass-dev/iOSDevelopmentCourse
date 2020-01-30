//
//  YCStudent.m
//  MapHW
//
//  Created by Yuriy on 13.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

+ (YCStudent *)createRandomStudent {
    
    YCStudent *student = [YCStudent new];
    
    student.gender = [student randomGender];
    student.firstName = [student randomFirstName];
    student.lastName = [student randomLastName];
    student.dateOfBirth = [student randomDateOfBirth];

    return student;
}

- (NSString *)randomFirstName {
    
    NSArray *firstMaleNames = @[
                                @"Tran", @"Bud", @"Clyde", @"Hildegard", @"Vernell",
                                @"Rupert", @"Billie", @"Caridad", @"Taylor", @"Ben",
                                @"Ramon", @"Jacque", @"Colton", @"Monte", @"Pam",
                                @"Willard", @"Mireille", @"Roma", @"Trang", @"Ty",
                                @"Pierre", @"Floyd", @"Denver", @"Norbert", @"Brent"
                                ];
    
    NSArray *firstFemaleNames = @[
                                  @"Lenore", @"Fredda", @"Katrice", @"Nellie", @"Tamica",
                                  @"Crystle", @"Kandi", @"Vanetta", @"Pinkie", @"Rosanna",
                                  @"Eufemia", @"Britteny", @"Telma", @"Tracy", @"Tresa",
                                  @"Elise", @"Savanna", @"Arvilla", @"Whitney", @"Meghan",
                                  @"Tandra", @"Jenise", @"Elenor", @"Jessie", @"Sha"
                                  ];
    NSString *name = nil;
    
    if (self.gender == YCStudentGenderMale) {
        name = firstMaleNames[arc4random_uniform((uint32_t)firstMaleNames.count)];
    }
    else if (self.gender == YCStudentGenderFemale) {
        name = firstFemaleNames[arc4random_uniform((uint32_t)firstFemaleNames.count)];
    }
    
    return name;
}

- (NSString *)randomLastName {
    
    NSArray *lastNames = @[
                           @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
                           @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
                           @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
                           @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
                           @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
                           @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
                           @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
                           @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
                           @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
                           @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
                           ];
    
    NSString *lastName = lastNames[arc4random_uniform((uint32_t)lastNames.count)];
    
    return lastName;
}

- (NSDate *)randomDateOfBirth {
    
    NSDateComponents *minusSeventeenYears = [NSDateComponents new];
    minusSeventeenYears.year = -17;
    NSDate *endDate = [[NSCalendar currentCalendar] dateByAddingComponents:minusSeventeenYears
                                                                    toDate:[NSDate date]
                                                                   options:0];
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)0];
    
    NSTimeInterval timeBetweenDates = [endDate timeIntervalSinceDate:startDate];
    NSTimeInterval randomInterval = ((NSTimeInterval)arc4random_uniform(UINT32_MAX) / UINT32_MAX) * timeBetweenDates;
    
    NSDate *dateOfBirth = [startDate dateByAddingTimeInterval:randomInterval];
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                                       fromDate:dateOfBirth];
    self.dayOfBirth = [dateComponents day];
    self.monthOfBirth = [dateComponents month];
    self.yearOfBirth = [dateComponents year];
    
    return dateOfBirth;
}

- (YCStudentGender)randomGender {
    
    return arc4random_uniform(2);
}

@end
