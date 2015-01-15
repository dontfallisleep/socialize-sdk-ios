//
//  SZCommentOptions.m
//  SocializeSDK
//
//  Created by Nathaniel Griswold on 5/23/12.
//  Copyright (c) 2012 Socialize, Inc. All rights reserved.
//

#import "SZCommentOptions.h"

@implementation SZCommentOptions
@synthesize dontSubscribeToNotifications = dontSubscribeToNotifications_;

+ (SZCommentOptions*)defaultOptions {
    static SZCommentOptions *sharedDefaultOptions = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDefaultOptions = [[self alloc] init];
    });
    return sharedDefaultOptions;
}

@end
