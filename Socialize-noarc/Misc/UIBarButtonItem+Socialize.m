//
//  UIBarButtonItem+Socialize.m
//  SocializeSDK
//
//  Created by Nathaniel Griswold on 5/29/12.
//  Copyright (c) 2012 Socialize, Inc. All rights reserved.
//

#import "UIBarButtonItem+Socialize.h"
#import "socialize_globals.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@implementation UIBarButtonItem (Socialize)

- (void)changeTitleOnCustomButtonToText:(NSString*)text {
    UIButton *button = (UIButton*)[self customView];
    if ([button isKindOfClass:[UIButton class]]) {
        [button configureWithTitle:text];
    }
}

- (void)changeTitleOnCustomButtonToText:(NSString*)text type:(AMSocializeButtonType)type {
    UIButton *button = (UIButton*)[self customView];
    if ([button isKindOfClass:[UIButton class]]) {
        [button configureWithTitle:text type:type];
    }
}

+ (UIBarButtonItem*)redSocializeBarButtonWithTitle:(NSString*)title handler:(void(^)(id sender))handler {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        UIButton *button = [UIButton redSocializeNavBarButtonWithTitle:title];
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
        
        return [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    }
    else {
           UIButton *button = [UIButton redSocializeNavBarButtonWithTitle:title];
            [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
            [[button titleLabel] setFont:[UIFont fontWithName:@"Lato-Bold" size:14.0]];
            [button setContentEdgeInsets:UIEdgeInsetsMake(0.0, -20.0, 0.0, 0.0)];
        
            UIBarButtonItem *barButton = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
        
        return barButton;
    }
}

+ (UIBarButtonItem*)blueSocializeBarButtonWithTitle:(NSString*)title handler:(void(^)(id sender))handler {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        
        UIButton *button = [UIButton blueSocializeNavBarButtonWithTitle:title];
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
        return [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    }
    else {
           UIButton *button = [UIButton blueSocializeNavBarButtonWithTitle:title];
        [[button titleLabel] setFont:[UIFont fontWithName:@"Lato-Bold" size:14.0]];
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
        [button setContentEdgeInsets:UIEdgeInsetsMake(0.0, 20.0, 0.0, 0.0)];
        UIBarButtonItem *barButton = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
        
        return barButton;
    }
}


@end
