//
//  SocializeUnitTestApplication.m
//  SocializeSDK
//
//  Created by Isaac Mosquera on 9/13/11.
//  Copyright 2011 Socialize, Inc. All rights reserved.
//

#import "SocializeUnitTestApplication.h"
#import <GHUnitIOS/GHTestSuite.h>
#import <objc/runtime.h>

@implementation SocializeUnitTestApplication


#import "SZDummyLibSocialize.h"

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    [SZDummyLibSocialize class];
    [super applicationDidFinishLaunching:application];
}


@end