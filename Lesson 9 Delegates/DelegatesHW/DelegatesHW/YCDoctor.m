//
//  YCDoctor.m
//  DelegatesHW
//
//  Created by Yuriy on 18.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDoctor.h"

@interface YCDoctor ()

@property (strong, nonatomic) NSMutableDictionary *patientsByBodyPart;

@end

@implementation YCDoctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Doctor";
        _patientsByBodyPart = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void) clearReport
{
    [_patientsByBodyPart removeAllObjects];
}

-(void) createReport: (YCPatient*) patient
{
    NSString *bodyPartString = [patient returnStringBodyPart: patient.bodyPart];
    
    if ([_patientsByBodyPart count] == 0)                                                    // Если еще не записано ни одного пациента
    {
        NSMutableArray *namesPatientsByBodyPart = [[NSMutableArray alloc] init];             // Создаем массив для хранения имен пациентов
        [namesPatientsByBodyPart addObject: patient.name];                                   // Сохраняем имя пациента в массив
        [_patientsByBodyPart setObject: namesPatientsByBodyPart forKey: bodyPartString];     // Сохраняем наш массив по ключу (часть тела, которая болит)
    }
    else
    {
        if ([_patientsByBodyPart objectForKey: bodyPartString] == nil)                       // Если в словаре еще нету такого ключа (части тела)
        {
            NSMutableArray *namesPatientsByBodyPart = [[NSMutableArray alloc] init];         // Создаем массив для хранения имен пациентов
            [namesPatientsByBodyPart addObject: patient.name];                               // Сохраняем имя пациента в массив
            [_patientsByBodyPart setObject: namesPatientsByBodyPart forKey: bodyPartString]; // Сохраняем наш массив по ключу (часть тела, которая болит)
        }
        else                                                                                 // Если уже есть массив с такой частью тела
            [[_patientsByBodyPart objectForKey: bodyPartString] addObject: patient.name];    // То сохраняем в него имя пациента
    }
}

-(void) report
{
    if ([_patientsByBodyPart count] != 0)                                                    // Если пациентов не было, не выводить рапорт
    {
        NSLog(@"-------------------%@ REPORT------------------", self.name);
        
        for (NSString *key in [_patientsByBodyPart allKeys])
        {
            NSMutableArray *array = [_patientsByBodyPart objectForKey: key];
            
            NSLog(@"%@:", key);
            for (NSString *string in array)
                NSLog(@"        %@", string);
        }
    }
}

#pragma mark - YCPatientDelegate

-(void) patientFeelsBad:(YCPatient*) patient
{
    if (patient.bodyPart != 0)
    {
        NSLog(@"My name is %@ and my %@ hurts.", patient.name, [patient returnStringBodyPart: patient.bodyPart]);
        NSLog(@"I am %@ and i will help you %@", self.name, patient.name);
        [patient takeMedicineForBodyPart];
        [self createReport: patient];
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
}

@end
