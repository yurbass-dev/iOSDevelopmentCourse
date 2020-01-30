//
//  ViewController.m
//  MapHW
//
//  Created by Yuriy on 13.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "YCStudent.h"
#import "YCMeetingPoint.h"
#import "YCAnnotationInfoPopoverController.h"

static const CLLocationDistance kCloseCircleDistance = 5000.0;
static const CLLocationDistance kMiddleCircleDistance = 10000.0;
static const CLLocationDistance kFarCircleDistance = 15000.0;


@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic, readonly) NSDateFormatter *dateFormatter;
@property (strong, nonatomic, readonly) CLLocationManager *locationManager;
@property (strong, nonatomic, readonly) CLGeocoder *geocoder;
@property (strong, nonatomic) MKDirections *directions;
@property (copy, nonatomic) NSArray *circleOverlays;
@property (strong, nonatomic) NSMutableArray *directionOverlays;
@property (copy, nonatomic) NSArray *students;
@property (copy, nonatomic) NSDictionary *studentsInCircles;
@property (strong, nonatomic) YCMeetingPoint *meetingPoint;

@end

@implementation ViewController

@synthesize dateFormatter = _dateFormatter;
@synthesize locationManager = _locationManager;
@synthesize geocoder = _geocoder;

#pragma mark - Lazy Instantiation

- (NSDateFormatter *)dateFormatter {
    
    if (!_dateFormatter) {
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateFormat = @"dd MMM yyyy";
    }
    return _dateFormatter;
}

- (CLLocationManager *)locationManager {

    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (CLGeocoder *)geocoder {
    
    if (!_geocoder) {
        _geocoder = [CLGeocoder new];
    }
    return _geocoder;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - Dealloc

- (void)dealloc
{
    if (self.geocoder.isGeocoding) {
        [self.geocoder cancelGeocode];
    }
    if (self.directions.isCalculating) {
        [self.directions cancel];
    }
    if (self.directions.isCalculating) {
        [self.directions cancel];
    }
}

#pragma mark - Additional Methods

- (CLLocationCoordinate2D)locationWithBearing:(CLLocationDirection)bearingDegrees distance:(CLLocationDistance)distanceMeters fromLocation:(CLLocationCoordinate2D)origin {
    
    CLLocationCoordinate2D target;
    const double distRadians = distanceMeters / (6372797.6);
    const double bearingRadians = bearingDegrees * M_PI / 180;
    
    CGFloat lat1 = origin.latitude * M_PI / 180;
    CGFloat lon1 = origin.longitude * M_PI / 180;
    
    CGFloat lat2 = asin(sin(lat1) * cos(distRadians) + cos(lat1) * sin(distRadians) * cos(bearingRadians));
    CGFloat lon2 = lon1 + atan2(sin(bearingRadians) * sin(distRadians) * cos(lat1), cos(distRadians) - sin(lat1) * sin(lat2));
    
    target.latitude = lat2 * 180 / M_PI;
    target.longitude = lon2 * 180 / M_PI;
    
    return target;
}

- (void)createCirclesFromCoordinate:(CLLocationCoordinate2D)coordinate {
    
    MKCircle *circle1 = [MKCircle circleWithCenterCoordinate:coordinate radius:kCloseCircleDistance];
    MKCircle *circle2 = [MKCircle circleWithCenterCoordinate:coordinate radius:kMiddleCircleDistance];
    MKCircle *circle3 = [MKCircle circleWithCenterCoordinate:coordinate radius:kFarCircleDistance];
    
    [self.mapView removeOverlays:self.circleOverlays];
    self.circleOverlays = @[circle1, circle2, circle3];
    [self.mapView addOverlays:self.circleOverlays];
}

- (BOOL)randomBoolWithYesPercentage:(NSInteger)percentage {
    
    return arc4random_uniform(100) < percentage;
}

- (void)createDirections {
    
    if (self.students && self.meetingPoint) {

        if (self.directions.isCalculating) {
            [self.directions cancel];
        }
        
        [self.mapView removeOverlays:self.directionOverlays];
        self.directionOverlays = [NSMutableArray array];
        
        MKPlacemark *meetingPointPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.meetingPoint.coordinate];
        MKMapItem *meetingPointMapItem = [[MKMapItem alloc] initWithPlacemark:meetingPointPlacemark];
        MKDirectionsRequest *directionsRequest = [MKDirectionsRequest new];
        directionsRequest.transportType = MKDirectionsTransportTypeAny;

        for (NSString *key in self.studentsInCircles.allKeys) {
            
            for (YCStudent *student in self.studentsInCircles[key]) {
                BOOL shouldShowDirection = NO;
                
                if ([key isEqualToString:@"close"]) {
                    shouldShowDirection = [self randomBoolWithYesPercentage:90];
                }
                else if ([key isEqualToString:@"middle"]) {
                    shouldShowDirection = [self randomBoolWithYesPercentage:50];
                }
                else if ([key isEqualToString:@"far"]) {
                    shouldShowDirection = [self randomBoolWithYesPercentage:10];
                }
                
                if (shouldShowDirection) {
                    
                    MKPlacemark *studentPlacemark = [[MKPlacemark alloc] initWithCoordinate:student.coordinate];
                    MKMapItem *studentMapItem = [[MKMapItem alloc] initWithPlacemark:studentPlacemark];
                    directionsRequest.source = studentMapItem;
                    directionsRequest.destination = meetingPointMapItem;
                    
                    self.directions = [[MKDirections alloc] initWithRequest:directionsRequest];
                    __weak MKMapView *weakMapView = self.mapView;
                    
                    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
                        
                        if (error) {
                            NSLog(@"%@", error.localizedDescription);
                        }
                        else {
                            for (MKRoute *route in response.routes) {
                                [self.directionOverlays addObject:route.polyline];
                            }
                            [weakMapView addOverlays:self.directionOverlays];
                        }
                    }];
                }
            }
        }
    }
}

- (void)countStudents:(NSArray *)students inCircles:(NSArray *)circles {
    
    if (students && circles) {
        
        NSInteger countCloseDistanceStudents = 0;
        NSInteger countMiddleDistanceStudents = 0;
        NSInteger countFarDistanceStudents = 0;
        
        MKCircle *circle = self.circleOverlays.firstObject;
        CLLocationCoordinate2D circleCoordinate = circle.coordinate;
        CLLocation *centerCircleLocation = [[CLLocation alloc] initWithLatitude:circleCoordinate.latitude
                                                                longitude:circleCoordinate.longitude];
        
        NSMutableArray *closeDistanceStudents = [NSMutableArray array];
        NSMutableArray *middleDistanceStudents = [NSMutableArray array];
        NSMutableArray *farDistanceStudents = [NSMutableArray array];
        
        for (YCStudent *student in students) {
            
            CLLocation *studentLocation = [[CLLocation alloc] initWithLatitude:student.coordinate.latitude
                                                                     longitude:student.coordinate.longitude];
            CLLocationDistance distance = [studentLocation distanceFromLocation:centerCircleLocation];
            
            if (distance <= kCloseCircleDistance) {
                countCloseDistanceStudents++;
                [closeDistanceStudents addObject:student];
            }
            else if (distance <= kMiddleCircleDistance) {
                countMiddleDistanceStudents++;
                [middleDistanceStudents addObject:student];            }
            else if (distance <= kFarCircleDistance) {
                countFarDistanceStudents++;
                [farDistanceStudents addObject:student];
            }
        }
        
        self.closeDistanceLabel.text = [NSString stringWithFormat:@"%ld", countCloseDistanceStudents];
        self.middleDistanceLabel.text = [NSString stringWithFormat:@"%ld", countMiddleDistanceStudents];
        self.farDistanceLabel.text = [NSString stringWithFormat:@"%ld", countFarDistanceStudents];
        
        self.studentsInCircles = @{@"close": closeDistanceStudents, @"middle": middleDistanceStudents, @"far": farDistanceStudents};
    }
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *const StudentIdentifier = @"StudentIdentifier";
    static NSString *const MeetingPointIdentifier = @"MeetingPointIdentifier";
    
    MKAnnotationView *annotationView = nil;
    
    if ([annotation isKindOfClass:[YCStudent class]]) {
        annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:StudentIdentifier];
        
        if (annotationView) {
            annotationView.annotation = annotation;
        }
        else {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:StudentIdentifier];
            annotationView.canShowCallout = YES;

            if ([(YCStudent *)annotation gender] == YCStudentGenderMale) {
                annotationView.image = [UIImage imageNamed:@"male.png"];
            }
            else if ([(YCStudent *)annotation gender] == YCStudentGenderFemale) {
                annotationView.image = [UIImage imageNamed:@"female.png"];
            }
            
            UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            annotationView.rightCalloutAccessoryView = infoButton;
        }
    }
    else if ([annotation isKindOfClass:[YCMeetingPoint class]]) {
        annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:MeetingPointIdentifier];
        
        if (annotationView) {
            annotationView.annotation = annotation;
        }
        else {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MeetingPointIdentifier];
            annotationView.canShowCallout = YES;
            annotationView.draggable = YES;
            annotationView.image = [UIImage imageNamed:@"Mcdonalds_icon.png"];
        }
    }
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)annotationViews {

    for (MKAnnotationView *annotationView in annotationViews) {
        
        CGRect endFrame = annotationView.frame;
        annotationView.frame = CGRectOffset(endFrame, 0, -500);
        [UIView animateWithDuration:0.5
                         animations:^{ annotationView.frame = endFrame; }];
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    [mapView deselectAnnotation:view.annotation animated:YES];
    
    if (self.geocoder.isGeocoding) {
        [self.geocoder cancelGeocode];
    }
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude
                                                      longitude:view.annotation.coordinate.longitude];
    __weak typeof(self) weakSelf = self;
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
        
        if (placemarks && placemarks.count > 0) {
            
            YCAnnotationInfoPopoverController *annotationVC = [weakSelf.storyboard
                                                               instantiateViewControllerWithIdentifier:@"YCAnnotationInfoPopoverController"];
            
            annotationVC.modalPresentationStyle = UIModalPresentationPopover;
            annotationVC.student = (YCStudent *)view.annotation;
            annotationVC.student.placemark = [placemarks firstObject];
            
            UIPopoverPresentationController *popover = annotationVC.popoverPresentationController;
            popover.delegate = weakSelf;
            popover.sourceRect = CGRectMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds), 0, 0);
            popover.sourceView = view;
            
            [self presentViewController:annotationVC animated:YES completion:nil];
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *circleRender = [[MKCircleRenderer alloc] initWithOverlay:overlay];
        circleRender.fillColor = [UIColor.blueColor colorWithAlphaComponent:0.2f];
        return circleRender;
    }
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *polylineRender = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        polylineRender.strokeColor = [UIColor.blueColor colorWithAlphaComponent:0.8f];
        polylineRender.lineWidth = 3.0f;
        return polylineRender;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
    
    if (newState == MKAnnotationViewDragStateEnding) {
        if ([view.annotation isKindOfClass:[YCMeetingPoint class]]) {
            [self createCirclesFromCoordinate:view.annotation.coordinate];
            [self countStudents:self.students inCircles:self.circleOverlays];
            [self createDirections];
        }
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    
    return UIModalPresentationNone;
}

#pragma mark - Actions

- (IBAction)actionShowMyLocation:(UIBarButtonItem *)sender {
    
    if (self.mapView.userLocation) {
        [self.mapView showAnnotations:@[self.mapView.userLocation] animated:YES];
    }
}

- (IBAction)actionAddStudents:(UIBarButtonItem *)sender {

    NSMutableArray *students = [NSMutableArray array];
    NSInteger randomStudentsCount = arc4random_uniform(20) + 10;
    
    for (NSInteger index = 0; index < randomStudentsCount; index++) {
        
        YCStudent *student = [YCStudent createRandomStudent];
        NSInteger randomBearingDegrees = arc4random_uniform(360);
        NSInteger randomDistance = arc4random_uniform(20000);
        
        student.coordinate = [self locationWithBearing:randomBearingDegrees distance:randomDistance fromLocation:self.mapView.centerCoordinate];
        student.title = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
        student.subtitle = [self.dateFormatter stringFromDate:student.dateOfBirth];
        
        [students addObject:student];
    }
    
    [self.mapView addAnnotations:students];
    self.students = students;
    [self countStudents:self.students inCircles:self.circleOverlays];
}

- (IBAction)actionAddMeetingPoint:(UIBarButtonItem *)sender {
    
    self.meetingPoint = [YCMeetingPoint new];
    self.meetingPoint.title = @"McDonalds";
    self.meetingPoint.coordinate = self.mapView.centerCoordinate;
    
    [self.mapView addAnnotation:self.meetingPoint];
    [self createCirclesFromCoordinate:self.meetingPoint.coordinate];
    [self countStudents:self.students inCircles:self.circleOverlays];
}

- (IBAction)actionShowAllStudents:(UIBarButtonItem *)sender {
    
    NSMutableArray *studentAnnotations = [self.mapView.annotations mutableCopy];
    [studentAnnotations removeObject:self.mapView.userLocation];
    [self.mapView showAnnotations:studentAnnotations animated:YES];
}

- (IBAction)actionGetDirections:(UIBarButtonItem *)sender {
    
    [self createDirections];
}

@end
