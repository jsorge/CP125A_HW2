//
//  UIView+AutoLayout.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)
+(instancetype)autoLayoutView;
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}
@end
