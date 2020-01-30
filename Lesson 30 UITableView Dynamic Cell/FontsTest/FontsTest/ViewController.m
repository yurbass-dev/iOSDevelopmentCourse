//
//  ViewController.m
//  FontsTest
//
//  Created by Yuriy on 27.02.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView");
    
    return UIFont.familyNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection %ld", section);
    
    NSString *familyName = UIFont.familyNames[section];
    
    return [[UIFont fontNamesForFamilyName:familyName] count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return UIFont.familyNames[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath {%ld, %ld}", indexPath.section, indexPath.row);
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"cell created");
    }
    else {
        NSLog(@"cell reused");
    }
    
    NSString *familyName = UIFont.familyNames[indexPath.section];
    
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString *fontName = fontNames[indexPath.row];
    
    cell.textLabel.text = fontName;
    
    UIFont *font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.font = font;
    
    return cell;
}


@end
