//
//  ResourceData.h
//  WebViewHW
//
//  Created by Yuriy on 02.09.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResourceData : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSArray <NSURLRequest *> *URLRequests;
@property (copy, nonatomic) NSArray <NSString *> *names;

- (instancetype)initWithResources:(NSArray <NSString *>*)resources withExtension:(NSString *)extension NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithWebLinks:(NSArray <NSString *>*)webLinks withWebName:(NSArray <NSString *>*)webNames NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (NSArray <NSURLRequest *>*)URLRequestFromResource:(NSArray <NSString *>*)resources withExtension:(NSString *)extension;
- (NSArray <NSURLRequest *>*)URLRequestFromWebLink:(NSArray <NSString *>*)webLinks;
+ (NSArray <NSString *>*)PDFNames;
+ (NSArray <NSString *>*)webNames;
+ (NSArray <NSString *>*)webLinks;

@end

NS_ASSUME_NONNULL_END
