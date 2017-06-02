//
//  TraceDao.m
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//


#import "TraceDAO.h"

@implementation TraceDAO

static TraceDAO *sharedManager = nil;

+ (TraceDAO*)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        [sharedManager managedObjectContext];
        
    });
    return sharedManager;
}


//插入Note方法
-(int) create:(Trace*)model
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    TraceManagedObject *trace = [NSEntityDescription insertNewObjectForEntityForName:@"Trace" inManagedObjectContext:cxt];
    [trace setValue: model.user forKey:@"user"];//用户
    [trace setValue: model.latitude forKey:@"latitude"];//纬度
    [trace setValue: model.longitude forKey:@"longitude"];//经度
    [trace setValue: model.tracetime forKey:@"tracetime"];//出行时间
    [trace setValue: model.state forKey:@"state"];//状态
    [trace setValue: model.speed forKey:@"speed"];//速度
    [trace setValue: model.accuracy forKey:@"accuracy"];//精确度
    [trace setValue: model.altitude forKey:@"altitude"];//海拔高度
    [trace setValue: model.bearing forKey:@"bearing"];//方位
    
    //    note.date = model.date;
    //    note.content = model.content;
    
    NSError *error = nil;
    if ([cxt hasChanges] && ![cxt save:&error]){  //若内容有变化并且没有错误抛出则表明插入成功
        //NSLog(@"插入数据失败:%@, %@", error, [error userInfo]);
        return -1;
    }
    return 0;
}


//按照主键查询数据方法－－查找路径轨迹
-(NSMutableArray*) findByStartDate:(NSDate*)startDate endDate:(NSDate *)endDate //根据开始时间和结束时间来查询
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Trace" inManagedObjectContext:cxt];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = entity;
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat: @"tracetime >= %@ AND tracetime <= %@",startDate,endDate];
    
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    
    NSMutableArray *resListData = [[NSMutableArray alloc] init];
    
    for (TraceManagedObject *mo in listData) { //循环将查询结果中的各点的参数赋值给路径对象
        Trace *trace = [[Trace alloc] initWithUser:mo.user
                                          latitude:mo.latitude
                                         longitude:mo.longitude
                                         tracetime:mo.tracetime
                                          accuracy:mo.accuracy
                                             speed:mo.speed
                                          altitude:mo.altitude
                                           bearing:mo.bearing
                                             state:mo.state];
        [resListData addObject:trace];
    }
    
    return resListData;
}



@end

