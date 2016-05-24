//
//  RecordManagedObject+CoreDataProperties.h
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RecordManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecordManagedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *user;
@property (nullable, nonatomic, retain) NSNumber *startlatitude;
@property (nullable, nonatomic, retain) NSNumber *startlongitude;
@property (nullable, nonatomic, retain) NSNumber *endlatitude;
@property (nullable, nonatomic, retain) NSNumber *endlongitude;
@property (nullable, nonatomic, retain) NSDate *recordstarttime;
@property (nullable, nonatomic, retain) NSDate *recordendtime;
@property (nullable, nonatomic, retain) NSString *datestring;
@property (nullable, nonatomic, retain) NSNumber *avgsped;
@property (nullable, nonatomic, retain) NSNumber *distance;
@property (nullable, nonatomic, retain) NSNumber *stopnum;
@property (nullable, nonatomic, retain) NSNumber *pointnum;
@property (nullable, nonatomic, retain) NSString *startaddress;
@property (nullable, nonatomic, retain) NSString *endaddress;

@end

NS_ASSUME_NONNULL_END
