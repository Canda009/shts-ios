//
//  Survey+CoreDataProperties.h
//  shtsios
//
//  Created by cdj on 16/9/16.
//  Copyright © 2016年 itiis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Survey.h"

NS_ASSUME_NONNULL_BEGIN

@interface Survey (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *building;
@property (nullable, nonatomic, retain) NSString *companynum;
@property (nullable, nonatomic, retain) NSString *companytype;
@property (nullable, nonatomic, retain) NSString *isvalid;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSString *purpose;
@property (nullable, nonatomic, retain) NSDate *stoptime;
@property (nullable, nonatomic, retain) NSString *user;
@property (nullable, nonatomic, retain) NSString *vehicle;

@end

NS_ASSUME_NONNULL_END
