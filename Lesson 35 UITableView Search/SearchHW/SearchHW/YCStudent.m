//
//  YCStudent.m
//  SearchHW
//
//  Created by Yuriy on 02.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

+ (YCStudent *)createRandomStudent {
    
    YCStudent *student = [YCStudent new];
    
    student.firstName = [student randomFirstName];
    student.lastName = [student randomLastName];
    student.dateOfBirth = [student randomDateOfBirth];
    
    return student;
}

- (NSString *)randomFirstName {
    
    NSArray *firstNames = @[
        @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
        @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
        @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
        @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
        @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
        @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
        @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
        @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
        @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
        @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
    ];
    
    NSString *name = firstNames[arc4random_uniform((uint32_t)firstNames.count)];
    
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



@end
