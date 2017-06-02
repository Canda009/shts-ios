//
//  Record.h
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject
@property (nonatomic, strong) NSString *user;//用户名
@property (nonatomic, strong) NSNumber *startlatitude;//起点纬度
@property (nonatomic, strong) NSNumber *startlongitude;//起点经度
@property (nonatomic, strong) NSNumber *endlatitude;//终点纬度
@property (nonatomic, strong) NSNumber *endlongitude;//终点经度
@property (nonatomic, strong) NSDate *recordstarttime;//纪录开始时间
@property (nonatomic, strong) NSDate *recordendtime;//纪录结束时间
@property (nonatomic, strong) NSString *datestring;//
@property (nonatomic, strong) NSNumber *avgsped;//用户名
@property (nonatomic, strong) NSNumber *distance;//出行距离
@property (nonatomic, strong) NSNumber *stopnum;//
@property (nonatomic, strong) NSNumber *pointnum;//
@property (nonatomic, strong) NSString *startaddress;//起点地址
@property (nonatomic, strong) NSString *endaddress;//终点地址

-(id)initWithUser:(NSString*)user
       datestring:(NSString*)datestring
    startlatitude:(NSNumber*)startlatitude
   startlongitude:(NSNumber*)startlongitude
  recordstarttime:(NSDate*)starttime
         pointnum:(NSNumber*)pointnum
          stopnum:(NSNumber*)stopnum;
@end
