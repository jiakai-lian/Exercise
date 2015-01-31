//
//  SearchResponse.h
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Venue.h"

@interface SearchResponse : JSONModel

@property(nonatomic, strong) NSArray<Venue> * venues;



@end
