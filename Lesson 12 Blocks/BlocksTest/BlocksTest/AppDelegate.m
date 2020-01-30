//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Yuriy on 01.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCObject.h"

typedef void (^OurTestBlock)(void);

typedef NSString* (^OurTestBlock2)(NSInteger);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock testBlock;

@property (strong, nonatomic) NSString *name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    void (^testBlock) (void);
    
    testBlock = ^{
        NSLog(@"test Block");
    };
    
    
    void (^testBlock) (void) = ^{
        NSLog(@"test Block");
    };
    
    testBlock();
    */
    
    /*
    void (^testBlockWithParams) (NSString*, NSInteger) = ^(NSString* string, NSInteger intVal) {
        NSLog(@"%@ %ld", string, intVal);
    };
    
    testBlockWithParams(@"testBlockWithParams", 777);
     */
    
    /*
    NSString* (^testBlockWithReturnValue) (void) = ^{
        return @"testBlockWithReturnValue";
    };
    
    NSLog(@"%@", testBlockWithReturnValue());
    */
    
    /*
    __block NSString *string = @"Hello";
    
    NSLog(@"%@", string);
    
    void (^testBlockWithChangeString) (void) = ^{
        string = @"World!";                             // изменение строки в блоке
    };
    
    testBlockWithChangeString();
    
    NSLog(@"%@", string);
    */
     
    /*
    [self testBlocksMethod:^{
        NSLog(@"BLOCK!!!");
    }];
     */
    
    /*
    void (^ccc) (void) = ^{
        NSLog(@"BLOCK!!!");
    };
    
    [self testBlocksMethod: ccc];           // передача блока в качестве аргумента метода
    
    OurTestBlock testBlock2 = ^{            // OurTestBlock тип данных void (^sample)(void) блока, который ничего не принимает и не возвращает
        NSLog(@"BLOCK 2!!!");
    };
    
    [self testBlocksMethod2: testBlock2];
    */
    
    /*
    NSArray *array = @[@"David", @"Gregor", @"Albert", @"Tomas", @"Oliver"];
    
    NSComparisonResult (^compareString) (id, id) = ^(id obj1, id obj2) {
        
        return [obj1 localizedCaseInsensitiveCompare: obj2];
    };
    
    
    array = [array sortedArrayUsingComparator: ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [obj1 localizedCaseInsensitiveCompare: obj2];
    }];
    
    
    array = [array sortedArrayUsingComparator: compareString];
     
    for (NSString *string in array)
        NSLog(@"%@", string);
    */
    
    /*
    NSString *stringTest = @"string original";
    
    NSLog(@"%@", stringTest);
    
    [self methodChangeString: &stringTest];         // чтобы изменить строку в методе, нужно передать адрес строки, а в методе создать указатель на строку
    
    NSLog(@"%@", stringTest);
    
    
    OurTestBlock2 tb = ^(NSInteger intValue){
        return [NSString stringWithFormat: @"%ld", intValue];
    };
    
    NSLog(@"%@", tb(911));
    */

    /*
    YCObject *obj = [[YCObject alloc] init];
    
    obj.name = @"OBJECT";
    
    OurTestBlock tb = ^{
        NSLog(@"%@", obj.name);             // Обьект удалится после выхода из метода, потому что и блок удалится
    };
    
    //tb();
    
    //self.testBlock = ^{
    //   NSLog(@"%@", obj.name);             // Обьект не будет удален после выхода из метода, блок являеться проперти AppDelegate
                                             // и держит обьект стронг ссылкой
    //};
    
    
    __weak YCObject *weakObj = obj;         // Создаем слабую ссылку на обьект obj
    self.testBlock = ^{
        NSLog(@"%@", weakObj.name);
    };
    
    self.testBlock();
    */
    
    self.name = @"Hello!";
    
    YCObject *obj1 = [[YCObject alloc] init];
    
    obj1.name = @"OBJECT1";
    
    /*
    [obj1 testMetod:^{
        NSLog(@"%@", self.name);
    }];
    */
    
    
    return YES;
}

-(void) testBlocksMethod: (void (^) (void)) testBlock           // метод в качестве аргумента принимает блок, который ничего не возвращает и не принимает
{
    NSLog(@"testBlocksMethod");
    
    testBlock();
    testBlock();
    testBlock();
}

-(void) testBlocksMethod2: (OurTestBlock) testBlock
{
    NSLog(@"testBlocksMethod2");
    
    testBlock();
}

-(void) methodChangeString: (NSString**) string         // метод принимает указатель на обьект класса NSString
{
    *string = @"string changed!";
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
