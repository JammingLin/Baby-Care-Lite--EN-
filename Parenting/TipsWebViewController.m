//
//  TipsWebViewController.m
//  Amoy Baby Care
//
//  Created by @Arvi@ on 13-11-6.
//  Copyright (c) 2013年 奥芬多. All rights reserved.
//

#import "TipsWebViewController.h"
#import "CustomURLCache.h"
#import "MBProgressHUD.h"
@interface TipsWebViewController ()

@end

@implementation TipsWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        CustomURLCache *urlCache = [[CustomURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024
//                                                                     diskCapacity:200 * 1024 * 1024
//                                                                         diskPath:nil
//                                                                        cacheTime:0];
//        [CustomURLCache setSharedURLCache:urlCache];
        // Custom initialization
        self.hidesBottomBarWhenPushed=YES;
        //self.automaticallyAdjustsScrollViewInsets = NO;
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
        if ( IOS7_OR_LATER )
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = NO;
            self.modalPresentationCapturesStatusBarAppearance = NO;
        }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    count = 0;
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+64)];
    [self.webView setScalesPageToFit:YES];
    self.webView.delegate = self;
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    if (urlRequest) {
        [self.webView loadRequest:urlRequest];
    }

    [self.view addSubview:self.webView];

    // Do any additional setup after loading the view from its nib.
}

-(void)setTipsUrl:(NSString*)requestUrl
{
    _url = requestUrl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   // CustomURLCache *urlCache = (CustomURLCache *)[NSURLCache sharedURLCache];
    //[urlCache removeAllCachedResponses];
}

#pragma mark - webview

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if (count < 5) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.alpha = 0.5;
        hud.labelText = @"Loading...";
        count++;
    }
}

@end
