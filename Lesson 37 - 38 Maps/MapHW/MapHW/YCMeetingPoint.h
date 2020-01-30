//
//  YCMeetingPoint.h
//  MapHW
//
//  Created by Yuriy on 22.07.2019.
//  Copyright © 2019 Yuriy Chizh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKOverlay.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCMeetingPoint : NSObject <MKAnnotation, MKOverlay>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;
@property (nonatomic) MKMapRect boundingMapRect;

@end

NS_ASSUME_NONNULL_END
