//
//  AppDelegate.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/25.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewC1.h"
#import "ViewC2.h"
#import "ViewC3.h"
#import "ViewC4.h"
#import "ViewC5.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //显示window
    [self.window makeKeyAndVisible];
    

    ViewC1 *vcFirst = [[ViewC1 alloc] init];
    ViewC2 *vcSecond = [[ViewC2 alloc] init];
    ViewC3 *vcThird = [[ViewC3 alloc] init];
    ViewC4 *vcFourth = [[ViewC4 alloc] init];
    ViewC5 *vcFifth = [[ViewC5 alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vcFirst];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vcSecond];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vcThird];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vcFourth];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vcFifth];
    
   /* vcFirst.title = @"发现";
    vcSecond.title = @"视频";
    vcThird.title = @"我的";
    vcFourth.title = @"朋友";
    vcFifth.title = @"账号";*/
    
    vcFifth.view.backgroundColor = [UIColor whiteColor];
    vcSecond.view.backgroundColor = [UIColor whiteColor];
    vcThird.view.backgroundColor = [UIColor whiteColor];
    vcFirst.view.backgroundColor = [UIColor whiteColor];
    vcFourth.view.backgroundColor = [UIColor whiteColor];
    
    
    UITabBarController *tbController = [[UITabBarController alloc] init];
    
    tbController.view.tintColor = [UIColor redColor];
    
    NSArray* arrayVc = [[NSMutableArray alloc] initWithObjects:nav1, nav2, nav3,  nav4, nav5, nil];
    //NSArray *arrayVC = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5 nil];
    
    tbController.viewControllers = arrayVc;
    
    self.window.rootViewController = tbController;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
