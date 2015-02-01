//
//  NSDictionary+TimeStampAndContent.m
//  CQRS+EDA
//
//  Created by jiakai lian on 9/10/2014.
//

#import "NSDictionary+TimeStampAndContent.h"

@implementation NSDictionary (TimeStampAndContent)

- (instancetype)initWithTimeStamp:(NSDate *)timestamp AndContent:(id)content
{
    return [self initWithObjectsAndKeys:timestamp, TIMESTAMP, content, CONTENT, nil];
}

- (instancetype)initWithDefaultTimeStamp:(id)content
{
    return [self initWithTimeStamp:[NSDate new] AndContent:content];
}

- (id)content
{
    return [self objectForKey:CONTENT];
}

- (NSDate *)timestamp
{
    return [self objectForKey:TIMESTAMP];
}

@end
