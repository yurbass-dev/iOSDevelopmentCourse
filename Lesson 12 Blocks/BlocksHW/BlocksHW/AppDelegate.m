//
//  AppDelegate.m
//  BlocksHW
//
//  Created by Yuriy on 03.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCStudent.h"
#import "YCPatient.h"

typedef void (^TestBlock)(void);
typedef void (^BlockWithParameter)(NSString*);
typedef NSString* (^BlockWithReturnValue)(void);
typedef NSString* (^BlockWithReturnString)(NSInteger);

@interface AppDelegate ()

@property (strong, nonatomic) NSArray *patients;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#pragma mark - Tasks
    /*
     Ученик. Фактически это повторить первую половину.
     
     1. В апп делегате создайте блок с без возвращаемой переменной и без параметров и вызовите его.
     2. Создайте блоки с параметрами и передайте туда строку, которую выведите на экран в последствии.
     3. Если вы не определили тип данных для ваших блоков, то сделайте это сейчас и используйте их
     4. Создайте метод который принимает блок и вызывает его и вызовите этот метод.
     
     Студент.
     5. Создайте класс студент с проперти имя и фамилия.
     6. Создайте в аппделегате 10 разных студентов, пусть у парочки будут одинаковые фамилии.
     7. Поместите всех в массив.
     8. Используя соответствующий метод сортировки массива (с блоком) отсортируйте массив студентов сначала по фамилии, а если они одинаковы то по имени.
     
     Мастер.
     9. Задание из видео. Из урока о делегатах. У пациентов удалите протокол делегат и соответствующее проперти.
     10. Добавьте метод принимающий блок когда им станет плохо.
     11. Блок должен передавать указатель на самого студента ну и на те параметры, которые были в задании по делегатам.
     12. Теперь когда пациентам поплохеет, они должны вызывать блок, а в блоке нужно принимать решения что делать (доктор не нужен делайте все в апп делегате)
     
     Супермен
     13. Познайте истинное предназначение блоков :) Пусть пациентам становится плохо не тогда когда вы их вызываете в цикле(это убрать), а через случайное время 5-15 секунд после создания (используйте специальный метод из урока по селекторам в ините пациента).
     14. не забудьте массив пациентов сделать проперти аппделегата, а то все помрут по выходе из функции так и не дождавшись :)
     */
    
#pragma mark - Pupil
    /*
    void (^testBlock)(void) = ^{
        NSLog(@"test block");
    };
    
    testBlock();
    
    
    void (^blockWithParameter)(NSString*) = ^(NSString* string) {
        NSLog(@"%@", string);
    };
    
    blockWithParameter(@"Hello, world!");
    
    
    TestBlock testBlock1 = ^{
        NSLog(@"block without parameter and return value");
    };
    
    testBlock1();
    
    
    BlockWithParameter testBlock2 = ^(NSString *string) {
        NSLog(@"%@", string);
    };
    
    testBlock2(@"block with parameter");
    
    
    BlockWithReturnValue testBlock3 = ^{
        return @"block with return value";
    };
    
    NSLog(@"%@", testBlock3());
    
     
    [self testMethod:^NSString *(NSInteger intValue) {
        return [NSString stringWithFormat:@"%ld", intValue];
    }];
    */
    
#pragma mark - Student
    /*
    YCStudent *student1 = [[YCStudent alloc] initWithName:@"Nikolay" andLastName:@"Karpov"];
    YCStudent *student2 = [[YCStudent alloc] initWithName:@"Yuriy" andLastName:@"Popov"];
    YCStudent *student3 = [[YCStudent alloc] initWithName:@"Viktor" andLastName:@"Novosad"];
    YCStudent *student4 = [[YCStudent alloc] initWithName:@"Pavel" andLastName:@"Mankevich"];
    YCStudent *student5 = [[YCStudent alloc] initWithName:@"Kiril" andLastName:@"Aistov"];
    YCStudent *student6 = [[YCStudent alloc] initWithName:@"Nikita" andLastName:@"Popov"];
    YCStudent *student7 = [[YCStudent alloc] initWithName:@"Aleksandra" andLastName:@"Basova"];
    YCStudent *student8 = [[YCStudent alloc] initWithName:@"Alexey" andLastName:@"Popov"];
    YCStudent *student9 = [[YCStudent alloc] initWithName:@"Angelina" andLastName:@"Gordeeva"];
    YCStudent *student10 = [[YCStudent alloc] initWithName:@"Anna" andLastName:@"Gorelova"];
    
    NSMutableArray *students = [[NSMutableArray alloc] initWithArray: @[student1, student2, student3, student4, student5, student6, student7, student8, student9, student10]];
    
    NSLog(@"---------- Original array ----------");
    
    for (YCStudent *student in students)
    {
        NSLog(@"%@ %@", student.firstName, student.lastName);
    }
    
    [students sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        YCStudent *student1 = obj1;
        YCStudent *student2 = obj2;
        
        NSComparisonResult result = [student1.lastName compare: student2.lastName];
        
        if (result == NSOrderedSame)
            result = [student1.firstName compare: student2.firstName];
        
        return result;
    }];
    
    NSLog(@"---------- Sorted array ----------");
    
    for (YCStudent *student in students)
    {
        NSLog(@"%@ %@", student.firstName, student.lastName);
    }
    */
    
#pragma mark - Master
    /*
    YCPatient *patient1 = [[YCPatient alloc] init];
    YCPatient *patient2 = [[YCPatient alloc] init];
    YCPatient *patient3 = [[YCPatient alloc] init];
    YCPatient *patient4 = [[YCPatient alloc] init];
    YCPatient *patient5 = [[YCPatient alloc] init];
    
    patient1.name = @"Igor";
    patient1.temperarure = 36.8f;
    patient1.headache = YES;
    patient1.nausea = NO;
    patient1.cough = YES;
    
    patient2.name = @"Vladislav";
    patient2.temperarure = 37.5f;
    patient2.headache = YES;
    patient2.nausea = NO;
    patient2.cough = NO;
    
    patient3.name = @"Inna";
    patient3.temperarure = 39.2f;
    patient3.headache = YES;
    patient3.nausea = YES;
    patient3.cough = NO;
    
    patient4.name = @"Oleg";
    patient4.temperarure = 38.8f;
    patient4.headache = YES;
    patient4.nausea = YES;
    patient4.cough = YES;
    
    patient5.name = @"Anna";
    patient5.temperarure = 36.6f;
    patient5.headache = NO;
    patient5.nausea = NO;
    patient5.cough = NO;
    
    PatientBlock doctorBlock = ^(YCPatient* patient) {
        if (patient.bodyPart != 0)
        {
            NSLog(@"My name is %@ and my %@ hurts.", patient.name, [patient returnStringBodyPart: patient.bodyPart]);
            [patient takeMedicineForBodyPart];
        }
        
        BOOL check = YES;
        
        if (patient.temperarure >= 37.2f && patient.temperarure <= 39.f)
        {
            [patient takePillFromTemperature];
            check = NO;
        }
        else if (patient.temperarure > 39.f)
        {
            [patient makeShotFromTemperature];
            check = NO;
        }
        
        if (patient.headache)                                  // Если у пациента болит голова, то лечить его
        {
            [patient takePillFromHeadache];
            check = NO;
            if (![patient areYouBetter])                       // Если пациенту после таблетки не стало лучше, то делаем ему укол
                [patient makeShotFromHeadache];
        }
        
        if (patient.nausea)
        {
            [patient takePillFromNausea];
            check = NO;
            if (![patient areYouBetter])
                [patient makeShotFromNausea];
        }
        
        if (patient.cough)
        {
            [patient takePillFromCough];
            check = NO;
            if (![patient areYouBetter])
                [patient makeShotFromCough];
        }
        
        if (check)                                              // Если у пациента нету никаких симптомов, то ему нужно просто отдохнуть
        {
            NSLog(@"Patient %@ should rest.", patient.name);
            [patient areYouBetter];
        }
    };
    
    self.patients = @[patient1, patient2, patient3, patient4, patient5];
    
    for (NSUInteger i = 0; i < 5; i++)
    {
        YCPatient *patient = [self.patients objectAtIndex: i];
        patient.bodyPart = arc4random() % COUNT_BODY_PARTS + 1;             // Задаем пациенту часть тела рандомно (от 1 до 7)
        
        if (arc4random() % 2)                                               // Если пациенту станет хуже, вызвать метод, которому передаем блок
        {
            [patient becameWorse: doctorBlock];
            NSLog(@"");
        }
    }
    */
    
#pragma mark - Superman
    
    PatientBlock doctorBlock = ^(YCPatient* patient) {
        if (patient.bodyPart != 0)
        {
            NSLog(@"My name is %@ and my %@ hurts.", patient.name, [patient returnStringBodyPart: patient.bodyPart]);
            NSLog(@"Patient %@ became worse after %lu seconds.", patient.name, patient.becameWorseDelay);
            [patient takeMedicineForBodyPart];
        }
        
        BOOL check = YES;
        
        if (patient.temperarure >= 37.2f && patient.temperarure <= 39.f)
        {
            [patient takePillFromTemperature];
            check = NO;
        }
        else if (patient.temperarure > 39.f)
        {
            [patient makeShotFromTemperature];
            check = NO;
        }
        
        if (patient.headache)                                  // Если у пациента болит голова, то лечить его
        {
            [patient takePillFromHeadache];
            check = NO;
            if (![patient areYouBetter])                       // Если пациенту после таблетки не стало лучше, то делаем ему укол
                [patient makeShotFromHeadache];
        }
        
        if (patient.nausea)
        {
            [patient takePillFromNausea];
            check = NO;
            if (![patient areYouBetter])
                [patient makeShotFromNausea];
        }
        
        if (patient.cough)
        {
            [patient takePillFromCough];
            check = NO;
            if (![patient areYouBetter])
                [patient makeShotFromCough];
        }
        
        if (check)                                              // Если у пациента нету никаких симптомов, то ему нужно просто отдохнуть
        {
            NSLog(@"Patient %@ should rest.", patient.name);
            [patient areYouBetter];
        }
    };
    
    YCPatient *patient1 = [[YCPatient alloc] initWithBlock: doctorBlock];
    YCPatient *patient2 = [[YCPatient alloc] initWithBlock: doctorBlock];
    YCPatient *patient3 = [[YCPatient alloc] initWithBlock: doctorBlock];
    YCPatient *patient4 = [[YCPatient alloc] initWithBlock: doctorBlock];
    YCPatient *patient5 = [[YCPatient alloc] initWithBlock: doctorBlock];
    
    patient1.name = @"Igor";
    patient1.temperarure = 36.8f;
    patient1.headache = YES;
    patient1.nausea = NO;
    patient1.cough = YES;
    
    patient2.name = @"Vladislav";
    patient2.temperarure = 37.5f;
    patient2.headache = YES;
    patient2.nausea = NO;
    patient2.cough = NO;
    
    patient3.name = @"Inna";
    patient3.temperarure = 39.2f;
    patient3.headache = YES;
    patient3.nausea = YES;
    patient3.cough = NO;
    
    patient4.name = @"Oleg";
    patient4.temperarure = 38.8f;
    patient4.headache = YES;
    patient4.nausea = YES;
    patient4.cough = YES;
    
    patient5.name = @"Anna";
    patient5.temperarure = 36.6f;
    patient5.headache = NO;
    patient5.nausea = NO;
    patient5.cough = NO;
    
    __weak NSArray *patientsWeak = _patients;
    
    patientsWeak = @[patient1, patient2, patient3, patient4, patient5];
    
    return YES;
}

-(void) testMethod: (BlockWithReturnString) block
{
    NSLog(@"%@", block(777));
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
