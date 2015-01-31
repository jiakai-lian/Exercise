//
//  SearchResponse.m
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "SearchResponse.h"

@implementation SearchResponse

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"response.venues": @"venues"
                                                       }];
}



@end
