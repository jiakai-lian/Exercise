//
//  UIViewController+AlertControllers.h
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertControllers)

-(void)showAlertWithTile:(NSString *)title andMessage:(NSString *)message withCancelActionTitle:(NSString *)cancelActionTitle andCancelActionHandler:(void (^)(UIAlertAction *action))cancelActionHandler;

@end
