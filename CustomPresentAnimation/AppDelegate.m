//
//  AppDelegate.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/22.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "AppDelegate.h"
#import "CPAPresentingViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *rootNavigationController;

@end

@implementation AppDelegate


- (UINavigationController *)rootNavigationController {
    if (!_rootNavigationController) {
        CPAPresentingViewController *viewController = [CPAPresentingViewController new];
        _rootNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    }
    
    return _rootNavigationController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = self.rootNavigationController;
    
    return YES;
}


@end
