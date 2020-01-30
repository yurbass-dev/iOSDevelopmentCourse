//
//  AppDelegate.m
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCPatient.h"
#import "YCStudent.h"
#import "YCDancer.h"
#import "YCDeveloper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    YCStudent *student1 = [[YCStudent alloc] init];
    YCStudent *student2 = [[YCStudent alloc] init];
    YCStudent *student3 = [[YCStudent alloc] init];
    
    YCDancer *dancer1 = [[YCDancer alloc] init];
    YCDancer *dancer2 = [[YCDancer alloc] init];
    
    YCDeveloper *developer1 = [[YCDeveloper alloc] init];
    
    dancer1.name = @"Oleg";
    dancer2.name = @"Tanya";
    
    student1.name = @"Katya";
    student2.name = @"Nikolay";
    student3.name = @"Vasya";
    
    developer1.name = @"Yura";
    
    NSObject *fake = [[NSObject alloc] init];
    
    NSArray *patients = @[student1, developer1, fake, student3, dancer1, student2, dancer2];
    
    for (id <YCPatient> patient in patients)
    {
        if ([patient conformsToProtocol: @protocol(YCPatient)])
        {
            NSLog(@"Patient name %@", patient.name);
            
            if ([patient respondsToSelector: @selector(howIsYourFamily)])
            {
                NSLog(@"How is your family?\n%@", [patient howIsYourFamily]);
            }
            
            if ([patient respondsToSelector: @selector(howIsYourJob)])
            {
                NSLog(@"How is your job?\n%@", [patient howIsYourJob]);
            }
            
            if ([patient areYouOk] == NO)
            {
                [patient takePill];
                
                if ([patient areYouOk] == NO)
                    [patient makeShot];
            }
            NSLog(@"");
        }
        else
        {
            NSLog(@"FAKE!!!");
            NSLog(@"");
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
