//
//  NSDictionary+TimeStampAndContent.h
//  CQRS+EDA
//  dictionary with two key value pairs: timestamp and content
//  Created by jiakai lian on 9/10/2014.
//

#import <Foundation/Foundation.h>

static NSString *const CONTENT = @"content";
static NSString *const TIMESTAMP = @"timeStamp";


@interface NSDictionary (TimeStampAndContent)

- (instancetype)initWithTimeStamp:(NSDate *)timestamp AndContent:(id)content;

- (instancetype)initWithDefaultTimeStamp:(id)content;

- (id)content;

- (NSDate *)timestamp;

@end
