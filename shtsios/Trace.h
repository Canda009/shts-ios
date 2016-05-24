//
//  Trace.h
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trace : NSObject

@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSDate *tracetime;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSNumber *speed;
@property (nonatomic, strong) NSNumber *accuracy;
@property (nonatomic, strong) NSString *adcode;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSNumber *altitude;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *bearing;
@property (nonatomic, strong) NSString *floor;
@property (nonatomic, strong) NSString *isvalid;

-(id)initWithUser:(NSString*)user latitude:(NSNumber*)latitude longitude:(NSNumber*)longitude tracetime:(NSDate*)tracetime accuracy:(NSNumber*)accuracy speed:(NSNumber*)speed altitude:(NSNumber*)altitude bearing:(NSNumber*)bearing state:(NSString*)state;

@end
