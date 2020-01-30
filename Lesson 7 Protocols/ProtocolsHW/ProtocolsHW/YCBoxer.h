//
//  YCBoxer.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCHuman.h"
#import "YCRunners.h"
#import "YCJumpers.h"
#import "YCSwimmers.h"

@interface YCBoxer : YCHuman <YCRunners, YCJumpers, YCSwimmers>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat speedRun;
@property (assign, nonatomic) CGFloat distanceRun;
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;
@property (assign, nonatomic) CGFloat speedSwim;
@property (assign, nonatomic) CGFloat distanceSwim;
@property (assign, nonatomic) CGFloat age;
@property (assign, nonatomic) CGFloat heightSwimmer;

@end

