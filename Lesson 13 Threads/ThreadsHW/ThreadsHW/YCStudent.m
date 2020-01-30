//
//  YCStudent.m
//  ThreadsHW
//
//  Created by Yuriy on 06.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import "YCStudent.h"

@implementation YCStudent

#pragma mark - Pupil

-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max
{
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
        // Создаем паралельную очередь
        dispatch_queue_t queue = dispatch_queue_create("com.ychizh.findnum.queue", DISPATCH_QUEUE_CONCURRENT);
        
        // Запускаем нашу очередь ассинхронно
        dispatch_async(queue, ^{
            NSInteger numFinding;
            
            // Выполнять генерацию чисел, пока не будет найдено искомое число
            do
            {
                numFinding = arc4random() % (max - min + 1) + min;
            }
            while (number != numFinding);
            
            NSLog(@"Student %@ found your number, this is %ld!", self.name, numFinding);
        });
    }
}

#pragma mark - Student
/*
-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max withBlock: (FindNumBlock) findNumBlock
{
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
        // Подключаемся к главной очереди
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        // Запускаем очередь ассинхронно
        dispatch_async(queue, ^{
            findNumBlock(number, min, max, self.name);
        });
    }
}
*/

#pragma mark - Master

+(dispatch_queue_t) getConcurentQueue
{
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.ychizh.oncequeue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return queue;
}

-(void) guessNumber: (NSInteger) number rangeFrom: (NSInteger) min to: (NSInteger) max withBlock: (FindNumBlock) findNumBlock
{
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
        // Подключаемся к нашей очереди com.ychizh.oncequeue
        dispatch_queue_t queue = [YCStudent getConcurentQueue];
        
        // Запускаем очередь ассинхронно
        dispatch_async(queue, ^{
            findNumBlock(number, min, max, self.name);
        });
    }
}

@end
