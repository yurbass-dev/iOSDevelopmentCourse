//
//  AppDelegate.m
//  DataTypesHW
//
//  Created by Yuriy on 28.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCIphone.h"
#import "YCIphone5C.h"
#import "YCIphone7.h"
#import "YCIphone10.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    // Задание 1
    YCIphone5C *iphone5C = [[YCIphone5C alloc] init];
    YCIphone7 *iphone7 = [[YCIphone7 alloc] init];
    YCIphone10 *iphone10 = [[YCIphone10 alloc] init];
    
    iphone5C.color = yellow;
    iphone5C.jack3_5 = haveJack3_5;
    iphone5C.processorType = bit_32;
    iphone5C.camera = single;
    
    iphone7.color = jetBlack;
    iphone7.jack3_5 = dontHaveJack3_5;
    iphone7.processorType = bit_64;
    iphone7.camera = single;
    
    iphone10.color = silver;
    iphone10.jack3_5 = dontHaveJack3_5;
    iphone10.processorType = bit_64;
    iphone10.camera = dual;
    
    if (iphone5C.color == yellow)
        NSLog(@"iphone 5c have yellow color");
    
    if (iphone7.processorType == bit_32)
        NSLog(@"iphone 7 have 32-bit processor");
    else if (iphone7.processorType == bit_64)
        NSLog(@"iphone 7 have 64-bit processor");
    
    if (iphone10.camera == dual)
        NSLog(@"iphone 10 have dual camera");
    */
    
    /*
    // Задание 2
    #define COUNT_POINTS 10   // Количество точек
    #define SIZE_H 10.f       // Высота поля
    #define SIZE_W 10.f       // Ширина поля
    
    // Создаем поле 10х10
    CGRect field = CGRectMake(0.f, 0.f, SIZE_W, SIZE_H);
    // Создаем квадрат 3х3 в центра поля
    CGRect squareInCenter = CGRectMake(3.f, 3.f, 3.f, 3.f);
    
    NSMutableArray *arrayPoints = [NSMutableArray arrayWithCapacity: COUNT_POINTS];
    
    CGPoint point;
    
    // Наполняем массив рандомными точками
    for (int i = 0; i < COUNT_POINTS; i++)
    {
        point.x = arc4random_uniform(SIZE_H);
        point.y = arc4random_uniform(SIZE_H);
        
        [arrayPoints addObject: [NSValue valueWithCGPoint: point]];
    }
    // Проверяем попадает ли точка в наш квадрат в центре поля
    for (int i = 0; i < COUNT_POINTS; i++)
    {
        point = [[arrayPoints objectAtIndex: i] CGPointValue];
        
        if (CGRectContainsPoint(squareInCenter, point))
            NSLog(@"Точка %@ попадает в квадрат", NSStringFromCGPoint(point));
        else
            NSLog(@"Точка %@ не попадает в квадрат", NSStringFromCGPoint(point));
    }
     */
    
    // Задание 3
    BOOL boolVar = true;
    char charVar = 'c';
    int intVar = 10;
    long long longLongVar = 999999;
    float floatVar = 15.75f;
    double doubleVar = 3.56789;
    
    // Делаем из наших переменных объекты с помощью NSNumber
    NSNumber *boolObj = [NSNumber numberWithBool: boolVar];
    NSNumber *charObj = [NSNumber numberWithChar: charVar];
    NSNumber *intObj = [NSNumber numberWithInt: intVar];
    NSNumber *longLongObj = [NSNumber numberWithLongLong: longLongVar];
    NSNumber *floatObj = [NSNumber numberWithFloat: floatVar];
    NSNumber *doubleObj = [NSNumber numberWithDouble: doubleVar];
    
    // Создаем объект с помощью литералов
    NSNumber *shortObj = @100;
    NSNumber *longObj = @10000;
    NSNumber *floatObj2 = @7.77f;
    
    // Вывод объектов
    NSLog(@"%@", boolObj);
    NSLog(@"%@", shortObj);
    NSLog(@"%@", floatObj);
    
    // Вывод значений
    NSLog(@"%d", [shortObj shortValue]);
    NSLog(@"%.2f", [floatObj2 floatValue]);
    NSLog(@"%lld", [longLongObj longLongValue]);
    NSLog(@"double %g + float %g = %g", [doubleObj doubleValue], [floatObj floatValue], [doubleObj doubleValue] + [floatObj floatValue]);
    
    CGPoint point = CGPointMake(5.5, 7.7);
    
    // Создаем объект из структуры типа CGPoint
    NSValue *pointObj = [NSValue valueWithCGPoint: point];
    
    CGPoint p;
    
    // Присваиваем значение обьекта pointObj структуре p
    p = [pointObj CGPointValue];
    
    NSLog(@"x = %g, y = %g", p.x, p.y);
    
    
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
