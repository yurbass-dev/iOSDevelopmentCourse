//
//  AppDelegate.m
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCHuman.h"
#import "YCRunner.h"
#import "YCSwimmer.h"
#import "YCBoxer.h"
#import "YCAnimal.h"
#import "YCCat.h"
#import "YCDog.h"
#import "YCCow.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Задание такое:
     1. Реализуйте протоколы Jumpers, Swimmers, Runners. Каждый протокол должен иметь пару свойств, например скорость или максимальная высота прыжка и пару методов, например прыгать или плыть, нырять и тд. Включите фантазию!!!
     
     2. Часть методов делайте обязательными (например у пловцов обязательный метод это плыть а у бегунов - бежать, логично?), а другую часть не обязательными.
     
     3. Используйте классы из задания про массивы, там где у вас люди и животные. Например у кенгуру и у особых спортсменов реализуйте протокол Jumpers, тоже самое с другими протоколами. Пусть каждый протокол будет реализован как некоторыми классами животных, так и некоторыми классами людей.
     
     4. Положите всех в одни массив. Тех кто прыгает заставьте прыгать и рассказывать про свои свойства. Причем у некоторых объектов пусть будут одни необязательные свойства или методы, а у других другие. Тот кто бегает пусть бегает, а тот кто плавает, пусть плавает. Тот кто ничего не делает должен быть выведен на экран как лодырь :)
     
     5. Сделайте так чтобы один какой-то класс мог и бегать и прыгать и плавать и посмотрите как он себя поведет в цикле.
     */
    
    YCHuman *human = [[YCHuman alloc] init];
    YCRunner *runner = [[YCRunner alloc] init];
    YCSwimmer *swimmer = [[YCSwimmer alloc] init];
    YCBoxer *boxer = [[YCBoxer alloc] init];
    YCAnimal *animal = [[YCAnimal alloc] init];
    YCCat *cat = [[YCCat alloc] init];
    YCDog *dog = [[YCDog alloc] init];
    YCCow *cow = [[YCCow alloc] init];
    
    human.nameHuman = @"Boris";
    
    runner.name = @"Oleg";
    runner.speedRun = 12.6f;
    runner.distanceRun = 10.2f;
    runner.weight = 75.f;
    
    swimmer.name = @"Anna";
    swimmer.speedSwim = 7.7f;
    swimmer.distanceSwim = 15.8f;
    swimmer.heightSwimmer = 175.4f;
    
    boxer.name = @"Oleksandr";
    boxer.speedRun = 13.f;
    boxer.distanceRun = 20.f;
    boxer.speedSwim = 9.2f;
    boxer.distanceSwim = 18.f;
    boxer.heightJump = 1.5f;
    boxer.lengthJump = 2.9f;
    boxer.age = 31.f;
    boxer.heightSwimmer = 180.3f;
    
    animal.nameAnimal = @"MickyMouse";
    
    cat.name = @"Barsik";
    cat.heightJump = 2.f;
    cat.lengthJump = 3.5f;
    cat.age = 5.4f;
    
    dog.name = @"Rex";
    dog.speedRun = 13.f;
    dog.distanceRun = 30.f;
    dog.weight = 25.7f;
    
    cow.name = @"Businka";
    cow.speedRun = 5.3f;
    cow.distanceRun = 10.6f;
    
    NSArray *humanAndAnimal = @[human, runner, swimmer, boxer, animal, cat, dog, cow];
    
    for (id obj in humanAndAnimal)
    {
        if ([obj conformsToProtocol: @protocol(YCJumpers)])
        {
            NSLog(@"Class %@, name = %@, height of jump = %g, length of jump = %g", NSStringFromClass([obj class]), [obj name], [obj heightJump],
                  [obj lengthJump]);
            
            if ([obj respondsToSelector: @selector(age)])                // Optional property age
                NSLog(@"weight = %g", [obj age]);
            
            NSLog(@"%@", [obj jump]);
            NSLog(@"%@", [obj acceleration]);
            
            if ([obj respondsToSelector: @selector(rest)])               // Optional method rest
                NSLog(@"%@", [obj rest]);
            
            NSLog(@"--------------------------------------------------------------------------------------------------");
        }
        if ([obj conformsToProtocol: @protocol(YCSwimmers)])
        {
            NSLog(@"Class %@, name = %@, speed of swim = %g, distance = %g", NSStringFromClass([obj class]), [obj name], [obj speedSwim],
                  [obj distanceSwim]);
            
            if ([obj respondsToSelector: @selector(heightSwimmer)])     // Optional property heightSwimmer
                NSLog(@"height = %g", [obj heightSwimmer]);
            
            NSLog(@"%@", [obj swim]);
            NSLog(@"%@", [obj dive]);
            
            if ([obj respondsToSelector: @selector(drink)])             // Optional method drink
                NSLog(@"%@", [obj drink]);
            
            NSLog(@"--------------------------------------------------------------------------------------------------");
        }
        if ([obj conformsToProtocol: @protocol(YCRunners)])
        {
            NSLog(@"Class %@, name = %@, speed of run = %g, distance = %g", NSStringFromClass([obj class]), [obj name], [obj speedRun], [obj distanceRun]);
            
            if ([obj respondsToSelector: @selector(weight)])            // Optional property weight
                NSLog(@"weight = %g", [obj weight]);
            
            NSLog(@"%@", [obj run1]);
            NSLog(@"%@", [obj acceleration]);
            
            if ([obj respondsToSelector: @selector(eat)])               // Optional method eat
                NSLog(@"%@", [obj eat]);
            
            NSLog(@"--------------------------------------------------------------------------------------------------");
        }
        if (![obj conformsToProtocol: @protocol(YCJumpers)] && ![obj conformsToProtocol: @protocol(YCSwimmers)] &&
            ![obj conformsToProtocol: @protocol(YCRunners)])
        {
            if ([obj isKindOfClass: [YCHuman class]])
                NSLog(@"Class %@, name = %@ is lazybones!", NSStringFromClass([obj class]), [obj nameHuman]);
            else if ([obj isKindOfClass: [YCAnimal class]])
                NSLog(@"Class %@, name = %@ is lazybones!", NSStringFromClass([obj class]), [obj nameAnimal]);
            
            NSLog(@"--------------------------------------------------------------------------------------------------");
        }
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
