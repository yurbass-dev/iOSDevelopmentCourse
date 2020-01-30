//
//  YCPatient.m
//  DelegatesHW
//
//  Created by Yuriy on 13.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCPatient.h"

@implementation YCPatient

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Patient";
        _temperarure = 36.6f;
        _headache = NO;                  
        _nausea = NO;
        _cough = NO;
        _bodyPart = 1;
        _ratingDoctor = 0;
    }
    return self;
}

-(void) becameWorse
{
    [self.delegate patientFeelsBad:self];
}

-(BOOL) areYouBetter
{
    BOOL iFeelGood = arc4random() % 2;
    
    if (self.ratingDoctor == 0 && iFeelGood == NO)          // Если после первой стадии лечения пациенту не стало лучше
    {
        self.ratingDoctor = arc4random() % 5 + 1;           // присвоить доктору оценку от 1 до 5
    }
    else if (self.ratingDoctor > 5 && iFeelGood == NO)      // Если пациенту не стало лучше и оценка доктора выше 5
    {
        self.ratingDoctor = arc4random() % 5 + 1;           // присвоить доктору оценку от 1 до 5
    }
    else if (self.ratingDoctor == 0 && iFeelGood == YES)    // Если пациенту стало лучше
    {
        self.ratingDoctor = arc4random() % 5 + 6;           // присвоить оценку от 6 до 10
    }
    else if (self.ratingDoctor > 5 && iFeelGood == YES)     // Если пациенту стало лучше, но оценка доктора више 5
    {
        self.ratingDoctor = arc4random() % 5 + 6;           // присвоить оценку от 6 до 10
    }
    
    
    return iFeelGood;
}

-(void) takePillFromTemperature
{
    NSLog(@"Patient %@ takes a pill from temperature.", self.name);
}

-(void) takePillFromHeadache
{
    NSLog(@"Patient %@ takes a pill from headache.", self.name);
}

-(void) takePillFromNausea
{
    NSLog(@"Patient %@ takes a pill from nausea.", self.name);
}

-(void) takePillFromCough
{
    NSLog(@"Patient %@ takes a pill from cough.", self.name);
}

-(void) makeShotFromTemperature
{
    NSLog(@"Patient %@ makes a shot from temperature.", self.name);
}

-(void) makeShotFromHeadache
{
    NSLog(@"Patient %@ makes a shot from headache.", self.name);
}

-(void) makeShotFromNausea
{
    NSLog(@"Patient %@ makes a shot from nausea.", self.name);
}

-(void) makeShotFromCough
{
    NSLog(@"Patient %@ makes a shot from cough.", self.name);
}

-(NSString*) returnStringBodyPart: (YCBodyParts) bodyPart
{
    NSString *string;
    
    switch (bodyPart)
    {
        case YCBodyPartsEye:
            string = @"eye";
            break;
        case YCBodyPartsLeg:
            string = @"leg";
            break;
        case YCBodyPartsHeart:
            string = @"heart";
            break;
        case YCBodyPartsArm:
            string = @"arm";
            break;
        case YCBodyPartsHead:
            string = @"head";
            break;
        case YCBodyPartsNose:
            string = @"nose";
            break;
        case YCBodyPartsBelly:
            string = @"belly";
            break;
        default:
            string = @"Something wrong!";
            break;
    }
    
    return string;
}

-(void) takeMedicineForBodyPart
{
    NSLog(@"Patient %@ takes a medicine for %@.", self.name, [self returnStringBodyPart: self.bodyPart]);
}

@end
