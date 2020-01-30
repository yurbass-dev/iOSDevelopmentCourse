//
//  YCStudent.h
//  SearchHW
//
//  Created by Yuriy on 02.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCStudent : NSObject

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (copy, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) NSUInteger dayOfBirth;
@property (assign, nonatomic) NSUInteger monthOfBirth;
@property (assign, nonatomic) NSUInteger yearOfBirth;

+ (YCStudent *)createRandomStudent;
- (NSString *)randomFirstName;
- (NSString *)randomLastName;

@end

NS_ASSUME_NONNULL_END
