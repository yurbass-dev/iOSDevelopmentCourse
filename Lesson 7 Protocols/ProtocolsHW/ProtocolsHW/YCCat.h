//
//  YCCat.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCAnimal.h"
#import "YCRunners.h"
#import "YCJumpers.h"

@interface YCCat : YCAnimal <YCJumpers>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat heightJump;
@property (assign, nonatomic) CGFloat lengthJump;
@property (assign, nonatomic) CGFloat age;

@end
