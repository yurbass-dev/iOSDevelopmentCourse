//
//  YCStudent.h
//  TableViewDynamicCells
//
//  Created by Yuriy on 06.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YCStudentLevel) {
    
    YCStudentLevelExelent,
    YCStudentLevelGood,
    YCStudentLevelNormal,
    YCStudentLevelBad
};

extern NSString *const exelentStudentKey;
extern NSString *const goodStudentKey;
extern NSString *const normalStudentKey;
extern NSString *const badStudentKey;

@interface YCStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) CGFloat averageGrade;
@property (assign, nonatomic) YCStudentLevel level;

@end

NS_ASSUME_NONNULL_END
