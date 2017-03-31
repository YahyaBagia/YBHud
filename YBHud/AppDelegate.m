//
//  AppDelegate.m
//  YBHud
//
//  Created by Yahya on 03/02/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h" 

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.rootViewController = [ViewController new];
    [_window makeKeyAndVisible];
    return YES;
}

@end
