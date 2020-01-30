//
//  YCStudent.h
//  BlocksHW
//
//  Created by Yuriy on 03.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

- (instancetype)init;
- (instancetype)initWithName: (NSString*) firstName andLastName: (NSString*) lastName NS_DESIGNATED_INITIALIZER;

@end
