//
//  RecordDao.m
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "RecordDAO.h"

@implementation RecordDAO

static RecordDAO *sharedManager = nil;

+ (RecordDAO*)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        [sharedManager managedObjectContext];
        
    });
    return sharedManager;
}


//插入Note方法
-(int) create:(Record*)model
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    RecordManagedObject *record = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:cxt];
    [record setValue: model.user forKey:@"user"];
    [record setValue: model.datestring forKey:@"datestring"];
    [record setValue: model.startlatitude forKey:@"startlatitude"];
    [record setValue: model.startlongitude forKey:@"startlongitude"];
    [record setValue: model.recordstarttime forKey:@"recordstarttime"];
    [record setValue: model.pointnum forKey:@"pointnum"];
    [record setValue: model.stopnum forKey:@"stopnum"];
    
  
    
    NSError *error = nil;
    if ([cxt hasChanges] && ![cxt save:&error]){
        NSLog(@"插入数据失败:%@, %@", error, [error userInfo]);
        return -1;
    }
    return 0;
}

//修改Note方法

-(int) modify:(Record*)model
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Record" inManagedObjectContext:cxt];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
     NSPredicate *predicate = [NSPredicate predicateWithFormat:
     @"datestring =  %@", model.datestring];
     [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:request error:&error];
    if ([listData count] > 0) {
       
        RecordManagedObject *record = [listData lastObject];
        //NSLog(@"查询到数据:%@, %@", record.stopnum, model.stopnum);
        record.stopnum = model.stopnum;
        
        error = nil;
        if ([cxt hasChanges] && ![cxt save:&error]){
            NSLog(@"修改数据失败:%@, %@", error, [error userInfo]);
            return -1;
        }
    }
    return 0;
}

//查询所有数据方法
-(NSMutableArray*) findAll
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Record" inManagedObjectContext:cxt];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = entity;
    /*
     NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
     NSArray *sortDescriptors = @[sortDescriptor];
     fetchRequest.sortDescriptors = sortDescriptors;
     */
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    
    NSMutableArray *resListData = [[NSMutableArray alloc] init];
    
    for (RecordManagedObject *mo in listData) {
        Record *record = [[Record alloc] initWithUser:mo.user datestring:mo.datestring startlatitude:mo.startlatitude startlongitude:mo.startlongitude recordstarttime:mo.recordstarttime pointnum:mo.pointnum stopnum:mo.stopnum];
        [resListData addObject:record];
    }
    
    return resListData;
}


//按照主键查询数据方法
/*
-(NSMutableArray*) findByStartDate:(NSDate*)startDate endDate:(NSDate *)endDate
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
    
    for (TraceManagedObject *mo in listData) {
        Trace *trace = [[Trace alloc] initWithRecord:mo.Record latitude:mo.latitude longitude:mo.longitude tracetime:mo.tracetime accuracy:mo.accuracy speed:mo.speed altitude:mo.altitude bearing:mo.bearing state:mo.state];
        [resListData addObject:trace];
    }
    
    return resListData;
}
*/

@end
