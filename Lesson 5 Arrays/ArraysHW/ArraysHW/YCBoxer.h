//
//  YCBoxer.h
//  ArraysHW
//
//  Created by Yuriy on 20.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCHuman.h"

@interface YCBoxer : YCHuman

@property (assign, nonatomic) CGFloat age;
@property (assign, nonatomic) NSUInteger bouts;
@property (assign, nonatomic) NSUInteger wins;
@property (assign, nonatomic) NSUInteger kos;
@property (assign, nonatomic) CGFloat reach;
@property (strong, nonatomic) NSString *division;
@property (strong, nonatomic) NSString *stance;

-(void) move;
-(NSString *) description;

@end
