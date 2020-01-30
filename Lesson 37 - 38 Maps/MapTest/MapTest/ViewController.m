//
//  ViewController.m
//  MapTest
//
//  Created by Yuriy on 08.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "YCMapAnnotation.h"
#import "UIView+MKAnnotationView.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager* locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) MKDirections *direction;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(actionAdd:)];
    
    UIBarButtonItem *zoomButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                               target:self
                                                                               action:@selector(actionShowAll:)];
    self.navigationItem.rightBarButtonItems = @[zoomButton, addButton];
    
    self.geocoder = [CLGeocoder new];
}

- (void)dealloc {
    
    if (self.geocoder.isGeocoding) {
        [self.geocoder cancelGeocode];
    }
    
    if (self.direction.isCalculating) {
        [self.direction cancel];
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
}

#pragma mark - MKMapViewDelegate
/*
 - (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
 NSLog(@"regionWillChangeAnimated");
 }
 - (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
 NSLog(@"regionDidChangeAnimated");
 }
 
 - (void)mapViewDidChangeVisibleRegion:(MKMapView *)mapView {
 NSLog(@"mapViewDidChangeVisibleRegion");
 }
 
 - (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
 NSLog(@"mapViewWillStartLoadingMap");
 }
 - (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
 NSLog(@"mapViewDidFinishLoadingMap");
 }
 - (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
 NSLog(@"mapViewDidFailLoadingMap");
 }
 
 - (void)mapViewWillStartRenderingMap:(MKMapView *)mapView {
 NSLog(@"mapViewWillStartRenderingMap");
 }
 - (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
 NSLog(@"mapViewDidFinishRenderingMap fullyRendered = %d", fullyRendered);
 }
 */

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *identifier = @"Annotation";
    
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!pin) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        pin.pinTintColor = UIColor.purpleColor;
        pin.animatesDrop = YES;
        pin.canShowCallout = YES;
        pin.draggable = YES;
        
        UIButton *descriptionButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [descriptionButton addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
        pin.rightCalloutAccessoryView = descriptionButton;
        
        UIButton *directionButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [directionButton addTarget:self action:@selector(actionDirection:) forControlEvents:UIControlEventTouchUpInside];
        pin.leftCalloutAccessoryView = directionButton;
    }
    else {
        pin.annotation = annotation;
    }
    
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
    
    if (newState == MKAnnotationViewDragStateEnding) {
        
        CLLocationCoordinate2D location = view.annotation.coordinate;
        MKMapPoint point = MKMapPointForCoordinate(location);
         
        NSLog(@"\nlocation = {%f, %f}\npoint = %@", location.latitude, location.longitude, MKStringFromMapPoint(point));
        
        YCMapAnnotation *annotation = view.annotation;
        annotation.subtitle = [NSString stringWithFormat:@"%f, %f", location.latitude, location.longitude];
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        
        renderer.lineWidth = 2.f;
        renderer.strokeColor = [UIColor colorWithRed:0.f green:0.5f blue:1.0f alpha:0.9f];
        
        return renderer;
    }
    
    return nil;
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Actions

- (void)actionAdd:(UIBarButtonItem *)sender {
    
    YCMapAnnotation *annotation = [YCMapAnnotation new];
    
    annotation.title = @"Test Title";
    annotation.subtitle = [NSString stringWithFormat:@"%f, %f", self.mapView.region.center.latitude, self.mapView.region.center.longitude];
    annotation.coordinate = self.mapView.region.center;
    
    [self.mapView addAnnotation:annotation];
}

- (void)actionShowAll:(UIBarButtonItem *)sender {
    
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in self.mapView.annotations) {
        
        CLLocationCoordinate2D location = annotation.coordinate;
        MKMapPoint point = MKMapPointForCoordinate(location);
        
        static CGFloat delta = 20000;
        MKMapRect rect = MKMapRectMake(point.x - delta, point.y - delta, delta * 2, delta * 2);
        
        zoomRect = MKMapRectUnion(zoomRect, rect);
    }
    
    zoomRect = [self.mapView mapRectThatFits:zoomRect];
    
    [self.mapView setVisibleMapRect:zoomRect
                        edgePadding:UIEdgeInsetsMake(50, 50, 50, 50)
                           animated:YES];
}

- (void)actionDescription:(UIButton *)sender {
    
    MKAnnotationView *annotationView = [sender superAnnotationView];
    
    if (!annotationView) {
        return;
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude
                                                      longitude:coordinate.longitude];
    
    if (self.geocoder.isGeocoding) {
        [self.geocoder cancelGeocode];
    }
    
    [self.geocoder reverseGeocodeLocation:location
                        completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                       
               NSString *message = nil;
               
               if (error) {
                   message = [error localizedDescription];
               }
               else {
                   if (placemarks.count > 0) {
                       
                       CLPlacemark *placemark = [placemarks firstObject];
                       message = [NSString stringWithFormat:@"name = %@\n thoroughfare = %@\n subThoroughfare = %@\n locality = %@\n subLocality = %@\n       administrativeArea = %@\n subAdministrativeArea = %@\n postalCode = %@\n ISOcountryCode = %@\n country = %@\n inlandWater = %@\n ocean = %@\n areasOfInterest = %@\n", placemark.name, placemark.thoroughfare, placemark.subThoroughfare, placemark.locality, placemark.subLocality, placemark.administrativeArea, placemark.subAdministrativeArea, placemark.postalCode, placemark.ISOcountryCode, placemark.country, placemark.inlandWater, placemark.ocean, placemark.areasOfInterest];
                   }
                   else {
                       NSLog(@"No Placemarks Found");
                   }
               }
               
               [self showAlertWithTitle:@"Location" andMessage:message];
           }];
}

- (void)actionDirection:(UIButton *)sender {
    
    MKAnnotationView *annotationView = [sender superAnnotationView];
    
    if (!annotationView) {
        return;
    }
    
    if (self.direction.isCalculating) {
        [self.direction cancel];
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    MKDirectionsRequest *request = [MKDirectionsRequest new];
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate];
    
    request.destination = [[MKMapItem alloc] initWithPlacemark:placemark];
    
    request.transportType = MKDirectionsTransportTypeAny;
    request.requestsAlternateRoutes = YES;
    
    self.direction = [[MKDirections alloc] initWithRequest:request];
    
    [self.direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            [self showAlertWithTitle:@"Error" andMessage:[error localizedDescription]];
        }
        else if (response.routes == 0) {
            [self showAlertWithTitle:@"Error" andMessage:@"No routes found"];
        }
        else {
            [self.mapView removeOverlays:self.mapView.overlays];
            
            NSMutableArray *array = [NSMutableArray array];
            
            for (MKRoute *route in response.routes) {
                [array addObject:route.polyline];
            }
            
            [self.mapView addOverlays:array level:MKOverlayLevelAboveRoads];
        }
    }];
}

@end

