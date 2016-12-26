//
//  StopPoint.m
//  shtsios
//
//  Created by cdj on 16/9/16.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "StopPoint.h"

@implementation StopPoint
-(id) initWithUser:(NSString *)user latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude stoptime:(NSDate *)stoptime purpose:(NSString *)purpose vehicle:(NSString *)vehicle companytype:(NSString *)companytype companynum:(NSString*)companynum building:(NSString *)building isvalid:(NSString *)isvalid{
    self = [super init];
    
    if (self) {
        self.user = user;
        self.latitude = latitude;
        self.longitude = longitude;
        self.stop_time = stoptime;
        self.purpose = purpose;
        self.vehicle = vehicle;
        self.company_type = companytype;
        self.company_num = companynum;
        self.building = building;
        self.isvalid = isvalid;
    }
    
    return self;

}
@end
