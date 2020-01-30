//
//  YCSection.h
//  SearchHW
//
//  Created by Yuriy on 02.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCSection : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *students;

@end

NS_ASSUME_NONNULL_END
