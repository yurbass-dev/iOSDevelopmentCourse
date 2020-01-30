//
//  YCDog.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCAnimal.h"
#import "YCRunners.h"
#import "YCSwimmers.h"

@interface YCDog : YCAnimal <YCRunners>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat speedRun;
@property (assign, nonatomic) CGFloat distanceRun;
@property (assign, nonatomic) CGFloat weight;

@end
