//
//  StopPoint.h
//  shtsios
//
//  Created by cdj on 16/9/16.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StopPoint : NSObject
@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSDate *stop_time;
@property (nonatomic, strong) NSString *purpose;
@property (nonatomic, strong) NSString *vehicle;
@property (nonatomic, strong) NSString *company_type;
@property (nonatomic, strong) NSString *company_num;
@property (nonatomic, strong) NSString *building;
@property (nonatomic, strong) NSString *isvalid;



-(id)initWithUser:(NSString*)user latitude:(NSNumber*)latitude longitude:(NSNumber*)longitude stoptime:(NSDate*)stoptime purpose:(NSString*)purpose vehicle:(NSString*)vehicle companytype:(NSString*)companytype companynum:(NSString*)companynum building:(NSString*)building isvalid:(NSString*)isvalid;

@end
