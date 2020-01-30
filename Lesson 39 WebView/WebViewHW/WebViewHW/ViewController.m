//
//  ViewController.m
//  WebViewHW
//
//  Created by Yuriy on 22.08.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "ResourceData.h"

@interface ViewController ()

@property (copy, nonatomic) NSArray <ResourceData *> *data;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ResourceData *PDF = [[ResourceData alloc] initWithResources:[ResourceData PDFNames] withExtension:@"pdf"];
    ResourceData *WEB = [[ResourceData alloc] initWithWebLinks:[ResourceData webLinks] withWebName:[ResourceData webNames]];
    self.data = @[PDF, WEB];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.data.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.data[section] title];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.data[section] names] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    ResourceData *resourse = self.data[indexPath.section];
    cell.textLabel.text = resourse.names[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewController *webController = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    ResourceData *resourse = self.data[indexPath.section];
    webController.request = resourse.URLRequests[indexPath.row];
    webController.title = resourse.names[indexPath.row];
    [self.navigationController pushViewController:webController animated:YES];
}

@end
