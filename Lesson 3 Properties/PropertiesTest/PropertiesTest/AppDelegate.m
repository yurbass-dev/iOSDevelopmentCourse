//
//  AppDelegate.m
//  PropertiesTest
//
//  Created by Yuriy on 31.07.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "Boxer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Boxer* boxer = [[Boxer alloc] init];
    Boxer* kicker = [[Boxer alloc] init];
    /*
    boxer.name = @"Vasiliy";
    boxer.age = 25;
    boxer.height = 1.8f;
    boxer.weight = 80.f;
    */
    
    //boxer.nameCount = 0;
    /*
    kicker.age = 30;
    
    [boxer setName: @"Oliver"];
    [boxer setAge: 27];
    [boxer setHeight: 1.78f];
    [boxer setWeight: 78.f];
    
    NSLog(@"%d", [boxer howOldAreYou]);
    NSLog(@"%d", [kicker howOldAreYou]);
    
    NSLog(@"name = %@", boxer.name);
    NSLog(@"name = %@", [boxer name]);
    
    */
    
   // NSLog(@"%@", [boxer name]);
    
    [boxer setName: @"Oliver"];
    
    NSLog(@"name = %@", boxer.name);
    NSLog(@"age = %ld", boxer.age);
    NSLog(@"height = %f", boxer.height);
    NSLog(@"weight = %f", boxer.weight);
    
    NSLog(@"name = %@", kicker.name);
    NSLog(@"age = %ld", kicker.age);
    NSLog(@"height = %f", kicker.height);
    NSLog(@"weight = %f", kicker.weight);
    
    
     
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
