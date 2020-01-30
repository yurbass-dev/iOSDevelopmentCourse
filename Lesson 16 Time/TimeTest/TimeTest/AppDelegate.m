//
//  AppDelegate.m
//  TimeTest
//
//  Created by Yuriy on 26.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    NSDate *date = [NSDate date];
    
    NSLog(@"deafult date = %@", date);

    NSLog(@"%@", [date dateByAddingTimeInterval:5000]);
    NSLog(@"%@", [date dateByAddingTimeInterval:-5000]);

    NSLog(@"%@", date);

    NSLog(@"%@", [date earlierDate:[date dateByAddingTimeInterval:-5000]]);
    NSLog(@"%@", [date laterDate:[date dateByAddingTimeInterval:-5000]]);

    NSDate *date2 = [NSDate dateWithTimeIntervalSinceReferenceDate:10];

    NSLog(@"%@", date2);
    */
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateStyle:(NSDateFormatterShortStyle)];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    [dateFormatter setDateStyle:(NSDateFormatterMediumStyle)];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    [dateFormatter setDateStyle:(NSDateFormatterLongStyle)];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    [dateFormatter setDateStyle:(NSDateFormatterFullStyle)];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    //[dateFormatter setDateFormat:@"yyyy M MM MMM MMMM MMMMM"];
    //[dateFormatter setDateFormat:@"dd.MM.yyyy E EEEE EEEEE"];
    //[dateFormatter setDateFormat:@"yyyy/dd/MM HH:mm:sss hh:mm a W w"];      // W номер недели в месяце, w номер недели в году

    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSLog(@"custom date = %@", [dateFormatter stringFromDate:date]);

    NSDate *date3 = [dateFormatter dateFromString:@"2000/02/29 15:37"];
    NSLog(@"%@", date3);
    
    
    /*
    NSDate *date = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
                                                        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                               fromDate:date];
    
    NSLog(@"%@", components);
    */
    
    /*
    NSDate *date1 = [NSDate date];
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-1000000];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                               fromDate:date2
                                                 toDate:date1
                                                options:0];
    
    NSLog(@"%@", components);
    */
    
   // YCObject *obj = [[YCObject alloc] init];
    

    
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
