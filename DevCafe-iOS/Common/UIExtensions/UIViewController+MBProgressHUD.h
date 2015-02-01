//
//  UIViewController+MBProgressHUD.h
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBProgressHUD)

/**
 *  show a progress hud with a message
 *
 *  @param message message content
 */
- (void) showProgressHUD:(NSString *)message;

/**
 *  show a progress hud with no message
 */
- (void) showProgressHUD;

/**
 *  hide the showed hud
 */
- (void) hideProgressHUD;

@end
