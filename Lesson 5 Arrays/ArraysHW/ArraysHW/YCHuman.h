//
//  YCHuman.h
//  ArraysHW
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YCHuman : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *gender;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;

-(void) move;
-(NSString *) description;

@end
