//
//  UINavigationBar+TitleTextColor.m
//  Layout_Nav_Demo
//
//  Created by Albert Chu on 13-11-5.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "UINavigationBar+TitleTextColor.h"

@implementation UINavigationBar (TitleTextColor)

- (void)doSetTitleTextColorBy:(UIColor *)theColor
{
    NSDictionary *navBarTitleTextAttributes =
    [NSDictionary dictionaryWithObjectsAndKeys:
     
     // 形参
     theColor,
     
     NSForegroundColorAttributeName,
     nil];
    
    [self setTitleTextAttributes:navBarTitleTextAttributes];
}

@end
