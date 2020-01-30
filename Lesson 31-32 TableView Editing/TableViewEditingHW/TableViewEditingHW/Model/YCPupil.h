//
//  YCPupil.h
//  TableViewEditingHW
//
//  Created by Yuriy on 17.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCPupil : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (YCPupil *)createPupil;

@end

NS_ASSUME_NONNULL_END
