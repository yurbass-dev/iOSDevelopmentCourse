//
//  YCCow.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCAnimal.h"
#import "YCRunners.h"

@interface YCCow : YCAnimal <YCRunners>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat speedRun;
@property (assign, nonatomic) CGFloat distanceRun;

@end
