//
//  AppDelegate.m
//  ArraysHW
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCHuman.h"
#import "YCBicycler.h"
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
    
    // Создаем объекты, выделяем им память и инициализируем
    YCHuman *human = [[YCHuman alloc] init];
    YCBicycler *bicycler = [[YCBicycler alloc] init];
    YCRunner *runner = [[YCRunner alloc] init];
    YCSwimmer *swimmer = [[YCSwimmer alloc] init];
    YCBoxer *boxer = [[YCBoxer alloc] init];
    
    // Создаем обьекты класса животные
    YCAnimal *animal = [[YCAnimal alloc] init];
    YCCat *cat = [[YCCat alloc] init];
    YCDog *dog = [[YCDog alloc] init];
    YCCow *cow = [[YCCow alloc] init];
    
    // Присваиваем значения объекту класса YCHuman
    human.name = @"Oliver";
    human.gender = @"male";
    human.height = 1.83f;
    human.weight = 80.3f;
    
    // Присваиваем значения объекту класса YCBicycler
    bicycler.name = @"Jack";
    bicycler.gender = @"male";
    bicycler.height = 1.75f;
    bicycler.weight = 73.4f;
    
    // Присваиваем значения объекту класса YCRunner
    runner.name = @"Jessica";
    runner.gender = @"female";
    runner.height = 1.66f;
    runner.weight = 55.2f;
    
    // Присваиваем значения объекту класса YCSwimmer
    swimmer.name = @"Anna";
    swimmer.gender = @"female";
    swimmer.height = 1.7f;
    swimmer.weight = 58.7f;
    
    // Присваиваем значения объекту класса YCBoxer
    boxer.name = @"Oleksandr";
    boxer.gender = @"male";
    boxer.height = 1.9f;
    boxer.weight = 90.f;
    boxer.age = 31.f;
    boxer.bouts = 15;
    boxer.wins = 15;
    boxer.kos = 11;
    boxer.reach = 1.98f;
    boxer.division = @"cruiserweight";
    boxer.stance = @"southpaw";
    
    // Присваиваем значения объекту класса YCAnimal
    animal.nickname = @"MickyMouse";
    animal.says = @"squeek";
    animal.legs = 4;
    animal.age = 1.5f;
    
    // Присваиваем значения объекту класса YCCat
    cat.nickname = @"Barsik";
    cat.says = @"meow";
    cat.legs = 4;
    cat.age = 3.3f;
    
    // Присваиваем значения объекту класса YCDog
    dog.nickname = @"Rex";
    dog.says = @"woof";
    dog.legs = 4;
    dog.age = 5.7f;
    
    // Присваиваем значения объекту класса YCCow
    cow.nickname = @"Businka";
    cow.says = @"moo";
    cow.legs = 4;
    cow.age = 7.f;
    
    /*
    // Уровень Мастер
    // Создаем массив и инициализируем его нашими объектами
    NSArray *array = [[NSArray alloc] initWithObjects: human, bicycler, runner, swimmer, boxer, animal, cat, dog, cow, nil];
    
    // Выводим в цикле значения каждого объекта
    for (int index = 0; index < [array count]; index++)
    {
        id humanOrAnimal = [array objectAtIndex: index];
        
        if ([humanOrAnimal isKindOfClass: [YCHuman class]])
        {
            if ([humanOrAnimal isKindOfClass: [YCBoxer class]])
            {
                YCBoxer *boxerTemp = (YCBoxer *) humanOrAnimal;
                
                NSLog(@"%@", [boxerTemp description]);
                [boxerTemp move];
            }
            else
            {
                YCHuman *humanTemp = (YCHuman *) humanOrAnimal;
                
                NSLog(@"%@", [humanTemp description]);
                [humanTemp move];
            }
        }
        else if ([humanOrAnimal isKindOfClass: [YCAnimal class]])
        {
            YCAnimal *animalTemp = (YCAnimal *) humanOrAnimal;
            
            NSLog(@"%@", [animalTemp description]);
            [animalTemp move];
        }
        
        NSLog(@"----------------------------------------------------------------------------------------------\n");
     }
     */
    
    /*
    // Уровень Звезда:
    // Создаем 2 массива (люди и животные)
    NSArray *arrayHuman = @[human, bicycler, runner, swimmer, boxer];
    NSArray *arrayAnimal = @[animal, cat, dog, cow];
    
    NSUInteger count;
    NSUInteger countHuman = [arrayHuman count];
    NSUInteger countAnimal = [arrayAnimal count];
    
    id humanOrAnimal;
    
    if (countHuman > countAnimal)
        count = countHuman;
    else
        count = countAnimal;
    
    for (int index = 0; index < count; index++)
    {
        if (index < countHuman)
        {
            humanOrAnimal = [arrayHuman objectAtIndex: index];
            if ([humanOrAnimal isKindOfClass: [YCHuman class]])
            {
                NSLog(@"%@", [humanOrAnimal description]);
                [humanOrAnimal move];
                NSLog(@"----------------------------------------------------------------------------------------------\n");
            }
        }
        
        if (index < countAnimal)
        {
            humanOrAnimal = [arrayAnimal objectAtIndex: index];
            if ([humanOrAnimal isKindOfClass: [YCAnimal class]])
            {
                NSLog(@"%@", [humanOrAnimal description]);
                [humanOrAnimal move];
                NSLog(@"----------------------------------------------------------------------------------------------\n");
            }
        }
     }
     */
    
    // Уровень Супермен
    // Создаем массив животных и людей
    NSArray *humanAndAnimal = @[human, animal, cat, bicycler, runner, dog, swimmer, cow, boxer];
    NSArray *sortedArray = [[NSArray alloc] init];
   
    // Сортируем массив по классу и по имени или кличке
    sortedArray = [humanAndAnimal sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        
        if ([obj1 isKindOfClass: [YCHuman class]] && [obj2 isKindOfClass: [YCHuman class]])
        {
            return [[(YCHuman *) obj1 name] compare: [(YCHuman *) obj2 name]];
        }
        else if ([obj1 isKindOfClass: [YCAnimal class]] && [obj2 isKindOfClass: [YCAnimal class]])
        {
            return [[(YCAnimal *) obj1 nickname] compare: [(YCAnimal *) obj2 nickname]];
        }
        else if ([obj1 isKindOfClass: [YCHuman class]])
            return NSOrderedAscending;
        else
            return NSOrderedDescending;
    }];

    NSLog(@"Оригинальный (не отсортированный) массив:");
    for (int i = 0; i < [humanAndAnimal count]; i++)
    {
        NSLog(@"%@", [[humanAndAnimal objectAtIndex: i] description]);
        [[humanAndAnimal objectAtIndex: i] move];
        NSLog(@"----------------------------------------------------------------------------------------------\n");
    }
    
    NSLog(@"\n");
    NSLog(@"Отсортированный масcив:");
    for (int i = 0; i < [sortedArray count]; i++)
    {
        NSLog(@"%@", [[sortedArray objectAtIndex: i] description]);
        [[sortedArray objectAtIndex: i] move];
        NSLog(@"----------------------------------------------------------------------------------------------\n");
    }
    
    /*
    // Сортируем массив по имени и кличке
    sortedArray = [humanAndAnimal sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *string1 = nil;
        NSString *string2 = nil;
        
        if ([obj1 isKindOfClass:[YCHuman class]])
            string1 = [obj1 valueForKey:@"name"];
        
        if ([obj2 isKindOfClass:[YCHuman class]])
            string2 = [obj2 valueForKey:@"name"];
        
        if ([obj1 isKindOfClass:[YCAnimal class]])
            string1 = [obj1 valueForKey:@"nickname"];
        
        if ([obj2 isKindOfClass:[YCAnimal class]])
            string2 = [obj2 valueForKey:@"nickname"];
        
        return [string1 compare:string2];
    }];
    
    // Сортируем массив по классу: сначала люди, потом животные
    sortedArray = [sortedArray sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        
        if ([obj1 isKindOfClass: [YCHuman class]] && [obj2 isKindOfClass: [YCAnimal class]])
            return (NSComparisonResult)NSOrderedAscending;
        
        if ([obj1 isKindOfClass: [YCAnimal class]] && [obj2 isKindOfClass: [YCHuman class]])
            return (NSComparisonResult)NSOrderedDescending;

        return (NSComparisonResult)NSOrderedSame;
    }];
     */
    
    /*
    id humOrAnim;
    NSUInteger count = [humanAndAnimal count];
    NSMutableArray *sortedArray = [[NSMutableArray alloc] initWithCapacity: count];
    NSUInteger start = 0;
    
    for (int i = 0; i < count; i++)
    {
        humOrAnim = [humanAndAnimal objectAtIndex: i];
        
        if ([humOrAnim isKindOfClass: [YCHuman class]])
        {
            [sortedArray insertObject: humOrAnim atIndex: start];
            start++;
        }
        else if ([humOrAnim isKindOfClass: [YCAnimal class]])
            [sortedArray addObject: humOrAnim];
    }
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
