//
//  RecordDao.h
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "CoreDataDAO.h"
#import "Record.h"
#import "RecordManagedObject.h"

@interface RecordDAO : CoreDataDAO


+ (RecordDAO*)sharedManager;

//插入Note方法
-(int) create:(Record*)model;



//修改Note方法
-(int) modify:(Record*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

//按照主键查询数据方法
-(BOOL) findByDateString:(NSString*)dateString;
@end