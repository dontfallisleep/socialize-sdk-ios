//
//  SZDisplayOptions.m
//  SocializeSDK
//
//  Created by Brian Fallis on 6/27/13.
//  Copyright (c) 2013 A4 Labs Inc. All rights reserved.
//

#import "SZDisplayOptions.h"

@implementation SZDisplayOptions
@synthesize navBarBGImageName = navBarBGImageName_;
@synthesize normalCustomImageURI = normalCustomImageURI_;
@synthesize highlightCustomImageURI = highlightCustomImageURI_;
@synthesize backCustomImageURI = backCustomImageURI_;
@synthesize backHighlightCustomImageURI = backHighlightCustomImageURI_;
@synthesize likeIconCustomImage = likeIconCustomImage_;
@synthesize likedIconCustomImage = likedIconCustomImage_;
@synthesize likeCustomText = likeCustomText_;
@synthesize shareLikeCustomText = shareLikeCustomText_;
@synthesize customDefaultShareText = _customDefaultShareText;
@synthesize customTitleView = customTitleView_;

+ (id)defaultOptions {
    static SZDisplayOptions *sharedDefaultOptions = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDefaultOptions = [[self alloc] init];
    });
    return sharedDefaultOptions;
}

@end
