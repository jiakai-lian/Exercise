//
//  UIViewController+MBProgressHUD.m
//  DevCafe
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController ()
@property(strong, nonatomic) MBProgressHUD *hud;
@end

@implementation UIViewController (MBProgressHUD)

//- (void)showProgressHUD:(NSString *)message
//{
//
//}

- (void)showProgressHUD
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideProgressHUD
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
