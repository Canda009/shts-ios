//
//  Record.h
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject
@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSNumber *startlatitude;
@property (nonatomic, strong) NSNumber *startlongitude;
@property (nonatomic, strong) NSNumber *endlatitude;
@property (nonatomic, strong) NSNumber *endlongitude;
@property (nonatomic, strong) NSDate *recordstarttime;
@property (nonatomic, strong) NSDate *recordendtime;
@property (nonatomic, strong) NSString *datestring;
@property (nonatomic, strong) NSNumber *avgsped;
@property (nonatomic, strong) NSNumber *distance;
@property (nonatomic, strong) NSNumber *stopnum;
@property (nonatomic, strong) NSNumber *pointnum;
@property (nonatomic, strong) NSString *startaddress;
@property (nonatomic, strong) NSString *endaddress;

-(id)initWithUser:(NSString*)user datestring:(NSString*)datestring startlatitude:(NSNumber*)startlatitude startlongitude:(NSNumber*)startlongitude recordstarttime:(NSDate*)starttime pointnum:(NSNumber*)pointnum stopnum:(NSNumber*)stopnum;
@end
