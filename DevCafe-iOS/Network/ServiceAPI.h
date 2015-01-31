//
//  ServiceAPI.h
//  a class for sending out service api requests
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface ServiceAPI : NSObject
+ (void) SearchCafesWithLat:(NSNumber *)lat andLng:(NSNumber *)lng success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
