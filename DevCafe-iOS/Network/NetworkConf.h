//
// Created by jiakai lian on 31/01/15.
// Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetworkConf : NSObject

@property(nonatomic, strong, readonly) NSString *rootURL;
@property(nonatomic, strong, readonly) NSDictionary *params;//static parameters of the request

+ (id)sharedManager;

//- (NSString *) getSearchURLWithLat:(NSNumber *)lat andLng:(NSNumber *)lng;

@end