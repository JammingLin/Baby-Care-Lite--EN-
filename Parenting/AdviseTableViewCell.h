//
//  AdviseTableViewCell.h
//  Amoy Baby Care
//
//  Created by @Arvi@ on 13-9-26.
//  Copyright (c) 2013年 奥芬多. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviseTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *tipsImageView;
@property (strong, nonatomic) IBOutlet UILabel *tipsTitle;
@property (copy, nonatomic) NSString *tipsUrl;

@end
