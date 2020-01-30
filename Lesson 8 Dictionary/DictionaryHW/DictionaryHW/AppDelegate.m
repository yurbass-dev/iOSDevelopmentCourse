//
//  AppDelegate.m
//  DictionaryHW
//
//  Created by Yuriy on 05.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Уровень Ученик
     1. Создайте класс студент со свойствами имя, фамилия и фраза приветствия.
     2. Создайте 10 - 15 объектов этого класса.
     3. Теперь мы создадим дикшинари типо школьный журнал, где ключ будет фамилия + имя, а значение сам студент.
     4. Распечатайте дикшинари
     
     Уровень Студент.
     4. В цикле пройдемся по всем ключам в дикшинари и распечатаем имя и фамилию каждого студента + его фразу приветствия.
     
     Уровень Мастер.
     5. Чтобы сделать тоже самое но по какому-то порядку, отсортируйте массив ключей по возрастанию и выведите приветствие каждого студента из дикшинари, но уже по отсортированному списку.
     */
    
    // Pupil
    YCStudent *student1 = [[YCStudent alloc] initWithName:@"Ivan" andLastName:@"Ivanov" andGreeting:@"How are you?"];
    YCStudent *student2 = [[YCStudent alloc] initWithName:@"Yuriy" andLastName:@"Popov" andGreeting:@"Good morning!"];
    YCStudent *student3 = [[YCStudent alloc] initWithName:@"Viktor" andLastName:@"Novosad" andGreeting:@"Good afternoon!"];
    YCStudent *student4 = [[YCStudent alloc] initWithName:@"Pavel" andLastName:@"Mankevich" andGreeting:@"Goog evening!"];
    YCStudent *student5 = [[YCStudent alloc] initWithName:@"Kiril" andLastName:@"Aistov" andGreeting:@"How's it going?"];
    YCStudent *student6 = [[YCStudent alloc] initWithName:@"Nikita" andLastName:@"Baydin" andGreeting:@"Hello!"];
    YCStudent *student7 = [[YCStudent alloc] initWithName:@"Aleksandra" andLastName:@"Basova" andGreeting:@"How are things?"];
    YCStudent *student8 = [[YCStudent alloc] initWithName:@"Alexey" andLastName:@"Vorotnikov" andGreeting:@"What's new?"];
    YCStudent *student9 = [[YCStudent alloc] initWithName:@"Angelina" andLastName:@"Gordeeva" andGreeting:@"Morning!"];
    YCStudent *student10 = [[YCStudent alloc] initWithName:@"Anna" andLastName:@"Gorelova" andGreeting:@"Hi!"];
    YCStudent *student11 = [[YCStudent alloc] initWithName:@"Anna" andLastName:@"Demidova" andGreeting:@"Good day!"];
    YCStudent *student12 = [[YCStudent alloc] initWithName:@"Nikita" andLastName:@"Korchagin" andGreeting:@"Howdy, partner!"];
    
    // Для вывода имени обьекта
    student1.nameObject = @"student1";
    student2.nameObject = @"student2";
    student3.nameObject = @"student3";
    student4.nameObject = @"student4";
    student5.nameObject = @"student5";
    student6.nameObject = @"student6";
    student7.nameObject = @"student7";
    student8.nameObject = @"student8";
    student9.nameObject = @"student9";
    student10.nameObject = @"student10";
    student11.nameObject = @"student11";
    student12.nameObject = @"student12";
    
    NSDictionary *group = @{@"Ivanov Ivan": student1,
                            @"Popov Yuriy": student2,
                            @"Novosad Viktor": student3,
                            @"Mankevich Pavel": student4,
                            @"Aistov Kiril": student5,
                            @"Baydin Nikita": student6,
                            @"Basova Aleksandra": student7,
                            @"Vorotnikov Alexey": student8,
                            @"Gordeeva Angelina": student9,
                            @"Gorelova Anna": student10,
                            @"Demidova Anna": student11,
                            @"Korchagin Nikita": student12
                            };
    
    NSLog(@"%@", group);
    
    // Student
    
    for (NSString *key in [group allKeys])
    {
        YCStudent *student = [group objectForKey: key];
        
        NSLog(@"%-10@ -  %@ %@, %@", student.nameObject, student.lastName, student.firstName, student.greeting);
    }
    NSLog(@"----------------SORTED BY KEY------------------------");
    
    // Master
    // Создаем массив и наполняем его отсортированными ключами по алфавиту
    NSArray *sortedKeys = [[group allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    for (NSString *key in sortedKeys)
    {
        YCStudent *student = [group objectForKey: key];
        
        NSLog(@"%-10@ -  %@ %@, %@", student.nameObject, student.lastName, student.firstName, student.greeting);
    }
    
    
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
