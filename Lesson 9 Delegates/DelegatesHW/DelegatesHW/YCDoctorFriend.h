//
//  YCDoctorFriend.h
//  DelegatesHW
//
//  Created by Yuriy on 18.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPatient.h"

@interface YCDoctorFriend : NSObject <YCPatientDelegate>

-(void) takeBeer: (YCPatient*) patient;

@end
