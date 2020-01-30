//
//  AppDelegate.m
//  TimeHW
//
//  Created by Yuriy on 26.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#pragma mark - Tasks
    /*
    Ученик.
     
    1. Создайте класс студент у которого будет проперти dateOfBirth (дата рождения), которая собственно NSDate.
    2. Инициализируйте NSMutableArray и в цикле создайте 30 студентов.
    3. Каждому установите дату рождения. Возраст рандомный от 16 до 50 лет.
    4. В другом цикле пройдитесь по всему массиву и выведите день рождения каждого студента в адекватном формате.
    
    Студент.
    
    5. Отсортируйте массив студентов по дате рождения, начиная от самого юного.
    6. Используя массивы имен и фамилий (по 5-10 имен и фамилий), каждому студенту установите случайное имя и случайную фамилию.
    7. Выведите отсортированных студентов: Имя, Фамилия, год рождения
    
    Мастер.
    
    10. Создайте таймер в апп делегате, который отсчитывает один день за пол секунды.
    11. Когда таймер доходит до дня рождения любого из студентов - поздравлять его с днем рождения.
    12. Выведите на экран разницу в возрасте между самым молодым и самым старым студентом (количество лет, месяцев, недель и дней)
    
    Супермен.
    
    13. Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
    14. Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
    15. Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)
    */
    
#pragma mark - Pupil
    /*
    NSMutableArray *arrayStudents = [NSMutableArray array];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    
    for (NSUInteger i = 0; i < 30; i++)
    {
        YCStudent *student = [[YCStudent alloc] init];
        
        // создать рандомный возраст от 16 до 50 и найти год рождения (отнять возраст от текущего года)
        NSUInteger year = dateComponents.year - (arc4random_uniform(35) + 16);
        
        NSUInteger month = arc4random_uniform(12) + 1;
        
        NSUInteger day = arc4random_uniform(31) + 1;
        
        NSDate *dateOfBirth = [dateFormatter dateFromString:[NSString stringWithFormat:@"%lu.%lu.%lu", day, month, year]];
        
        // если получилась некорректная дата (например 31.02.2000), то найти другую дату
        if (dateOfBirth == nil)
        {
            i--;
            continue;
        }
        
        student.dateOfBirth = dateOfBirth;
        
        student.firstName = [NSString stringWithFormat:@"Student%lu", i + 1];
        
        [arrayStudents addObject:student];
    }
    
    for (YCStudent *student in arrayStudents)
    {
        NSLog(@"%@ was born in %@", student.firstName, [dateFormatter stringFromDate:student.dateOfBirth]);
    }
    
#pragma mark - Student
    
    [arrayStudents sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [[obj1 dateOfBirth] compare:[obj2 dateOfBirth]];
    }];
    
    for (YCStudent *student in arrayStudents)
    {
        [student getFirstAndLastNames];
    }
    
    NSLog(@"");
    NSLog(@"Sorted by date birth:");
    for (YCStudent *student in arrayStudents)
    {
        NSLog(@"%@ %@ %@", student.firstName, student.lastName, [dateFormatter stringFromDate:student.dateOfBirth]);
    }
    */
#pragma mark - Master
    /*
    [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        static BOOL isFirst = YES;
        
        NSDate *finishDate = [calendar dateByAddingUnit:NSCalendarUnitYear value:1 toDate:[NSDate date] options:0];
        
        static NSDate *nextDayDate = nil;
        
        if (isFirst)
        {
            nextDayDate = [NSDate date];
            isFirst = NO;
        }

        if ([nextDayDate compare:finishDate] == NSOrderedAscending)
        {
            nextDayDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:nextDayDate options:0];
            
            for (YCStudent *student in arrayStudents)
            {
                NSDateComponents *nextDayComponents = [calendar components:NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nextDayDate];
                NSDateComponents *studentDateComponents = [calendar components:NSCalendarUnitMonth | NSCalendarUnitDay fromDate:student.dateOfBirth];
                
                if ((nextDayComponents.day == studentDateComponents.day) && (nextDayComponents.month == studentDateComponents.month))
                {
                    NSLog(@"Today %@, Happy Birthday, dear %@ %@ %@.", [dateFormatter stringFromDate:nextDayDate], student.firstName,
                                                                        student.lastName, [dateFormatter stringFromDate:student.dateOfBirth]);
                }
            }
        }
        else
            [timer invalidate];     // завершить таймер
    }];
    
    YCStudent *youngestStudent = [arrayStudents objectAtIndex:0];
    YCStudent *oldestStudent = [arrayStudents objectAtIndex:[arrayStudents count] - 1];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth | NSCalendarUnitDay
                                               fromDate:youngestStudent.dateOfBirth
                                                 toDate:oldestStudent.dateOfBirth
                                                options:0];
    NSLog(@"");
    NSLog(@"Youngest student = %@ %@ %@", youngestStudent.firstName, youngestStudent.lastName, [dateFormatter stringFromDate:youngestStudent.dateOfBirth]);
    NSLog(@"Oldest student = %@ %@ %@", oldestStudent.firstName, oldestStudent.lastName, [dateFormatter stringFromDate:oldestStudent.dateOfBirth]);
    NSLog(@"Age difference:");
    NSLog(@"Years: %ld", components.year);
    NSLog(@"Months: %ld", components.month);
    NSLog(@"Weeks: %ld", components.weekOfMonth);
    NSLog(@"Days: %ld", components.day);
    NSLog(@"");
    */
#pragma mark - Superman
    
    // 13. Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    
    // Находим текущий год и устанавливаем месяц и день в начало года
    NSDateComponents *startOfYearCompnts = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    startOfYearCompnts.day = 1;
    startOfYearCompnts.month = 1;
    NSDate * startOfYear = [calendar dateFromComponents:startOfYearCompnts];
    
    // Находим текущий год и устанавливаем месяц и день в конец года
    NSDateComponents *endOfYearCompnts = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    endOfYearCompnts.day = 31;
    endOfYearCompnts.month = 12;
    
    NSLog(@"First day in month:");
    
    // Пока это текущий год
    while (startOfYearCompnts.year == endOfYearCompnts.year)
    {
        NSLog(@"%@", [dateFormatter stringFromDate:startOfYear]);
        // Переход к следующему месяцу
        startOfYear = [calendar dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:startOfYear options:0];
        
        startOfYearCompnts = [calendar components:NSCalendarUnitYear fromDate:startOfYear];
    }
    NSLog(@"");
    
    
    //14. Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
    
    // Находим текущий год и задаем день недели и номер дня недели в месяце
    NSDateComponents *firstSundayOfYearCompnts = [calendar components:NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal fromDate:[NSDate date]];
    firstSundayOfYearCompnts.weekday = 1;           // 1 - Sunday, 2 - Mondey ... 7 - Saturday
    firstSundayOfYearCompnts.weekdayOrdinal = 1;    // first Sunday in month
    startOfYear = [calendar dateFromComponents:firstSundayOfYearCompnts];
    
    [dateFormatter setDateFormat:@"dd.MM"];
    
    NSLog(@"Date of every sunday in the year:");
    
    // Пока это текущий год
    while (firstSundayOfYearCompnts.year == endOfYearCompnts.year)
    {
        NSLog(@"%@", [dateFormatter stringFromDate:startOfYear]);
        // Переходим к следующей неделе
        startOfYear = [calendar dateByAddingUnit:NSCalendarUnitWeekdayOrdinal value:1 toDate:startOfYear options:0];
        
        firstSundayOfYearCompnts = [calendar components:NSCalendarUnitYear fromDate:startOfYear];
    }
    NSLog(@"");
    
    
    // 15. Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)
    NSLog(@"Count of working days in the year:");
    
    // Находим текущий год и устанавливаем месяц и день в начало года
    startOfYearCompnts = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:[NSDate date]];
    startOfYearCompnts.day = 1;
    startOfYearCompnts.month = 1;
    startOfYear = [calendar dateFromComponents:startOfYearCompnts];
    
    [dateFormatter setDateFormat:@"MMMM yyyy"];

    // Пока это текущий год
    while (startOfYearCompnts.year == endOfYearCompnts.year)
    {
        // Количество рабочих дней в месяце
        NSUInteger workingDaysInMonth = 0;
        // Дата начала года, но на месяц вперед
        NSDate *currentDatePlusMonth = [calendar dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:startOfYear options:0];
        // Находим количество дней в текущем месяце
        NSDateComponents *daysInMonthComps = [calendar components:NSCalendarUnitDay fromDate:startOfYear toDate:currentDatePlusMonth options:0];
        
        // Выполнять пока не пройдем все дни в месяце
        for (NSUInteger i = 1; i <= daysInMonthComps.day; i++)
        {
            // Если это не суббота и не воскресенье
            if (startOfYearCompnts.weekday != 7 && startOfYearCompnts.weekday != 1)
                workingDaysInMonth++;
            // Если это последний день месяца
            if (i == daysInMonthComps.day)
                NSLog(@"Working days in %@ = %lu", [dateFormatter stringFromDate:startOfYear], workingDaysInMonth);
            // Переходим к следующему дню
            startOfYear = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startOfYear options:0];
            
            startOfYearCompnts = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitDay fromDate:startOfYear];
        }
    }
    
    /*
    NSDate *date = [NSDate date];
     
    // Находит количество недель в году
    // Можно находить разные параметры (количество дней в месяце, году...)
    
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitYear forDate:date];
    
    NSLog(@"%ld", range.length);
    */
     
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
