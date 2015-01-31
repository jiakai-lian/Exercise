//
//  LocationHandler.m
//  A hanlder class used to handle location updates
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "LocationHandler.h"
#import "VersionChecking.h"

@implementation LocationHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
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
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    _location = [locations lastObject];
    NSLog(@"lat%f - lon%f", _location.coordinate.latitude, _location.coordinate.longitude);
}

@end
