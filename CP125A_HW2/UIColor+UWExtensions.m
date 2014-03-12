//
//  UIColor+UWExtensions.m
//  UW-iOS-HW2
//
//  Created by Tim Ekl on 5/25/13.
//  Copyright (c) 2013 Tim Ekl. All rights reserved.
//

#import "UIColor+UWExtensions.h"

@implementation UIColor (UWExtensions)

+ (UIColor *)uw_randomColor;
{
    CGFloat red = (float)arc4random_uniform(256) / 256.0f;
    CGFloat green = (float)arc4random_uniform(256) / 256.0f;
    CGFloat blue = (float)arc4random_uniform(256) / 256.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

//Added by Jared
+ (UIColor *)uw_invertColor:(UIColor *)color
{
    const CGFloat *componentColors = CGColorGetComponents(color.CGColor);
    
    UIColor *newColor = [[UIColor alloc] initWithRed:(1.0 - componentColors[0])
                                               green:(1.0 - componentColors[1])
                                                blue:(1.0 - componentColors[2])
                                               alpha:componentColors[3]];
    
    return newColor;
}

@end
