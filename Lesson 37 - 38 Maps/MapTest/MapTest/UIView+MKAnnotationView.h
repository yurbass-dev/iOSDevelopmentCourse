//
//  UIView+MKAnnotationView.h
//  MapTest
//
//  Created by Yuriy on 11.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MKAnnotationView;

@interface UIView (MKAnnotationView)

- (MKAnnotationView *)superAnnotationView;

@end

NS_ASSUME_NONNULL_END
