//
//  NotifyItem.h
//  Amoy Baby Care
//
//  Created by @Arvi@ on 13-11-12.
//  Copyright (c) 2013年 奥芬多. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotifyItem : NSObject
@property int notifyid;
@property int status;
@property(nonatomic,strong)NSDate *notify_time;
@property(nonatomic,strong)NSString *content;
@end
