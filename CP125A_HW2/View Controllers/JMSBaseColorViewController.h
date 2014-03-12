//
//  JMSBaseColorViewController.h
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/14/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+UWExtensions.h"

@interface JMSBaseColorViewController : UIViewController
@property (nonatomic, readonly)NSUInteger displayCount;
@property (strong, nonatomic)UIColor *backgroundColor;

#pragma mark - API
/**
 *  Creates the view controller with a given color
 *
 *  @param color The color to be used for the background of the view controller
 *
 *  @return An instance of this class
 */
- (instancetype)initWithColor:(UIColor *)color;

/**
 *  Resets the displayCount property to 0
 */
- (void)resetDisplayCount;

/**
 *  Changes the background color of the view to the given color.
 *
 *  @param color The new background color
 */
- (void)changeBackgroundColorToColor:(UIColor *)color;

@end
