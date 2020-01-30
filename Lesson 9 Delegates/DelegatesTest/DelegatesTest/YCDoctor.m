//
//  YCDoctor.m
//  DelegatesTest
//
//  Created by Yuriy on 10.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCDoctor.h"

@implementation YCDoctor



#pragma mark - YCPatientDelegate

-(void) patientFeelsBad:(YCPatient*) patient
{
    NSLog(@"Patient %@ feels bad.", patient.name);
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f)
        [patient takePill];
    else if (patient.temperature > 39.f)
        [patient makeShot];
    else
        NSLog(@"Patient %@ should rest.", patient.name);
}

-(void) patient:(YCPatient*) patient hasQuestion:(NSString*) question
{
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
