//
//  NSObject+Notification.m
//  CQRS+EDA
//
//  Created by jiakai lian on 9/10/2014.
//

#import "NSObject+Notification.h"

@implementation NSObject (Notification)

- (void) register:(SEL)selector name:(NSString *)notificationName
{
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:selector
     name:notificationName
     object:nil];
}

- (void)postNotification:(NSString *)notificationName WithContent:(id)content//post notification method and logic
{
    NSDictionary *dictionary = [[NSDictionary alloc]initWithDefaultTimeStamp:content];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:dictionary];
}

//- (void) responseToSampleNotificationInViewController:(NSNotification*)notification
//{
//    NSDictionary *dictionary = [notification userInfo];
//    NSString *content = [dictionary content];
//    
//}

- (void) deregister
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
