//
//  AppDelegate.m
//  KVCTest
//
//  Created by Yuriy on 9/24/19.
//  Copyright © 2019 Yuriy. All rights reserved.
//

#import "AppDelegate.h"
#import "YCStudent.h"
#import "YCGroup.h"

static void *YCStudentNameContext = &YCStudentNameContext;
static void *YCGroupStudentsContext = &YCGroupStudentsContext;

@interface AppDelegate ()

@property (strong, nonatomic) YCStudent *student;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    YCStudent *student = [YCStudent new];
//
//    student.name = @"Yuriy";
//    student.age = 20;
//
//    NSLog(@"%@", student);
//
//    [student setValue:@27 forKey:@"age"];
//
//    NSLog(@"%@", student);
//
//    self.student = student;
//
//    [self.student addObserver:self
//                   forKeyPath:@"name"
//                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
//                      context:YCStudentNameContext];
//
//    student.name = @"John";
//
//    [self.student changeName];
    
    YCStudent *student1 = [YCStudent new];
    student1.name = @"Alex";
    student1.age = 20;

    YCStudent *student2 = [YCStudent new];
    student2.name = @"Roger";
    student2.age = 25;

    YCStudent *student3 = [YCStudent new];
    student3.name = @"Jack";
    student3.age = 22;
    
    YCStudent *student4 = [YCStudent new];
    student4.name = @"Vova";
    student4.age = 28;
    
    YCGroup *group1 = [YCGroup new];
    group1.students = @[student1, student2, student3, student4];
    
    /*
    NSLog(@"%@", group1.students);
    
    NSMutableArray *array = [group1 mutableArrayValueForKey:@"students"];

    [array removeLastObject];

    NSLog(@"%@", array);
    NSLog(@"%@", group1.students);
     */
    
    self.student = student1;
    
    NSLog(@"name = %@", [self valueForKeyPath:@"student.name"]);
    
    return YES;
}

- (void)dealloc {
//    [self.student removeObserver:self forKeyPath:@"name" context:YCStudentNameContext];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    if (context == YCStudentNameContext) {
        NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    }
    else if (context == YCGroupStudentsContext) {
        NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
