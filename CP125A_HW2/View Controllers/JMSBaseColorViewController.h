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

#pragma mark - API
/**
 *  Increments the displayCount property by 1
 */
- (void)incrementDisplayCount;

/**
 *  Resets the displayCount property to 0
 */
- (void)resetDisplayCount;

@end
