//
//  AdviseTableViewCell.m
//  Amoy Baby Care
//
//  Created by @Arvi@ on 13-9-26.
//  Copyright (c) 2013年 奥芬多. All rights reserved.
//

#import "AdviseTableViewCell.h"

@implementation AdviseTableViewCell
@synthesize tipsTitle;
@synthesize tipsImageView;

-(void)layoutSubviews

{
    
    [super layoutSubviews];
    
    [self.imageView setFrame:CGRectMake(15, 15, 100, 60)];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
}

@end
