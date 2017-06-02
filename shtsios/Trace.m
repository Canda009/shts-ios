//
//  Trace.m
//  shtsios
//
//  Created by cdj on 16/5/23.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "Trace.h"

@implementation Trace

-(id)initWithUser:(NSString *)user
         latitude:(NSNumber *)latitude
        longitude:(NSNumber *)longitude
        tracetime:(NSDate *)tracetime
         accuracy:(NSNumber *)accuracy
            speed:(NSNumber *)speed
         altitude:(NSNumber *)altitude
          bearing:(NSNumber *)bearing
            state:(NSString *)state {
    
    self = [super init];
    
    if (self) {
        self.user = user;
        self.latitude = latitude;
        self.longitude = longitude;
        self.tracetime = tracetime;
        self.accuracy = accuracy;
        self.speed = speed;
        self.altitude = altitude;
        self.bearing = bearing;
        self.state = state;
    }
    
    return self;
}

@end
