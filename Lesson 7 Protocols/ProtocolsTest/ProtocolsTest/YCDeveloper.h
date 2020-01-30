//
//  YCDeveloper.h
//  ProtocolsTest
//
//  Created by Yuriy on 02.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YCPatient.h"

@interface YCDeveloper : NSObject <YCPatient>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString *name;

-(void) work;

@end
