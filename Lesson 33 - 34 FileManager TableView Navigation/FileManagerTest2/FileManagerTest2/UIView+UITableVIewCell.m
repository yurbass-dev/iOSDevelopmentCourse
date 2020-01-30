//
//  UIView+UITableVIewCell.m
//  FileManagerTest2
//
//  Created by Yuriy on 23.05.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "UIView+UITableVIewCell.h"

@implementation UIView (UITableVIewCell)

- (UITableViewCell *)superCell {
    
    if (!self.superview) {
        return nil;
    }
    
    if ([self.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)self.superview;
    }
    
    return [self.superview superCell];
}

@end
