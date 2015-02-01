//
//  UITableView+Enhancement.m
//  DevCafe
//
//  Created by jiakai lian on 1/02/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "UITableView+Enhancement.h"

@implementation UITableView (Enhancement)

- (NSIndexPath *)getIndexPathByViewInCell:(UIView *)view
{
    CGPoint rootViewPoint = [[view superview] convertPoint:[view center] toView:self];
    NSIndexPath *indexPath = [self indexPathForRowAtPoint:rootViewPoint];
    NSLOG(@"%@", indexPath);
    return indexPath;
}


@end
