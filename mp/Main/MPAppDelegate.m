//
//  AppDelegate.m
//  mp
//
//  Created by admin on 2017/12/4.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MPAppDelegate.h"
#import "DKNightVersion.h"
#import "AFNetWorking.h"

@interface MPAppDelegate ()

@end

@implementation MPAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   //初始化夜间和白天
    NSInteger dayNight =[[[NSUserDefaults standardUserDefaults] objectForKey:@"DAY_NIGHT_MODE"] integerValue];
    if (dayNight == 0) {
        [[DKNightVersionManager sharedManager] dawnComing];
    }else{
        [[DKNightVersionManager sharedManager] nightFalling];
    }
  
   //角标置0
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    NSShadow *shadow = [NSShadow.alloc init];
    shadow.shadowColor = [UIColor clearColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:LHColor, NSForegroundColorAttributeName, shadow, NSShadowAttributeName, nil]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    [[UIToolbar appearance] setBackgroundImage:[[UIImage alloc]init] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UIToolbar appearance] setShadowImage:[[UIImage alloc]init] forToolbarPosition:UIBarPositionAny];
    
     NSLog(@"APP沙盒根目录:%@",NSHomeDirectory());
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    

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
