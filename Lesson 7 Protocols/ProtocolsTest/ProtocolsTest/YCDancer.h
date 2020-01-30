//
//  YCDancer.h
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCPatient.h"

@interface YCDancer : NSObject <YCPatient>

@property (strong, nonatomic) NSString *favouriteDance;
@property (strong, nonatomic) NSString *name;

-(void) dance;

@end
