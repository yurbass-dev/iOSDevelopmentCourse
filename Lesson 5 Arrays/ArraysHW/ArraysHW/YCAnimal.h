//
//  YCAnimal.h
//  ArraysHW
//
//  Created by Yuriy on 21.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YCAnimal : NSObject

@property (strong, nonatomic) NSString * nickname;
@property (strong, nonatomic) NSString * says;
@property (assign, nonatomic) NSUInteger legs;
@property (assign, nonatomic) CGFloat age;

-(void) move;
-(NSString *) description;

@end
