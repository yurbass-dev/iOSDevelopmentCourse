//
//  YCStudentOperation.h
//  ThreadsHW
//
//  Created by Yuriy on 14.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FindNumBlock)(NSInteger number, NSInteger min, NSInteger max, NSString *name);

@interface YCStudentOperation : NSObject

@property(strong, nonatomic) NSString *name;

-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max withBlock: (FindNumBlock) findNumBlock;

@end

