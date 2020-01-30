//
//  ViewController.h
//  MapHW
//
//  Created by Yuriy on 13.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

- (IBAction)actionShowMyLocation:(UIBarButtonItem *)sender;
- (IBAction)actionAddStudents:(UIBarButtonItem *)sender;
- (IBAction)actionAddMeetingPoint:(UIBarButtonItem *)sender;
- (IBAction)actionShowAllStudents:(UIBarButtonItem *)sender;
- (IBAction)actionGetDirections:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UILabel *closeDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *farDistanceLabel;

- (CLLocationCoordinate2D)locationWithBearing:(CLLocationDirection)bearingDegrees distance:(CLLocationDistance)distanceMeters fromLocation:(CLLocationCoordinate2D)origin;


@end

