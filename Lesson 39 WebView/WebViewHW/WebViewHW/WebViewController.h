//
//  WebViewController.h
//  WebViewHW
//
//  Created by Yuriy on 22.08.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WKWebView.h>
#import <WebKit/WKNavigationDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) NSURLRequest *request;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousPageButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextPageButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshPageButtonItem;


- (IBAction)actionPreviousPage:(UIBarButtonItem *)sender;
- (IBAction)actionRefreshPage:(UIBarButtonItem *)sender;
- (IBAction)actionNextPage:(UIBarButtonItem *)sender;


@end

NS_ASSUME_NONNULL_END
