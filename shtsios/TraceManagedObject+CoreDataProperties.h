//
//  TraceManagedObject+CoreDataProperties.h
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TraceManagedObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface TraceManagedObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *user;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSDate *tracetime;
@property (nullable, nonatomic, retain) NSString *state;
@property (nullable, nonatomic, retain) NSNumber *speed;
@property (nullable, nonatomic, retain) NSNumber *accuracy;
@property (nullable, nonatomic, retain) NSString *adcode;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *street;
@property (nullable, nonatomic, retain) NSNumber *altitude;
@property (nullable, nonatomic, retain) NSNumber *type;
@property (nullable, nonatomic, retain) NSNumber *bearing;
@property (nullable, nonatomic, retain) NSString *floor;
@property (nullable, nonatomic, retain) NSString *isvalid;

@end

NS_ASSUME_NONNULL_END
