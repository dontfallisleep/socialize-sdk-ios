//
//  SZDisplayOptions.h
//  SocializeSDK
//
//  Created by Brian Fallis on 5/24/12.
//  Copyright (c) 2013 A4 Labs Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocializeCommonDefinitions.h"
#import "SZSocialNetworkPostData.h"

@interface SZDisplayOptions : NSObject

+ (id)defaultOptions;

@property (nonatomic, strong) NSString *navBarBGImageName;
@property (nonatomic, strong) NSString *normalCustomImageURI;
@property (nonatomic, strong) NSString *highlightCustomImageURI;
@property (nonatomic, strong) NSString *backCustomImageURI;
@property (nonatomic, strong) NSString *backHighlightCustomImageURI;
@property (nonatomic, strong) NSString *likeIconCustomImage;
@property (nonatomic, strong) NSString *likedIconCustomImage;
@property (nonatomic, strong) NSString *likeCustomText;
@property (nonatomic, strong) NSString *shareLikeCustomText;
@property (nonatomic, strong) NSString *customDefaultShareText;
@property (nonatomic, strong) UILabel *customTitleView;


@end
