//
//  LocationHandler.h
//  A hanlder class used to handle location updates
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationHandler : NSObject <CLLocationManagerDelegate>


@property(readonly,strong,nonatomic) CLLocationManager *locationManager;
@property(readonly,strong,nonatomic) CLLocation *location;

@end
