//
//  AppDelegate.m
//  BitsHW
//
//  Created by Yuriy on 25.10.2018.
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
     
     1. Повторите мой код и создайте класс студент с соответствующим набором предметов
     2. В цикле создайте 10 студентов и добавьте их в массив. Используйте мутабл массив
     3. У каждого рандомно установите предметы
     
     Студент
     
     4. В новом цикле пройдитесь по студентам и разделите их уже на два массива - технари и гуманитарии.
     5. Также посчитайте количество тех кто учит программирование
     
     Мастер.
     
     6. Если студенты выбрали биологию, то отмените ее у них и выведите сообщение в лог, предмет отменен
     7. Тут придется разобраться как сбросить бит, включите логику :)
     
     Супермен.
     8. Сгенерируйте случайный интежер в диапазоне от 0 до максимума.
     9. Используя цикл и битовые операции (и возможно NSMutableString) выведите это число на экран в двоичном виде
     */
    
#pragma mark - Pupil
 /*
    NSMutableArray *arrayStudents =[NSMutableArray array];
    
    for (NSUInteger i = 0; i < 10; i++)
    {
        YCStudent *student = [[YCStudent alloc] init];
        
        student.name = [NSString stringWithFormat:@"Student%lu", i + 1];
        
        // Задаем случайный перечень предметов:
        // у нас 7 предметов, значит берем маску 127 (это в двоичной системе 0111 1111)
        // с помощью маски и  операции (побитовое И), а также случайного числа от 1 до 127
        // получаем рандомный список предметов
        student.subjectType = 127 & arc4random() % 127 + 1;
        
        [arrayStudents addObject:student];
        
        NSLog(@"%@", [arrayStudents objectAtIndex:i]);
    }
 */
#pragma mark - Student
 /*
    NSMutableArray *humanists = [NSMutableArray array];
    NSMutableArray *techs = [NSMutableArray array];
    
    for (YCStudent *student in arrayStudents)
    {
       if ([student getTypeStudent] == YCStudentTypeStudentTech)
           [techs addObject:student];
        else if ([student getTypeStudent] == YCStudentTypeStudentHumanist)
            [humanists addObject:student];
    }
    NSLog(@"");
    //NSLog(@"Techs:\n%@", techs);
    //NSLog(@"Humanists:\n%@", humanists);
    
    NSUInteger count = 0;
    
    for (YCStudent *student in arrayStudents)
    {
        if (student.subjectType & YCStudentSubjectTypeDevelopment)
            count++;
    }
    //NSLog(@"%lu students study development.", count);
*/
#pragma mark - Master
 /*
    for (YCStudent *student in arrayStudents)
    {
        if (student.subjectType & YCStudentSubjectTypeBiology)
        {
            student.subjectType &= ~YCStudentSubjectTypeBiology;
            
            NSLog(@"The subject of biology was canceled by the %@", student.name);
        }
    }
    
    NSLog(@"%@", arrayStudents);
*/
#pragma mark - Superman
    
    NSUInteger num = arc4random() % NSUIntegerMax;

    NSMutableString *stringBits = [[NSMutableString alloc] init];
    
    NSUInteger mask = 0x8000000000000000;
    
    for (NSUInteger i = 0; i < 64; i++)
    {
        [stringBits insertString:[NSString stringWithFormat:@"%@", (num << i & mask) ? @"1" : @"0"] atIndex:i];
    }
    
    for (int i = 0; i < 80; i++)
    {
        if (i % 5 == 0)
            [stringBits insertString:@" " atIndex:i];
    }

    NSLog(@"decimal number = %lu", num);
    
    NSLog(@"binary number = %@", stringBits);
    
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
