//
//  TraceDao.h
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "CoreDataDAO.h"
#import "Trace.h"
#import "TraceManagedObject.h"

@interface TraceDAO : CoreDataDAO


+ (TraceDAO*)sharedManager;

//插入Note方法
-(int) create:(Trace*)model;

//删除Note方法
//-(int) remove:(Trace*)model;

//修改Note方法
//-(int) modify:(Trace*)model;

//查询所有数据方法
//-(NSMutableArray*) findAll;

//按照主键查询数据方法
-(NSMutableArray*) findByStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;

@end
