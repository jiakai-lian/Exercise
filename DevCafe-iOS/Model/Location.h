//
//  Location.h
//  Model object for Location
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Location : JSONModel

@property(nonatomic, strong) NSNumber *lat;
@property(nonatomic, strong) NSNumber *lng;
@property(nonatomic, strong) NSNumber *distance;
@property(nonatomic, strong) NSArray *formattedAddress;

@end
