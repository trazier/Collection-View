//
//  UIColor+RandomColor.m
//  Homework2
//
//  Created by Frazier Moore on 2/25/14.
//  Copyright (c) 2014 Frazier Moore. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+(UIColor *) generateRandomColor
{
    CGFloat r,g,b;
    r = (float)arc4random_uniform(100)/100;
    g = (float)arc4random_uniform(100)/100;
    b = (float)arc4random_uniform(100)/100;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
