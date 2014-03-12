//
//  UIView+AutoLayout.h
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout)

/**
 *  Create a new view that is Auto Layout friendly (Autoresizing Masks is set to NO)
 *
 *  @return The instance of view that was created
 */
+(instancetype)autoLayoutView;

@end
