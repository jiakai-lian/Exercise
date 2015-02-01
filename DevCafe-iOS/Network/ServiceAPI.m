//
//  ServiceAPI.m
//  a class for sending out service api requests
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "ServiceAPI.h"

#import "NetworkConf.h"

@implementation ServiceAPI


+ (void)SearchCafesWithLat:(NSNumber *)lat andLng:(NSNumber *)lng success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    static NSString *const LAT_LNG = @"ll";
    NetworkConf *conf = [NetworkConf sharedManager];
    NSMutableDictionary *params = conf.params.mutableCopy;
    [params setObject:[[NSString alloc] initWithFormat:@"%@,%@", lat, lng] forKey:LAT_LNG];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:conf.rootURL
      parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSLog(@"JSON: %@", responseObject);
             success(operation, responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
        failure(operation, error);
    }];
}

@end
