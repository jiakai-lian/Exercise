//
//  LocationHandler.m
//  A hanlder class used to handle location updates
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "LocationHandler.h"

@implementation LocationHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        //init location manager
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = 30.0f;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [_locationManager startUpdatingLocation];
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        {
            [_locationManager requestWhenInUseAuthorization];
        }

    }
    return self;
}

#pragma update Location
/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    _location = [locations lastObject];
    NSLog(@"lat%f - lon%f", _location.coordinate.latitude, _location.coordinate.longitude);
    
    [self postNotification:LOCATION_CHANGED_NOTIFICATION WithContent:
     @{
       @"lat": [[NSNumber alloc] initWithDouble:_location.coordinate.latitude],
       @"lng": [[NSNumber alloc] initWithDouble:_location.coordinate.longitude]
       }];
}

@end
