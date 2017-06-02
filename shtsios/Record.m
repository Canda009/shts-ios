//
//  Record.m
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "Record.h"

@implementation Record
-(id)initWithUser:(NSString *)user
       datestring:(NSString*)datestring
    startlatitude:(NSNumber *)startlatitude
   startlongitude:(NSNumber *)startlongitude
  recordstarttime:(NSDate *)starttime
         pointnum:(NSNumber *)pointnum
          stopnum:(NSNumber *)stopnum {
    
    self = [super init];
    
    if (self) {
        self.user = user;
        self.datestring = datestring;
        self.startlatitude = startlatitude;
        self.startlongitude = startlongitude;
        self.recordstarttime = starttime;
        self.pointnum = pointnum;
        self.stopnum = stopnum;
        self.avgsped = [NSNumber numberWithInt:0];
        self.distance = [NSNumber numberWithInt:0];
    }
    
    return self;
}

@end
