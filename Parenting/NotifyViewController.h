//
//  NotifyViewController.h
//  Amoy Baby Care
//
//  Created by @Arvi@ on 13-11-12.
//  Copyright (c) 2013年 奥芬多. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
    NSArray     *notifyArray;
}
@end
