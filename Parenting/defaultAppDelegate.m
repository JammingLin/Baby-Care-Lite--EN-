//
//  defaultAppDelegate.m
//  Parenting
//
//  Created by 爱摩信息科技 on 13-5-16.
//  Copyright (c) 2013年 家明. All rights reserved.
//

#import "defaultAppDelegate.h"
//#import <ShareSDK/ShareSDK.h>


@implementation defaultAppDelegate

NSUncaughtExceptionHandler* _uncaughtExceptionHandler = nil;
void UncaughtExceptionHandler(NSException *exception) {
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    NSString *syserror = [NSString stringWithFormat:@"mailto://amoycaretech@gmail.com?subject=Bug Report&body=Thank you for your coordination!<br><br><br>"
                          "Crash Detail:<br>%@<br>--------------------------<br>%@<br>---------------------<br>%@",
                          name,reason,[stackArray componentsJoinedByString:@"<br>"]];
    NSURL *url = [NSURL URLWithString:[syserror stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
    return;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [application setStatusBarStyle:UIStatusBarStyleLightContent];
        self.window.clipsToBounds =YES;
       // self.window.frame  = CGRectMake(0,20,self.window.frame.size.width,self.window.frame.size.height-20);
       // self.window.bounds = CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height);
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"timerOn"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"hastimerbefore" forKey:@"timerOnBefore"];
    }
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"userreviews"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"none" forKey:@"userreviews"];
        [[NSUserDefaults standardUserDefaults] setObject:[currentdate date] forKey:@"userstartuserdate"];
    }
    
    [self tap];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"btn_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,14, 0, 8)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackgroundImage:[[UIImage imageNamed:@"btn3.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackgroundImage:[[UIImage imageNamed:@"btn3.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_title.png"]  forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor],
                                                          UITextAttributeTextColor,
                                                          
                                                          [UIFont fontWithName:@"Arival-MTBOLD" size:20],
                                                
                                                UITextAttributeFont,
                                                          nil]];

    [self.window makeKeyAndVisible];

    _uncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);

    [MobClick startWithAppkey:UMENGAPPKEY];
    
    return YES;
}

-(void)tap
{
    homeViewController    = [[HomeViewController alloc] init];
    summaryViewController = [[SummaryViewController alloc] init];
    adviseViewController  = [[AdviseMasterViewController alloc] init];
    settingViewController = [[SettingViewController alloc] init];
    
    homeNavigationViewController    = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    summaryNavigationViewController = [[UINavigationController alloc] initWithRootViewController:summaryViewController];
    adviseNavigationViewController  = [[UINavigationController alloc] initWithRootViewController:adviseViewController];
    settingNavigationViewController = [[UINavigationController alloc] initWithRootViewController:settingViewController];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    [controllers addObject:homeNavigationViewController];
    [controllers addObject:summaryNavigationViewController];
    [controllers addObject:adviseNavigationViewController];
    [controllers addObject:settingNavigationViewController];
    
    
    TabbarController = [[MMXTabBarController alloc] init];
    [TabbarController setViewControllers:controllers];
    self.window.rootViewController  = TabbarController;
    
    //[ShareSDK registerApp:@"b0bf0698120"];
    //[self initializePlat];
    
}

- (void)initializePlat
{
    //添加新浪微博应用
    //[ShareSDK connectSinaWeiboWithAppKey:@"2712555917"
    //                           appSecret:@"c76318d478ffd11a81ee70b424f1b162"
    //                         redirectUri:@"http://open.weibo.com/apps/2712555917"];
        
    //添加Facebook应用
    //[ShareSDK connectFacebookWithAppKey:@"315050775296347"
    //                          appSecret:@"2504ebbdbb8c22bd482b905edaf4a16c"];
    
//    //添加腾讯微博应用
//    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
//                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
//                                redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加QQ空间应用
//    [ShareSDK connectQZoneWithAppKey:@"100371282"
//                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"];
//    
//    //添加网易微博应用
//    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
//                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
//                            redirectUri:@"http://www.shareSDK.cn"];
//    
//    //添加搜狐微博应用
//    [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
//                               consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
//                                  redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加豆瓣应用
//    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
//                            appSecret:@"e32896161e72be91"
//                          redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
//    
//    //添加人人网应用
//    [ShareSDK connectRenRenWithAppKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
//                            appSecret:@"f29df781abdd4f49beca5a2194676ca4"];
//    
//    //添加开心网应用
//    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
//                            appSecret:@"da32179d859c016169f66d90b6db2a23"
//                          redirectUri:@"http://www.sharesdk.cn/"];
//    
//    //添加Instapaper应用
//    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
//                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
//    
//    //添加有道云笔记应用
//    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
//                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
//                                   redirectUri:@"http://www.sharesdk.cn/"];
    
//    //添加Facebook应用
//    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
//                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
//    //添加Twitter应用
//    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
//                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
//                                redirectUri:@"http://www.sharesdk.cn"];
//    
//    //添加搜狐随身看应用
//    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
//                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
//                           redirectUri:@"http://sharesdk.cn"];
//    
//    //添加Pocket应用
//    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
//                               redirectUri:@"pocketapp1234"];
//    
//    //添加印象笔记应用
//    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
//                          consumerKey:@"sharesdk-7807"
//                       consumerSecret:@"d05bf86993836004"];
//    
//    //添加LinkedIn应用
//    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
//                              secretKey:@"cC7B2jpxITqPLZ5M"
//                            redirectUri:@"http://sharesdk.cn"];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"weather"]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"weather"];
    }
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    


}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"weather"]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"weather"];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{

    
    _uncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    //return [ShareSDK handleOpenURL:url
    //                    wxDelegate:self];
    return TRUE;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
//    return [ShareSDK handleOpenURL:url
//                 sourceApplication:sourceApplication
//                        annotation:annotation
//                        wxDelegate:self];
    return TRUE;
}

@end
