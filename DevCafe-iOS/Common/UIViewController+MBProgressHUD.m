//
//  UIViewController+MBProgressHUD.m
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController()
@property (strong,nonatomic) MBProgressHUD *hud;
@end

@implementation UIViewController (MBProgressHUD)

- (void) showProgressHUD:(NSString *)message
{
    self.hud= [[MBProgressHUD alloc] initWithView:self.view];
    self.hud.labelText = message;
    self.hud.mode = MBProgressHUDModeIndeterminate;
    [self.view addSubview:self.hud];
    [self.hud show:YES];

}

- (void) showProgressHUD
{
    [self showProgressHUD:nil];
}

- (void) hideProgressHUD
{
   [self.hud hide:YES];
    
    //set to nil to release the object
    self.hud = nil;
}

@end
