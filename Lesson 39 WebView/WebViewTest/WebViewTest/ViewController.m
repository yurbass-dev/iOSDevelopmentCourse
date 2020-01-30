//
//  ViewController.m
//  WebViewTest
//
//  Created by Yuriy on 01.08.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    self.webView.navigationDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSURL *url = [NSURL URLWithString:@"https:www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];
    self.webView.allowsBackForwardNavigationGestures = YES;
    */
    
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
    
//    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
//
//    [self.webView loadData:fileData MIMEType:@"application/pdf" characterEncodingName:@"UTF-8" baseURL:nil];
    
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    NSURLRequest *fileRequest = [NSURLRequest requestWithURL:fileURL];
    
    [self.webView loadRequest:fileRequest];
    */
     
    
    NSString *htmlString = @"<html>"
                                "<body>"
                                    "<h1 style=\"font-size: 50pt; text-align: center;\">Hello, World!</h1>"
                                    "<p><a href=\"https://www.apple.com\">Apple</a></p>"
                                    "<p><a href=\"cmd:show_alert\">TEST BUTTON</a></p>"
                                "</body>"
                            "</html>";

    [self.webView loadHTMLString:htmlString baseURL:nil];
}

#pragma mark - Additional Methods

- (void)refreshButtons {
    
    self.backButtonItem.enabled = self.webView.canGoBack;
    self.forwardButtonItem.enabled = self.webView.canGoForward;
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"decidePolicyForNavigationAction: %@ decisionHandler: %@", navigationAction, decisionHandler);
    
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        
        NSString *urlString = [navigationAction.request.URL absoluteString];
        
        if ([urlString hasPrefix:@"cmd:"]) {
            
            NSString *command = [urlString substringFromIndex:4];
            
            if ([command isEqualToString:@"show_alert"]) {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hello, World!"
                                                                               message:@"Hi there!"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {}];
                [alert addAction:actionOk];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
    NSLog(@"didStartProvisionalNavigation");
    
    [self.activityIndicator startAnimating];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
    NSLog(@"didFinishNavigation");
    
    [self.activityIndicator stopAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    [self refreshButtons];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"didFailNavigation withError %@", error.localizedDescription);
    
    [self.activityIndicator stopAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    [self refreshButtons];
}


#pragma mark - Actions

- (IBAction)actionBack:(UIBarButtonItem *)sender {
    
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (IBAction)actionForward:(UIBarButtonItem *)sender {
    
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}

- (IBAction)actionRefresh:(UIBarButtonItem *)sender {
    
    [self.webView reload];
}


@end
