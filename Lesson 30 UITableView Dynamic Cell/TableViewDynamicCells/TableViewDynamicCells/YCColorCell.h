//
//  YCColorWithName.h
//  TableViewDynamicCells
//
//  Created by Yuriy on 05.03.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCColorCell : NSObject

@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *name;

@end

NS_ASSUME_NONNULL_END
