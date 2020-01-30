//
//  YCDoctor.h
//  DelegatesTest
//
//  Created by Yuriy on 10.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPatient.h"

@interface YCDoctor : NSObject <YCPatientDelegate>

@end
