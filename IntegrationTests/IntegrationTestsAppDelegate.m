//
//  SocializeAppDelegate.m
//  IntegrationTests
//
//  Created by Nathaniel Griswold on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "IntegrationTestsAppDelegate.h"
#import <Socialize/Socialize.h>
#import "IntegrationTestStatusViewControllerViewController.h"
#import "SZTestHelper.h"
#import "integrationtests_globals.h"

@implementation IntegrationTestsAppDelegate
@synthesize origToken = origToken_;
@synthesize status = status_;
- (void)dealloc
{
    self.origToken = nil;
    self.status = nil;
    [super dealloc];
}

- (void)testRunnerDidStart:(GHTestRunner *)runner {
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *serverURL = [[SocializeConfiguration sharedConfiguration] secureRestserverBaseURL];
    if ([serverURL startsWith:@"https://stage"]) {
        [Socialize storeConsumerKey:@"0a3bc7cd-c269-4587-8687-cd02db56d57f"];
        [Socialize storeConsumerSecret:@"8ee55515-4f1f-42ea-b25e-c4eddebf6c02"];    
    } else {
        [Socialize storeConsumerKey:@"bfa51814-c0a6-46cf-bdbe-9aa95c979ac1"];
        [Socialize storeConsumerSecret:@"e05707b5-a7c9-4a20-afa1-05e335ab5686"];
    }
//    [Socialize storeSocializeApiKey:@"976421bd-0bc9-44c8-a170-bd12376123a3" andSecret:@"2bf36ced-b9ab-4c5b-b054-8ca975d39c14"];
    [[Socialize sharedSocialize] removeAuthenticationInfo];
    [Socialize registerDeviceToken:nil];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert];

    [Socialize storeFacebookAppId:@"115622641859087"];

#if TARGET_IPHONE_SIMULATOR
    [[SZTestHelper sharedTestHelper] startMockingSucceedingLocation];
    [super applicationDidFinishLaunching:application];
#else
    [[UIApplication sharedApplication] setIdleTimerDisabled: YES];    
    self.status = [[IntegrationTestStatusViewControllerViewController alloc] init];
    window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window_ setRootViewController:self.status];
    [window_ makeKeyAndVisible];
#endif
    
    /*
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
     */
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{   
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [super applicationWillTerminate:application];
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSLog(@"Got token");
    self.origToken = deviceToken;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    NSLog(@"Failled to register: %@", [error localizedDescription]);
}

+ (NSData*)origToken {
    IntegrationTestsAppDelegate *appDelegate = (IntegrationTestsAppDelegate*)[[UIApplication sharedApplication] delegate];
    return [appDelegate origToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RemoteNotificationReceived" object:userInfo];
}


@end
