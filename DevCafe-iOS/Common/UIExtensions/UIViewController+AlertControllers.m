//
//  UIViewController+AlertControllers.m
//  Alert category for UIViewController
//
//  Created by jiakai lian on 31/01/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "UIViewController+AlertControllers.h"

@implementation UIViewController (AlertControllers)

- (void)showAlertWithTile:(NSString *)title andMessage:(NSString *)message withCancelActionTitle:(NSString *)cancelActionTitle andCancelActionHandler:(void (^)(UIAlertAction *action))cancelActionHandler
{
    UIAlertController *alertController = [UIAlertController
            alertControllerWithTitle:title
                             message:message
                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction
            actionWithTitle:cancelActionTitle
                      style:UIAlertActionStyleCancel
                    handler:^(UIAlertAction *action)
                    {
                        NSLOG(@"Cancel action");
                        if (cancelActionHandler != nil)
                        {
                            cancelActionHandler(action);
                        }
                    }];

    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];

}

@end
