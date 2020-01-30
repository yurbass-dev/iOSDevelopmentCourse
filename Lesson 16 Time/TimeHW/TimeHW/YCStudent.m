//
//  YCStudent.m
//  TimeHW
//
//  Created by Yuriy on 26.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

- (void) getFirstAndLastNames
{
    NSArray *maleFirstNames = @[@"Ivan", @"Yuriy", @"Viktor", @"Pavel", @"Kiril", @"Alexey", @"Nikita"];
    NSArray *maleLastNames = @[@"Ivanov", @"Popov", @"Novosad", @"Mankevich", @"Aistov", @"Vorotnikov", @"Korchagin"];
    NSArray *femaleFirstNames = @[@"Aleksandra", @"Angelina", @"Ekaterina", @"Olga", @"Viktoria", @"Nina", @"Karina"];
    NSArray *femaleLastNames = @[@"Basova", @"Gordeeva", @"Gorelova", @"Demidova", @"Andreeva", @"Kovalenko", @"Pavlova"];
    
    self.gender = arc4random_uniform(2);
    
    if (self.gender == YCStudentGenderMale)
    {
        self.firstName = [maleFirstNames objectAtIndex:arc4random_uniform((unsigned) [maleFirstNames count])];
        self.lastName = [maleLastNames objectAtIndex:arc4random_uniform((unsigned) [maleLastNames count])];
    }
    else
    {
        self.firstName = [femaleFirstNames objectAtIndex:arc4random_uniform((unsigned) [femaleFirstNames count])];
        self.lastName = [femaleLastNames objectAtIndex:arc4random_uniform((unsigned) [femaleLastNames count])];
    }
}

@end
