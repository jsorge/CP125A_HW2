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

#pragma mark - Init
- (instancetype)init
{
    return [super initWithColor:[UIColor uw_randomColor]];
}

#pragma mark - View Lifecycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self changeBackgroundColorToRandom];
}
@end
