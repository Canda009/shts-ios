//
//  Trace.h
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trace : NSObject

@property (nonatomic, strong) NSString *user;//用户名
@property (nonatomic, strong) NSNumber *latitude;//纬度
@property (nonatomic, strong) NSNumber *longitude;//经度
@property (nonatomic, strong) NSDate *tracetime;//出行时长
@property (nonatomic, strong) NSString *state;//状态
@property (nonatomic, strong) NSNumber *speed;//速度
@property (nonatomic, strong) NSNumber *accuracy;//精确度
@property (nonatomic, strong) NSString *adcode;//
@property (nonatomic, strong) NSString *address;//地址
@property (nonatomic, strong) NSString *street;//街道
@property (nonatomic, strong) NSNumber *altitude;//海拔高度
@property (nonatomic, strong) NSNumber *type;//
@property (nonatomic, strong) NSNumber *bearing;//方位
@property (nonatomic, strong) NSString *floor;//
@property (nonatomic, strong) NSString *isvalid;//是否有效

-(id)initWithUser:(NSString*)user
         latitude:(NSNumber*)latitude
        longitude:(NSNumber*)longitude
        tracetime:(NSDate*)tracetime
         accuracy:(NSNumber*)accuracy
            speed:(NSNumber*)speed
         altitude:(NSNumber*)altitude
          bearing:(NSNumber*)bearing
            state:(NSString*)state;

@end
