//
//  AppDelegate.m
//  NotificationsTest
//
//  Created by Yuriy on 23.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCGovernment.h"
#import "YCDoctor.h"

@interface AppDelegate ()

@property (strong, nonatomic) YCGovernment *goverment;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.goverment = [[YCGovernment alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(governmentNotification:)
                                                 name: YCGovernmentTaxLevelDidChangeNotification
                                               object: nil];
    
    YCDoctor *doctor1 = [[YCDoctor alloc] init];
    YCDoctor *doctor2 = [[YCDoctor alloc] init];
    YCDoctor *doctor3 = [[YCDoctor alloc] init];
    YCDoctor *doctor4 = [[YCDoctor alloc] init];
    YCDoctor *doctor5 = [[YCDoctor alloc] init];
    
    self.goverment.taxLevel = 5.5f;
    self.goverment.salary = 1100.f;
    self.goverment.pension = 550.f;
    self.goverment.averagePrice = 15.f;
    
    //doctor1.salary = doctor2.salary = doctor3.salary = doctor4.salary = doctor5.salary = self.goverment.salary;
    
    self.goverment.salary = 1050.f;
    
    self.goverment.salary = 1150.f;
    
    self.goverment.salary = 900.f;
    
    return YES;
}

-(void) governmentNotification: (NSNotification*) notification
{
    NSLog(@"governmentNotification userInfo %@", notification.userInfo);
}

- (void)dealloc
{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver: self];
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
