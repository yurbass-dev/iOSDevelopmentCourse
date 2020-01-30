//
//  AppDelegate.m
//  DelegatesHW
//
//  Created by Yuriy on 13.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "AppDelegate.h"
#import "YCPatient.h"
#import "YCDoctor.h"
#import "YCDoctorFriend.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Ученик:
     
     1. Создать пару пациентов и доктора по тому же принципу что и в видео. (Доктор делегат у пациентов)
     2. У пациента пусть будет температура и другие симптомы, по которым доктор может принимать решение.
     3. У пациента сделайте метод типа стало хуже и пусть когда станет хуже, то он идет к доктору
     4. Всех пациентов объедините в массив и в цикле вызовите метод "стало хуже".
     5. Доктор должен лечить каждого согласно симптомам.
     
     Студент:
     
     6. Создайте другой класс доктора, не наследника от первого доктора, например друг :)
     7. этот друг должен лечить своих пациентов своими собственными методами и короче плохой он доктор
     8. пусть кто-то ходит к врачу, а кто-то к нему
     9. создайте пару разных объектов класса друг и пусть они лечат своих пациентов (чтобы понять что делегат это не класс, а объект)
     
     Мастер:
     
     10. Создайте список частей тела в делегате пациента (голова, живот, нога и тд) и когда пациент приходит к врачу, пусть говорит что болит.
     11. Доктор должен принимать во внимание что болит
     12. Создайте у доктора метод "рапорт". Пусть в конце дня, когда все уже нажаловались достаточно, доктор составит рапорт (выдаст имена) тех у кого болит голова, потом тех у кого болел живот и тд
     
     Супермен
     
     13. Создайте в классе пациента проперти - оценка доктору.
     14. Когда доктор вам назначает лечение некоторые пациенты должны стать недовольны.
     15. В конце дня после того как все лечение будет сделано и доктор напишет рапорт, надо пройтись по пациентам и всем недовольным поменять доктора.
     16. Начать новый день и убедиться что Недовольные пациенты таки поменяли доктора.
    */
    
    // Pupil
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
    
    YCDoctor *doctor = [[YCDoctor alloc] init];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = doctor;
    patient5.delegate = doctor;
    
    NSArray *patients = @[patient1, patient2, patient3, patient4, patient5];
    /*
    for (YCPatient *patient in patients)
    {
        [patient becameWorse];
        NSLog(@"");
    }
     */
    
    // Student
    YCDoctorFriend *friend1 = [[YCDoctorFriend alloc] init];
    YCDoctorFriend *friend2 = [[YCDoctorFriend alloc] init];
    /*
    patient1.delegate = doctor;
    patient2.delegate = friend1;
    patient3.delegate = doctor;
    patient4.delegate = friend2;
    patient5.delegate = doctor;
    
    for (YCPatient *patient in patients)
    {
        [patient becameWorse];
        NSLog(@"");
    }
     */
    
    // Master
    /*
    for (NSUInteger i = 0; i < 5; i++)
    {
        YCPatient *patient;
        patient = [patients objectAtIndex: i];
        patient.bodyPart = arc4random() % COUNT_BODY_PARTS + 1;             // Задаем пациенту часть тела рандомно (от 1 до 7)
        
        [patient becameWorse];
        NSLog(@"");
    }
    
    [doctor report];
     */
    
    // Superman
    
    YCDoctor *doctor1 = [[YCDoctor alloc] init];
    YCDoctor *doctor2 = [[YCDoctor alloc] init];
    
    doctor1.name = @"Dr.Olga";
    doctor2.name = @"Dr.Viktor";
    
    patient1.delegate = doctor1;
    patient2.delegate = doctor1;
    patient3.delegate = doctor1;
    patient4.delegate = doctor1;
    patient5.delegate = doctor1;
    
    // Имитируем 3-х дневный рабочий день
    for (NSUInteger i = 0; i < 3; i++)
    {
        NSLog(@"------------------- DAY %lu ------------------", i + 1);
        
        YCPatient *patient;
        
        for (NSUInteger i = 0; i < 5; i++)
        {
            patient = [patients objectAtIndex: i];
            patient.bodyPart = arc4random() % COUNT_BODY_PARTS + 1;            // Задаем пациенту часть тела рандомно (от 1 до 7)
            
            [patient becameWorse];
            NSLog(@"rating doctor = %lu", patient.ratingDoctor);
            NSLog(@"");
        }
        
        [doctor1 report];
        [doctor2 report];
        [doctor1 clearReport];
        [doctor2 clearReport];
        
        // Находим недовольных пациентов и меняем им доктора
        for (NSUInteger i = 0; i < 5; i++)
        {
            patient = [patients objectAtIndex: i];

            if (patient.ratingDoctor <= 5)                                     // Если оценка доктору ниже 5, меняем доктора
            {
                if ([patient.delegate isEqual: doctor1])
                    patient.delegate = doctor2;
                else if ([patient.delegate isEqual: doctor2])
                    patient.delegate = doctor1;
            }
            patient.ratingDoctor = 0;                                          // Очищаем оценку доктору
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
