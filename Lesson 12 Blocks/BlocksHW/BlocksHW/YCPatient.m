//
//  YCPatient.m
//  DelegatesHW
//
//  Created by Yuriy on 13.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCPatient.h"

@implementation YCPatient

- (instancetype)initWithBlock: (PatientBlock) doctorBlock
{
    self = [super init];
    if (self) {
        _name = @"Patient";
        _temperarure = 36.6f;
        _headache = NO;                  
        _nausea = NO;
        _cough = NO;
        _bodyPart = 1;
        _becameWorseDelay = arc4random() % 11 + 5;
        [self performSelector: @selector(becameWorse:)                      // вызвать метод через рандомное время от 5 до 15 секунд
                   withObject: doctorBlock
                   afterDelay: _becameWorseDelay];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"Patient %@ is dealoccated", _name);
    NSLog(@"");
}

-(void) becameWorse: (PatientBlock) patientBlock
{
    patientBlock(self);
}

-(BOOL) areYouBetter
{
    BOOL iFeelGood = arc4random() % 2;
    
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
