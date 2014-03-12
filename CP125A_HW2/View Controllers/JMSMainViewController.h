//
//  JMSMainViewController.h
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JMSRedViewController;
@class JMSGreenViewController;
@class JMSBlueViewController;
@class JMSCustomViewController;
@class JMSRandomViewController;

@interface JMSMainViewController : UIViewController
@property (strong, nonatomic)JMSRedViewController *redVC;
@property (strong, nonatomic)JMSGreenViewController *greenVC;
@property (strong, nonatomic)JMSBlueViewController *blueVC;
@property (strong, nonatomic)JMSCustomViewController *customVC;
@property (strong, nonatomic)JMSRandomViewController *randomVC;
@end
