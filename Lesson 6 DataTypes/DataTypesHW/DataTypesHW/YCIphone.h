//
//  YCIphone.h
//  DataTypesHW
//
//  Created by Yuriy on 28.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCIphone : NSObject

typedef enum
{
   red, green, blue, yellow, white, pink, black, jetBlack, spaceGray, silver, gold, roseGold
} YCColor;

typedef enum
{
    haveJack3_5,
    dontHaveJack3_5
} YCJack3_5;

typedef enum
{
    bit_32,
    bit_64
} YCProcessorType;

typedef enum
{
    single,
    dual
} YCCamera;

@property (assign, nonatomic) YCColor color;
@property (assign, nonatomic) YCJack3_5 jack3_5;
@property (assign, nonatomic) YCProcessorType processorType;
@property (assign, nonatomic) YCCamera camera;

@end
