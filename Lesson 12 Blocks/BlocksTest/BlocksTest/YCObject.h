//
//  YCObject.h
//  BlocksTest
//
//  Created by Yuriy on 02.10.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ObjectBlock)(void);


@interface YCObject : NSObject

@property (strong, nonatomic) NSString *name;

-(void) testMetod: (ObjectBlock) block;

@end
