//
//  YCSwimmers.h
//  ProtocolsHW
//
//  Created by Yuriy on 04.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YCSwimmers <NSObject>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat speedSwim;
@property (assign, nonatomic) CGFloat distanceSwim;

-(NSString*) swim;
-(NSString*) dive;

@optional

@property (assign, nonatomic) CGFloat heightSwimmer;

-(NSString*) drink;

@end
