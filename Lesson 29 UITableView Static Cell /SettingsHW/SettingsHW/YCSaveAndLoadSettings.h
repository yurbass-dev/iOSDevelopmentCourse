//
//  YCSaveAndLoadSettings.h
//  SettingsHW
//
//  Created by Yuriy on 24.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCSaveAndLoadSettings : NSObject

- (void)saveSettings:(NSArray *)textFieldsAndControls;
- (void)loadSettings:(NSArray *)textFieldsAndControls andTextLabels:(NSArray *)textLabels;

@end

NS_ASSUME_NONNULL_END
