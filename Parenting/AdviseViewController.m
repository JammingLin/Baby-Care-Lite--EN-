//
//  AdviseViewController.m
//  Parenting
//
//  Created by 家明 on 13-5-17.
//  Copyright (c) 2013年 家明. All rights reserved.
//

#import "AdviseViewController.h"

@interface AdviseViewController ()

@end

@implementation AdviseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title  = NSLocalizedString(@"btnadvise", nil);
    }
    return self;
}
-(void)setting
{
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_title.png"] forBarMetrics:UIBarMetricsDefault];
    [self.view setBackgroundColor:[UIColor colorWithRed:239.0/255 green:239.0/255 blue:239.0/255 alpha:1]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setting];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
