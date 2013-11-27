//
//  defaultAppDelegate.h
//  Parenting
//
//  Created by 爱摩信息科技 on 13-5-16.
//  Copyright (c) 2013年 家明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"
#import "AdviseViewController.h"
#import "SummaryViewController.h"
#import "HomeViewController.h"
#import "AdviseMasterViewController.h"

#import "MMXTabBarController.h"



@class defaultViewController;
@interface defaultAppDelegate : UIResponder <UIApplicationDelegate>
{
    MMXTabBarController         *TabbarController;
    SettingViewController       *settingViewController;
    AdviseMasterViewController  *adviseViewController;
    SummaryViewController       *summaryViewController;
    HomeViewController          *homeViewController;
    
    UINavigationController *settingNavigationViewController;
    UINavigationController *adviseNavigationViewController;
    UINavigationController *summaryNavigationViewController;
    UINavigationController *homeNavigationViewController;

  
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) defaultViewController *viewController;

@end
