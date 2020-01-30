//
//  YCStudent.h
//  ThreadsHW
//
//  Created by Yuriy on 06.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FindNumBlock)(NSInteger number, NSInteger min, NSInteger max, NSString *name);

@interface YCStudent : NSObject

@property(strong, nonatomic) NSString *name;

// Pupil
-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max;
// Student
-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max withBlock: (FindNumBlock) findNumBlock;

@end
