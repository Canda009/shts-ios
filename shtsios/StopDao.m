//
//  TraceDao.m
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//


#import "StopDAO.h"

@implementation StopDAO

static StopDAO *sharedManager = nil;

+ (StopDAO*)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        [sharedManager managedObjectContext];
        
    });
    return sharedManager;
}


//插入Note方法
-(int) create:(StopPoint*)model
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    Survey *stoppoint = [NSEntityDescription insertNewObjectForEntityForName:@"Survey" inManagedObjectContext:cxt];
    [stoppoint setValue: model.user forKey:@"user"];
    [stoppoint setValue: model.latitude forKey:@"latitude"];
    [stoppoint setValue: model.longitude forKey:@"longitude"];
    [stoppoint setValue: model.stop_time forKey:@"stoptime"];
    [stoppoint setValue: model.purpose forKey:@"purpose"];
    [stoppoint setValue: model.vehicle forKey:@"vehicle"];
    [stoppoint setValue: model.company_type forKey:@"companytype"];
    [stoppoint setValue: model.company_num forKey:@"companynum"];
    [stoppoint setValue: model.building forKey:@"building"];
    [stoppoint setValue: model.isvalid forKey:@"isvalid"];
    
    //    note.date = model.date;
    //    note.content = model.content;
    
    NSError *error = nil;
    if ([cxt hasChanges] && ![cxt save:&error]){
        //NSLog(@"插入数据失败:%@, %@", error, [error userInfo]);
        return -1;
    }
    return 0;
}


//按照主键查询数据方法
-(NSMutableArray*) findByStartDate:(NSDate*)startDate endDate:(NSDate *)endDate
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Survey" inManagedObjectContext:cxt];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = entity;
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat: @"stoptime >= %@ AND stoptime <= %@",startDate,endDate];
    
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    
    NSMutableArray *resListData = [[NSMutableArray alloc] init];
    
    for (Survey *mo in listData) {
        StopPoint *stoppoint = [[StopPoint alloc] initWithUser:mo.user latitude:mo.latitude longitude:mo.longitude stoptime:mo.stoptime purpose:mo.purpose vehicle:mo.vehicle companytype:mo.companytype companynum:mo.companynum building:mo.building isvalid:mo.isvalid];
        [resListData addObject:stoppoint];
    }
    
    return resListData;
}
-(NSMutableArray*) findByLatitude:(NSNumber*)latitude
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Survey" inManagedObjectContext:cxt];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = entity;
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat: @"latitude = %@",latitude];
    
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    
    NSMutableArray *resListData = [[NSMutableArray alloc] init];
    
    for (Survey *mo in listData) {
        StopPoint *stoppoint = [[StopPoint alloc] initWithUser:mo.user latitude:mo.latitude longitude:mo.longitude stoptime:mo.stoptime purpose:mo.purpose vehicle:mo.vehicle companytype:mo.companytype companynum:mo.companynum building:mo.building isvalid:mo.isvalid];
        [resListData addObject:stoppoint];
    }
    
    return resListData;
}



@end

