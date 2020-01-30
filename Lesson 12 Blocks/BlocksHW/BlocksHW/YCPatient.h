//
//  YCPatient.h
//  DelegatesHW
//
//  Created by Yuriy on 13.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define COUNT_BODY_PARTS 7

@class YCPatient;

typedef void (^PatientBlock)(YCPatient*);

typedef NS_ENUM(NSInteger, YCBodyParts)
{
    YCBodyPartsHead = 1,
    YCBodyPartsBelly,
    YCBodyPartsArm,
    YCBodyPartsLeg,
    YCBodyPartsEye,
    YCBodyPartsNose,
    YCBodyPartsHeart
};

@protocol YCPatientDelegate;

@interface YCPatient : NSObject

@property (strong, nonatomic) NSString * name;
@property (assign, nonatomic) CGFloat temperarure;
@property (assign, nonatomic) BOOL headache;                  // головная боль
@property (assign, nonatomic) BOOL nausea;                    // тошнота
@property (assign, nonatomic) BOOL cough;                     // кашель
@property (assign, nonatomic) YCBodyParts bodyPart;           // перечисления (части тела, которые болят у пациента)
@property (assign, nonatomic) NSUInteger becameWorseDelay;    // время, через которое вызовется метод becameWorse


- (instancetype)initWithBlock: (PatientBlock) doctorBlock;
-(void) becameWorse: (PatientBlock) patientBlock;
-(BOOL) areYouBetter;
-(void) takePillFromTemperature;
-(void) takePillFromHeadache;
-(void) takePillFromNausea;
-(void) takePillFromCough;
-(void) makeShotFromTemperature;
-(void) makeShotFromHeadache;
-(void) makeShotFromNausea;
-(void) makeShotFromCough;
-(NSString*) returnStringBodyPart: (YCBodyParts) bodyPart;
-(void) takeMedicineForBodyPart;

@end

