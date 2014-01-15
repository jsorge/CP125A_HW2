//
//  JMSBaseColorViewController.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/14/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSBaseColorViewController.h"

@interface JMSBaseColorViewController ()
@property (nonatomic, readwrite)NSUInteger displayCount;
@end

@implementation JMSBaseColorViewController

#pragma mark - API
- (void)incrementDisplayCount;
{
    self.displayCount += 1;
}

- (void)resetDisplayCount;
{
    self.displayCount = 0;
}

@end
