//
//  NSObject+Notification.h
//  CQRS+EDA
//  simple event engine based on NSNotification
//  Created by jiakai lian on 9/10/2014.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+TimeStampAndContent.h"



//===========how to use
//===========register to the center when init or viewdidload

//NSString *notificationName = @"xxx";
//
//[[NSNotificationCenter defaultCenter]
// addObserver:self
// selector:@selector(responseToNotification:)
// name:notificationName
// object:nil];

//===========must deregister when dealloc
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}



@interface NSObject (Notification)

- (void) register:(SEL)selector name:(NSString *)notificationName;
- (void)postNotification:(NSString *)notificationName WithContent:(id)content;
- (void) deregister;
//- (void)responseToNotification:(NSNotification*)notification;

@end
