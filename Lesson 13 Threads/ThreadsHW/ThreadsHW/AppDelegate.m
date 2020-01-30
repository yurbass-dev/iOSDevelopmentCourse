//
//  AppDelegate.m
//  ThreadsHW
//
//  Created by Yuriy on 06.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCStudent.h"
#import "YCStudentOperation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    #pragma mark - Tasks
    /*
     Ученик.
     
     1. Создайте класс студент. У него должен быть метод - угадать ответ :)
     2. В метод передается случайное целое число например в диапазоне от 0 - 100 (или больше) и сам диапазон, чтобы студент знал где угадывать
     3. Студент генерирует случайное число в том же диапазоне пока оно не будет искомым
     4. Весь процесс угадывания реализуется в потоке в классе студент
     5. Когда студент досчитал то пусть пишет в НСЛог
     6. Создайте 5 студентов и дайте им одну и туже задачу и посмотрите кто справился с ней лучше
     
     Студент.
     
     7. Задача та же, но вместе с условием передавайте студенту блок, в котором вы и объявите результаты
     8. Блок должен определяться в томже классе, где и определялись студенты
     9. Блок должен быть вызван на главном потоке
     
     Мастер.
     
     10. Создать приватный метод класса (да да, приватный метод да еще и с плюсом), который будет возвращать статическую (то есть одну на все объекты класса студент) dispatch_queue_t, которая инициализируется при первом обращении к этому методу.
     11. Лучше в этом методе реализовать блок dispatch_once, ищите в инете как и зачем :) А что, программист всегда что-то ищет и хороший программист всегда находит.
     12. Все студенты должны выполнять свои процессы в этой queue и она должна быть CONCURRENT, типа все блоки одновременно выполняются
     
     Супермен.
     
     13. Добавьте еще один класс студента, который делает все тоже самое что вы реализовали до этого, только вместо GCD он использует NSOperation и NSOperationQueue. Вообще вынос мозга в самостоятельной работе :)
     14. Все сделавшие Мастера и Супермена и с красивым кодом получают отдельный огромный РЕСПЕКТ, так как они это на самом деле заслуживают.
     */
    
    #pragma mark - Pupil
    /*
    YCStudent *student1 = [[YCStudent alloc] init];
    YCStudent *student2 = [[YCStudent alloc] init];
    YCStudent *student3 = [[YCStudent alloc] init];
    YCStudent *student4 = [[YCStudent alloc] init];
    YCStudent *student5 = [[YCStudent alloc] init];
    
    student1.name = @"Oleg";
    student2.name = @"Viktoriya";
    student3.name = @"Nikita";
    student4.name = @"Oksana";
    student5.name = @"Stepan";
    
    [student1 guessNumber: 17 rangeFrom: 0 to: 100];
    [student2 guessNumber: 99 rangeFrom: 0 to: 100];
    [student3 guessNumber: 50 rangeFrom: 0 to: 100];
    [student4 guessNumber: 100 rangeFrom: 0 to: 100];
    [student5 guessNumber: 1 rangeFrom: 0 to: 100];
    */
    
    #pragma mark - Student
    /*
    YCStudent *student1 = [[YCStudent alloc] init];
    YCStudent *student2 = [[YCStudent alloc] init];
    YCStudent *student3 = [[YCStudent alloc] init];
    YCStudent *student4 = [[YCStudent alloc] init];
    YCStudent *student5 = [[YCStudent alloc] init];
    
    student1.name = @"Oleg";
    student2.name = @"Viktoriya";
    student3.name = @"Nikita";
    student4.name = @"Oksana";
    student5.name = @"Stepan";
    
    FindNumBlock findNumBlock = ^(NSInteger number, NSInteger min, NSInteger max, NSString *name)
    {
        NSInteger numFinding;
        
        // Выполнять генерацию чисел, пока не будет найдено искомое число
        do
        {
            numFinding = arc4random() % (max - min + 1) + min;
        }
        while (number != numFinding);
        
        NSLog(@"Student %@ found your number, this is %ld!", name, numFinding);
    };
    
    [student1 guessNumber: 17 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student2 guessNumber: 99 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student3 guessNumber: 50 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student4 guessNumber: 100 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student5 guessNumber: 1 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    */
    
    #pragma mark - Superman
    
    YCStudentOperation *student1 = [[YCStudentOperation alloc] init];
    YCStudentOperation *student2 = [[YCStudentOperation alloc] init];
    YCStudentOperation *student3 = [[YCStudentOperation alloc] init];
    YCStudentOperation *student4 = [[YCStudentOperation alloc] init];
    YCStudentOperation *student5 = [[YCStudentOperation alloc] init];

    student1.name = @"Oleg";
    student2.name = @"Viktoriya";
    student3.name = @"Nikita";
    student4.name = @"Oksana";
    student5.name = @"Stepan";
    
    FindNumBlock findNumBlock = ^(NSInteger number, NSInteger min, NSInteger max, NSString *name)
    {
        NSInteger numFinding;
        
        // Выполнять генерацию чисел, пока не будет найдено искомое число
        do
        {
            numFinding = arc4random() % (max - min + 1) + min;
        }
        while (number != numFinding);
        
        NSLog(@"Student %@ found your number, this is %ld!", name, numFinding);
    };
    
    [student1 guessNumber: 17 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student2 guessNumber: 99 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student3 guessNumber: 50 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student4 guessNumber: 100 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    [student5 guessNumber: 1 rangeFrom: 0 to: 100 withBlock: findNumBlock];
    
    
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
