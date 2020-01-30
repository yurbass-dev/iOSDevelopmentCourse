//
//  AppDelegate.m
//  NotificationHW
//
//  Created by Yuriy on 27.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCGovernment.h"
#import "YCDoctor.h"
#import "YCPensioner.h"
#import "YCBusinessman.h"
#import "YCAppNotifications.h"

@interface AppDelegate ()

@property (strong, nonatomic) YCGovernment *government;
@property (strong, nonatomic) YCDoctor *doctor;
@property (strong, nonatomic) YCPensioner *pensioner;
@property (strong, nonatomic) YCBusinessman *businessman;
@property (strong, nonatomic) YCAppNotifications *appNotifications;

@end

@implementation AppDelegate
/*
Задание:

Ученик.

1. Используя мой код создать свой проект со своими классами и понять как оно работает
2. Добавить классы "пенсионер" и "бизнесмен"
3. Доктор следит за изменением зарплаты, бизнесмен должен следить за изменением налогов, а пенсионер за изменением пенсий.
4. Все классы: Доктор, Пенсионер и Бизнесмен долджны следить также и за средней ценой на товар.

Умничка.

5. Каждый из классов следит за инфляцией (процентный рост средней цены на товар) и оценивает свой потенциальный доход по отношению к инфляции, например размер пенсии к возможности купить продукты у пенсионера, либо новая прибыль за вычетом налогов у бизнесмена также по отношению к ценам на товар.

6. Не секрет что изменение этих характеристик оказывает разное влияние на разные слои населения, поэтому пусть в зависимости от уровня покупательской способности каждый класс выдает свои перлы.

Мастер.

7. Подпишите классы на нотификацию ухода приложения в бекграунд, чтобы когда нажимается кнопка HOME и приложение сворачивается, каждый объект заявлял о том что он идет спать

8. Тоже самое сделать для случая, когда приложение возвращается из свернутого состояния

Супермен

9. Создайте свой класс аналог апп делегату, только он не делегат приложения, но слушатель тех же самых нотификаций, какие методы есть у делегата. Грубо говоря у вашего класса должны быть теже методы, что и у апп делегата, но вызываться они должны путем нотификаций

10. Добавьте НСЛоги в каждый метод апп делегата и своего класса

11. Сворачивая и разварачивая приложение добивайтесь вызовов определенный методов делегата и тех же нотификаций и посмотрите что вызывается раньше - метод делегата или нотификация :)
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Pupil
    /*
    self.government = [[YCGovernment alloc] init];
    self.doctor = [[YCDoctor alloc] init];
    self.pensioner = [[YCPensioner alloc] init];
    self.businessman = [[YCBusinessman alloc] init];
    
    
    self.government.salary = 1050.f;
    self.government.pension = 725.f;
    self.government.taxLevel = 9.f;
    self.government.averagePrice = 12.f;
    */
    
    // Superman
    
    self.appNotifications = [[YCAppNotifications alloc] init];
    
    NSLog(@"applicationDidFinishLaunchingDelegate");
    NSLog(@"");
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

    NSLog(@"applicationWillResignActiveDelegate");
    NSLog(@"");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    NSLog(@"applicationDidEnterBackgroundDelegate");
    NSLog(@"");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

    NSLog(@"applicationWillEnterForegroundDelegate");
    NSLog(@"");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

    NSLog(@"applicationDidBecomeActiveDelegate");
    NSLog(@"");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

    NSLog(@"applicationWillTerminateDelegate");
    NSLog(@"");
}


@end
