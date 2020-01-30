//
//  YCStudent.h
//  TableViewEditingTest
//
//  Created by Yuriy on 10.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (YCStudent *)randomStudent;

@end

NS_ASSUME_NONNULL_END
