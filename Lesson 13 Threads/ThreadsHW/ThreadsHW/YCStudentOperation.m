//
//  YCStudentOperation.m
//  ThreadsHW
//
//  Created by Yuriy on 14.10.2018.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudentOperation.h"

@implementation YCStudentOperation

// Создаем очередь один раз и возвращаем ее
+(NSOperationQueue *) getQueue
{
    static NSOperationQueue *queue;;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        queue = [[NSOperationQueue alloc] init];
    });
    
    return queue;
}

-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max withBlock: (FindNumBlock) findNumBlock
{
    NSOperationQueue *queue = [YCStudentOperation getQueue];
    
    NSOperation *operation = [[NSOperation alloc] init];
    
    // Если диапазон начинается с большего числа, а заканчивается меньшим, то поменять их местами
    if (min > max)
    {
        NSInteger temp = min;
        min = max;
        max = temp;
    }
    
    // Проверяем попадает ли число в диапазон
    if ((number < min || number > max) && (number > min || number < max))
    {
        NSLog(@"Number %ld is out of the range %ld...%ld", number, min, max);
    }
    else
    {
        [queue addOperation: operation];
        
        [operation setCompletionBlock: ^{
            findNumBlock(number, min, max, self.name);
        }];
    }
}

@end
