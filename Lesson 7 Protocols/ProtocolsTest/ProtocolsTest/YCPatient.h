//
//  YCPatient.h
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YCPatient <NSObject>

@property (strong, nonatomic) NSString *name;

-(BOOL) areYouOk;
-(void) takePill;
-(void) makeShot;

@optional
-(NSString*) howIsYourFamily;
-(NSString*) howIsYourJob;

@end
