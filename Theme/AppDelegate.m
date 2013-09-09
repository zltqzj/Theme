//
//  AppDelegate.m
//  Theme
//
//  Created by wei.chen on 13-5-20.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ThemeManager.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

//初始化主题
- (void)_initTheme {
    NSString *themeName = [[NSUserDefaults standardUserDefaults] objectForKey:kThemeName];
    if (themeName.length == 0) {
        return;
    }
    [ThemeManager shareInstance].themeName = themeName;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    //初始化主题
    [self _initTheme];
    
    self.window.rootViewController = [[[MainViewController alloc] init] autorelease];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
