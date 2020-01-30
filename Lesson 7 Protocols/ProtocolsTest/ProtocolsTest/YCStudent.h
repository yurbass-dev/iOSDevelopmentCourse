//
//  YCStudent.h
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPatient.h"

@interface YCStudent : NSObject <YCPatient>

@property (strong, nonatomic) NSString *universityName;
@property (strong, nonatomic) NSString *name;

-(void) study;

@end
