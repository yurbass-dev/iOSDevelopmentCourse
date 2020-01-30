//
//  YCDoctorFriend.m
//  DelegatesHW
//
//  Created by Yuriy on 18.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDoctorFriend.h"

@implementation YCDoctorFriend

-(void) takeBeer: (YCPatient*) patient
{
    NSLog(@"Patient %@ drink a beer.", patient.name);
}

-(void) patientShouldRun: (YCPatient*) patient
{
    NSLog(@"Patient %@ is running.", patient.name);
}

-(void) takeСigarette: (YCPatient*) patient
{
    NSLog(@"Patient %@ is smoking.", patient.name);
}

#pragma mark - YCPatientDelegate

-(void) patientFeelsBad:(YCPatient*) patient
{
    if (patient.temperarure >= 37.2f && patient.temperarure <= 39.f)
    {
        [self takeBeer: patient];
    }
    else if (patient.temperarure > 39.f)
    {
        [self patientShouldRun: patient];
    }
    
    if (patient.headache)
    {
        [self takeСigarette: patient];
    }
    
    if (patient.nausea)
    {
        [self takeBeer: patient];
    }
    
    if (patient.cough)
    {
        [self takeСigarette: patient];
    }
}

@end
