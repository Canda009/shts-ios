//
//  PlistDao.h
//  shtsios
//
//  Created by cdj on 16/2/29.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistDao : NSObject
+(PlistDao*)sharedManager;

@property(nonatomic,strong) NSMutableArray* listData;
-(int) create:(NSString*)key withvalue:(NSString*)value;
-(void)createEditableCopyOfDatabaseIfNeeded;
-(NSString *)applicationDocumentDirectoryFile;

@end
