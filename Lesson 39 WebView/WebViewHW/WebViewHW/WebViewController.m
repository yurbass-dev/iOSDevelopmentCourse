//
//  WebViewController.m
//  WebViewHW
//
//  Created by Yuriy on 22.08.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController 

#pragma mark - View Lifecycle

- (void)loadView {
    [super loadView];
    
    self.webView.navigationDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.request) {
        [self.webView loadRequest:self.request];
    }
}

#pragma mark - Additional Methods

- (void)refreshButtons {
    
    self.previousPageButtonItem.enabled = self.webView.canGoBack;
    self.nextPageButtonItem.enabled = self.webView.canGoForward;
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
    [self.activityIndicator startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
    [self.activityIndicator stopAnimating];
    [self refreshButtons];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
    [self.activityIndicator stopAnimating];
    [self refreshButtons];
}

#pragma mark - Actions

- (IBAction)actionPreviousPage:(UIBarButtonItem *)sender {
    
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (IBAction)actionRefreshPage:(UIBarButtonItem *)sender {
    
    [self.webView reload];
}

- (IBAction)actionNextPage:(UIBarButtonItem *)sender {
    
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}
@end
