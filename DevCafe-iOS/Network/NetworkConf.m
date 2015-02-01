//
// Created by jiakai lian on 31/01/15.
// Copyright (c) 2015 jiakai. All rights reserved.
//

#import "NetworkConf.h"

@interface NetworkConf ()
//@property (nonatomic, strong) NSMutableDictionary *confDic;

@end

@implementation NetworkConf

@synthesize rootURL = _rootURL;
@synthesize params = _params;

//const strings for keys in ProjectConf.plist
static NSString const *ROOT_URL = @"root_url";
//static NSString const * QUERY= @"query";
//static NSString const * CLIENT_SECRET= @"client_secret";
//static NSString const * CLIENT_ID= @"client_id";
//static NSString const * Version= @"v";
//static NSString const * RADIUS= @"radius";

/**
 *  create an instance
 *
 *  @return return an shared object instance
 */
+ (id)sharedManager
{
    static NetworkConf *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

/**
 *  init the object with a property list
 *
 *  @return an initialized object reference
 */
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //read all the configuration from plist
        NSMutableDictionary *confDic = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NetworkConf" ofType:@"plist"]];

        _rootURL = [confDic objectForKey:ROOT_URL];//get root url
        [confDic removeObjectForKey:ROOT_URL];//remove the url from dictionary
        _params = confDic.copy;//get a copy dic of the rest of params
    }
    return self;
}

//- (NSString *) getSearchURLWithLat:(NSNumber *)lat andLng:(NSNumber *)lng
//{
//    NSString * rootURL= [self.confDic objectForKey:@"root_url"];
//    return [[NSString alloc] initWithFormat:@"%@",];
//}


@end


