//
//  VenueArraySorter.m
//  a utility class used to order an venue array
//
//  Created by jiakai lian on 1/02/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "VenueArraySorter.h"


@implementation VenueArraySorter

+ (NSArray <Venue> *)SortVenuesByDistance:(NSArray <Venue> *)venues ascending:(BOOL)ascending
{
    return (NSArray <Venue> *) [venues sortedArrayUsingComparator:^NSComparisonResult(id a, id b)
    {
        long distanceA = ((Venue *) a).location.distance;
        long distanceB = ((Venue *) b).location.distance;

        if(distanceA == distanceB)
        {
            return NSOrderedSame;
        }
        else if(ascending)
        {
            return (distanceA > distanceB)?NSOrderedDescending:NSOrderedAscending;
        }
        else
        {
            return (distanceA < distanceB)?NSOrderedDescending:NSOrderedAscending;
        }
    }];
}

@end
