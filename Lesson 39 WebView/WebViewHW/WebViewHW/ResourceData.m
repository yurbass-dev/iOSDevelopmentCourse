//
//  ResourceData.m
//  WebViewHW
//
//  Created by Yuriy on 02.09.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ResourceData.h"

@implementation ResourceData

+ (NSArray <NSString *>*)PDFNames {
    
    NSArray *PDFNames = @[@"Язык программирования C. Лекции и упражнения, 6-е издание",
                          @"Сила Objective-C 2",
                          @"OBJ-C_Stiven_Kochan"];
    return PDFNames;
}

+ (NSArray <NSString *>*)webNames {
    
    NSArray *webNames = @[@"Apple", @"iOS Development Course", @"Apple Development Documentation"];
    return webNames;
}

+ (NSArray <NSString *>*)webLinks {
    
    NSArray *webLinks = @[@"https://www.apple.com",
                          @"https://vk.com/iosdevcourse",
                          @"https://developer.apple.com/documentation"];
    return webLinks;
}

- (instancetype)init {
    
    self = [self initWithWebLinks:@[@"https://www.apple.com"] withWebName:@[@"Apple"]];
    return self;
}

- (instancetype)initWithResources:(NSArray <NSString *>*)resources withExtension:(NSString *)extension {
    
    self = [super init];
    if (self) {
        _title = extension.uppercaseString;
        _names = resources;
        _URLRequests = [self URLRequestFromResource:resources withExtension:extension];
    }
    return self;
}

- (instancetype)initWithWebLinks:(NSArray <NSString *>*)webLinks withWebName:(NSArray <NSString *>*)webNames {
    
    self = [super init];
    if (self) {
        _title = @"WEB";
        _names = webNames;
        _URLRequests = [self URLRequestFromWebLink:webLinks];
    }
    return self;
}

- (NSArray <NSURLRequest *>*)URLRequestFromResource:(NSArray <NSString *>*)resources withExtension:(NSString *)extension {
    
    NSMutableArray <NSURLRequest *> *URLRequests = [NSMutableArray array];
    
    for (NSString *resource in resources) {
        NSURL *URL = [[NSBundle mainBundle] URLForResource:resource withExtension:extension];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [URLRequests addObject:request];
    }
    
    return [URLRequests copy];
}

- (NSArray <NSURLRequest *>*)URLRequestFromWebLink:(NSArray <NSString *>*)webLinks {
    
    NSMutableArray <NSURLRequest *> *URLRequests = [NSMutableArray array];
    
    for (NSString *webLink in webLinks) {
        NSURL *URL = [NSURL URLWithString:webLink];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [URLRequests addObject:request];
    }
    
    return [URLRequests copy];
}

@end
