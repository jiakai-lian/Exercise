//
//  Venue.h
//  Model object for Venue
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "Location.h"

@interface Venue : NSObject

@property(nonatomic, strong) NSString *venueId;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) Location *location;
@property(nonatomic, strong) Contact *contact;


@end
