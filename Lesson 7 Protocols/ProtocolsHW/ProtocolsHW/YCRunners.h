//
//  YCRunners.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YCRunners <NSObject>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat speedRun;
@property (assign, nonatomic) CGFloat distanceRun;

-(NSString*) run1;
-(NSString*) acceleration;

@optional

@property (assign, nonatomic) CGFloat weight;

-(NSString*) eat;

@end
