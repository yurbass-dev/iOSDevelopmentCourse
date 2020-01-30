//
//  YCSwimmer.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCHuman.h"
#import "YCSwimmers.h"

@interface YCSwimmer : YCHuman <YCSwimmers>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat speedSwim;
@property (assign, nonatomic) CGFloat distanceSwim;
@property (assign, nonatomic) CGFloat heightSwimmer;

@end
