//
//  JMSRandomViewController.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSRandomViewController.h"
#import "UIColor+UWExtensions.h"

@interface JMSRandomViewController ()

@end

@implementation JMSRandomViewController

- (instancetype)init
{
    return [super initWithColor:[UIColor uw_randomColor]];
}

@end
