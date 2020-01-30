//
//  YCPatient.h
//  DelegatesTest
//
//  Created by Yuriy on 10.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YCPatientDelegate;

@interface YCPatient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (weak, nonatomic) id <YCPatientDelegate> delegate;

-(BOOL) howAreYou;
-(void) takePill;
-(void) makeShot;

@end

@protocol YCPatientDelegate <NSObject>

-(void) patientFeelsBad:(YCPatient*) patient;
-(void) patient:(YCPatient*) patient hasQuestion:(NSString*) question;

@end
