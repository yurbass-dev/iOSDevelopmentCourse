//
//  AppDelegate.h
//  ParametersTest
//
//  Created by Yuriy on 19.08.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCObject;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (copy, nonatomic) YCObject *object;

@end

