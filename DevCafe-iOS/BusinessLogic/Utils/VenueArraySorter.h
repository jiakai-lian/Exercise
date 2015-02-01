//
//  VenueArraySorter.h
//  a utility class used to ordr an venue array
//
//  Created by jiakai lian on 1/02/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venue.h"

@interface VenueArraySorter : NSObject
//order a venue array by location.distance
+ (NSArray<Venue> *) SortVenuesByDistance:(NSArray<Venue> *)venues ascending:(BOOL) ascending;

@end
