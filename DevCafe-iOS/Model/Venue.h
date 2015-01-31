//
//  Venue.h
//  Model object for Venue
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Contact.h"
#import "Location.h"

@interface Venue : JSONModel

@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) Location *location;
@property(nonatomic, strong) Contact *contact;


@end
