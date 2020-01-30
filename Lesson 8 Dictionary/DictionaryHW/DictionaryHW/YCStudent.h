//
//  YCStudent.h
//  DictionaryHW
//
//  Created by Yuriy on 05.09.18.
//  Copyright © 2018 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *greeting;
@property (strong, nonatomic) NSString *nameObject;

- (instancetype)init;
-(instancetype) initWithName: (NSString*) name andLastName: (NSString*) lastName andGreeting: (NSString*) hello;

@end
