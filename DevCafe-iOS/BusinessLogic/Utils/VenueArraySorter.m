//
//  VenueArraySorter.m
//  a utility class used to ordr an venue array
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

        if (ascending)
        {
            //ordered from the near to the distant
            return (distanceA > distanceB);
        }
        else
        {
            //ordered from the distant to the near
            return !(distanceA > distanceB);
        }
    }];
}

@end
