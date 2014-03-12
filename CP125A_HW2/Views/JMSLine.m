//
//  JMSLine.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/16/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSLine.h"

@implementation JMSLine

- (void)drawRect:(CGRect)rect
{
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(0, 3.5)];
    [bezierPath addCurveToPoint: CGPointMake(320, 3.5) controlPoint1: CGPointMake(321.02, 3.5) controlPoint2: CGPointMake(320, 3.5)];
    [[UIColor blackColor] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
}

@end
