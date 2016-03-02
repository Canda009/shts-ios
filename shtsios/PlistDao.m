//
//  PlistDao.m
//  shtsios
//
//  Created by cdj on 16/2/29.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "PlistDao.h"

@implementation PlistDao
static PlistDao *sharedManager = nil;
+(PlistDao*)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedManager = [[self alloc] init];
        sharedManager.listData =[[NSMutableArray alloc] init];
        
    });
    return sharedManager;
}

@end
