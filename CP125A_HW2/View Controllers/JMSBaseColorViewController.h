//
//  JMSBaseColorViewController.h
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/14/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMSBaseColorViewController : UIViewController
@property (nonatomic, readonly)NSUInteger displayCount;
@property (strong, nonatomic)UIButton *dismissButton;
@property (strong, nonatomic)UIColor *backgroundColor;

#pragma mark - API
/**
 *  Increments the displayCount property by 1
 */
- (void)incrementDisplayCount;

/**
 *  Resets the displayCount property to 0
 */
- (void)resetDisplayCount;

/**
 *  Creates the view controller with a given color
 *
 *  @param color The color to be used for the background of the view controller
 *
 *  @return An instance of this class
 */
- (instancetype)initWithColor:(UIColor *)color;

/**
 *  Changes the background color of the view to the given color.
 *
 *  @param color The new background color
 */
- (void)changeBackgroundColorToColor:(UIColor *)color;
@end
