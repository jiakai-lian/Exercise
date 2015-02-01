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

@property(nonatomic, assign) double lat;
@property(nonatomic, assign) double lng;
@property(nonatomic, assign) long distance;
@property(nonatomic, strong) NSArray <Optional> *formattedAddress;

@end
