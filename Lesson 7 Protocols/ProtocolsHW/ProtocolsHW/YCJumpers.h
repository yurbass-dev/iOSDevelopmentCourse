//
//  YCJumpers.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YCJumpers <NSObject>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;

-(NSString*) jump;
-(NSString*) acceleration;

@optional

@property (assign, nonatomic) CGFloat age;

-(NSString*) rest;

@end
