//
//  UIColor+UWExtensions.h
//  UW-iOS-HW2
//
//  Created by Tim Ekl on 5/25/13.
//  Copyright (c) 2013 Tim Ekl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UWExtensions)

+ (UIColor *)uw_randomColor;

//Added by Jared
+ (UIColor *)uw_invertColor:(UIColor *)color;

@end
