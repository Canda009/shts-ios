//
//  StopPoint.h
//  shtsios
//
//  Created by cdj on 16/9/16.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StopPoint : NSObject
@property (nonatomic, strong) NSString *user;//用户名
@property (nonatomic, strong) NSNumber *latitude;//纬度
@property (nonatomic, strong) NSNumber *longitude;//经度
@property (nonatomic, strong) NSDate *stop_time;//停留时间
@property (nonatomic, strong) NSString *purpose;//目的
@property (nonatomic, strong) NSString *vehicle;//交通工具
@property (nonatomic, strong) NSString *company_type;//
@property (nonatomic, strong) NSString *company_num;//
@property (nonatomic, strong) NSString *building;//
@property (nonatomic, strong) NSString *isvalid;//是否有效



-(id)initWithUser:(NSString*)user
         latitude:(NSNumber*)latitude
        longitude:(NSNumber*)longitude
         stoptime:(NSDate*)stoptime
          purpose:(NSString*)purpose
          vehicle:(NSString*)vehicle
      companytype:(NSString*)companytype
       companynum:(NSString*)companynum
         building:(NSString*)building
          isvalid:(NSString*)isvalid;

@end
