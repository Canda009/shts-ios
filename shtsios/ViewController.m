//
//  ViewController.m
//  shtsios
//
//  Created by cdj on 16/2/16.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AFHTTPSessionManager.h>
#import "SurveyViewController.h"

#import "Constants.h"
#import "TraceDao.h"
#import "RecordDao.h"
#import "CustomAnnotationView.h"
#import "StopDao.h"


#define kCalloutViewMargin          -8

@interface ViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
    NSMutableArray *_speedColors;
    CLLocationCoordinate2D *_runningCoords;
    NSUInteger _count;
    NSMutableArray *_pointList;
    NSMutableArray *_traceList;
    NSMutableArray *_stopList;
    NSMutableArray *indexes;
    MAMultiPolyline *_polyline;
    //CLLocationCoordinate2D *currnentLoation;
    NSString *send;
    NSString *currentState;
    //MAMapPoint *laststop;
    
    CLLocationCoordinate2D laststop;
    
    
    

}
//@property (nonatomic, assign) id <SegueDelegate> delegate;
- (IBAction)locationAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *gpsLabel;
@property (weak, nonatomic) IBOutlet UIButton *locationLabel;
@end

@implementation ViewController

-(void) DoSegue{
    NSLog(@"ceshi");
}

- (void)initMapView{
    [AMapServices sharedServices].apiKey = IOS_KEY;
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    _mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 22);
    _mapView.scaleOrigin = CGPointMake(_mapView.scaleOrigin.x, 22);
    
    [self.view addSubview:_mapView];
   
    //_mapView.zoomLevel = 18.0;
    //NSLog(@"it's initMapView()");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    currentState=@"move";
    //NSLog(@"map viewload");
    // Do any additional setup after loading the view, typically from a nib.
    [_gpsLabel.layer setMasksToBounds:YES];
    //[_gpsLabel.layer setBorderWidth:1];
    [_gpsLabel.layer setCornerRadius:5];
    
    [_locationLabel.layer setMasksToBounds:YES];
    //[_gpsLabel.layer setBorderWidth:1];
    [_locationLabel.layer setCornerRadius:5];
    
    [self initMapView];
    _mapView.showsUserLocation = YES;
    _mapView.pausesLocationUpdatesAutomatically = NO;
    _mapView.allowsBackgroundLocationUpdates = YES;
    _mapView.distanceFilter = 35.0;
    _mapView.headingFilter = 90;
    if(_mapView.userTrackingMode != MAUserTrackingModeFollow){
        [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    }
    //NSLog(@"it's viewDidLoad()");
    
    
    //测试手动放置停留点；
    MAPointAnnotation *testAnnotation = [[MAPointAnnotation alloc] init];
    
    //testAnnotation.coordinate= CLLocationCoordinate2DMake(30.528687,114.338885);
    testAnnotation.coordinate= CLLocationCoordinate2DMake(39.9557260000,116.3435570000);

    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM-dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    NSString* title = [dateformatter stringFromDate:nowDate];
    testAnnotation.title = title;
    testAnnotation.subtitle = @"停留";
    [_mapView addAnnotation:testAnnotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if(updatingLocation){
        //NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
       // currnentLoation[0] = userLocation.location.coordinate;
        //currnentLoation[0]=userLocation.location.coordinate;
        NSString *currentLatitude = [NSString stringWithFormat:@"%f",userLocation.location.coordinate.latitude];
        NSString *currentLogitude = [NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude];
        NSString *speed = [NSString stringWithFormat:@"%f",userLocation.location.speed];
        NSString *accuracy = [NSString stringWithFormat:@"%f",userLocation.location.horizontalAccuracy];
        NSString *bearing = [NSString stringWithFormat:@"%f",userLocation.location.course];
        NSString *state = @"move";
        NSString *altitude = [NSString stringWithFormat:@"%f",userLocation.location.altitude];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *username = [userDefault objectForKey:@"username"];
        
       
       
        
        //处理record
        NSDate *nowDate = [NSDate date];
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"yyyyMMdd"];
        NSString * dateStr=[dateformatter stringFromDate:nowDate];
        
        RecordDAO *recordDao = [RecordDAO sharedManager];
        if([recordDao findByDateString:dateStr]){
            Record *record = [[Record alloc] init];
            record.datestring = dateStr;
            record.recordendtime = userLocation.location.timestamp;
            [recordDao modify:record];
        }
        else{
         Record  *record = [[Record alloc] initWithUser:username datestring:dateStr startlatitude:[NSNumber numberWithDouble:userLocation.location.coordinate.latitude] startlongitude:[NSNumber numberWithDouble: userLocation.location.coordinate.longitude] recordstarttime:userLocation.location.timestamp pointnum:[NSNumber numberWithInt:1] stopnum:[NSNumber numberWithInt:1]];
            [recordDao create:record];
        }
        
        
        //NSDate *nowDate = [self getCustomDateWithHour:0];
        //NSDate *nextDate = [self getCustomDateWithHour:24];
        
        //NSTimeInterval time = [nowDate timeIntervalSince1970];
        //long long timeMills = [[NSNumber numberWithDouble:time] longLongValue];
        //timeMills = timeMills-8*60*60;
        //timeMills = (timeMills - timeMills%(24*60*60))+8*60*60;
        //NSString *timeString = [NSString stringWithFormat:@"%llu",timeMills];
        //NSLog(@"time-%@",timeString);
        
        /*
        NSMutableArray *all =  [dao findByStartDate:nowDate endDate:nextDate];
        for (int i=0; i< [all count]; i++) {
            Trace *myTrace = all[i];
            NSDate *mydate = myTrace.tracetime;
            NSTimeInterval time = [mydate timeIntervalSince1970];
            long long timeMills = [[NSNumber numberWithDouble:time] longLongValue];
            NSString *timeString = [NSString stringWithFormat:@"%llu",timeMills];
            //NSLog(@"time-%@",timeString);
            NSLog(@"%@,%@,%@,%@",myTrace.latitude,myTrace.longitude,myTrace.tracetime,timeString);
        }*/
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"userEmail"]=username;
        params[@"trace.currentLatitude"]=currentLatitude;
        params[@"trace.currentLogitude"]=currentLogitude;
        params[@"trace.state"]=state;
        params[@"trace.altitude"]=altitude;
        params[@"trace.speed"]=speed;
        params[@"trace.accuracy"]=accuracy;
        params[@"trace.bearing"]=bearing;
        NSString *action = @"/new-shts/trace.do?device=ios";
        NSString *traceUrl = [SERVER_URL stringByAppendingString:action];
        //NSLog(@"username-%@",username);
        // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
        [manager POST:traceUrl parameters:params progress:^(NSProgress *progress){
            
        } success:^(NSURLSessionDataTask *operation,id responseObject){
            //NSLog(@"%@",responseObject);
            //NSLog(@"%@",[NSThread currentThread]);
            
            /*
            NSString *result = [responseObject objectForKey:@"result"];
            if([result isEqualToString:@"success"]){
                [self performSegueWithIdentifier:@"LoginSuccess" sender:nil];
                
            }
            else if([result isEqualToString:@"success01"]){
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                
                [userDefaults setObject:username forKey:@"username"];
                [userDefaults setObject:password forKey:@"password"];
                [userDefaults synchronize];
                
                
                [self performSegueWithIdentifier:@"LoginSuccess" sender:nil];
                
            }
            else{
                NSLog(@"loign failed");
                //login failed  do  nothing;
            }
            */
        } failure:^(NSURLSessionDataTask *operation,NSError *error){
            NSLog(@"%@",error);
        }];
        
        
        [_traceList addObject:userLocation.location];
        if (userLocation.location.horizontalAccuracy <30.0) {
            _gpsLabel.titleLabel.text = @"GPS强";
            [_pointList addObject:userLocation.location];
        }
        else{
            _gpsLabel.titleLabel.text = @"GPS弱";
        }
        
        
        long pointNum= [_pointList count];
        if(pointNum == 1 ){
            currentState =@"move";
            _runningCoords[pointNum-1].latitude =userLocation.location.coordinate.latitude;
            _runningCoords[pointNum-1].longitude=userLocation.location.coordinate.longitude;
            UIColor *speedColor = [self getColorForSpeed:userLocation.location.speed];
            [_speedColors addObject:speedColor];
            [indexes addObject:@(pointNum)];
        }
        else if (pointNum>1 && userLocation.location.horizontalAccuracy <30.0){
            currentState =@"move";
            _runningCoords[pointNum-1].latitude =userLocation.location.coordinate.latitude;
            _runningCoords[pointNum-1].longitude=userLocation.location.coordinate.longitude;
            UIColor *speedColor = [self getColorForSpeed:userLocation.location.speed];
            [_speedColors addObject:speedColor];
            [indexes addObject:@(pointNum)];
            _polyline = [MAMultiPolyline polylineWithCoordinates:_runningCoords count:[_pointList count] drawStyleIndexes:indexes];
            [_mapView addOverlay:_polyline];
            
        }
        
        //以下是判断停留点的过程 先找到距离当前点之前5分钟的点，再对两点之间所有点进行算法处理
        long allcount= [_traceList count];
        //NSLog(@"第%ld点 精度%@ 速度%@ 当前状态%@",allcount,accuracy,speed,currentState);
        
        
        if (allcount>=10) {
            int countNet=0;
            for(int i = 0; i < 10; i++){
                CLLocation* location01 = [_traceList objectAtIndex:allcount-1-i];
                if(location01.speed<0){
                    countNet++;
                }
            }
            if(countNet>=8){
                //stop
               
                if([currentState isEqualToString:@"move"]){
                     //NSLog(@"create stop");
                    MAMapPoint point1 = MAMapPointForCoordinate(laststop);
                    MAMapPoint point2 = MAMapPointForCoordinate(userLocation.location.coordinate);
                    
                    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
                    if (distance<300) {
                        //stops is near. remove.
                        currentState = @"stop";
                    }
                    else{
                        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
                        pointAnnotation.coordinate= userLocation.location.coordinate;
                        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
                        [dateformatter setDateFormat:@"MM-dd HH:mm:ss"];
                        NSString* title = [dateformatter stringFromDate:userLocation.location.timestamp];
                        pointAnnotation.title = title;
                        pointAnnotation.subtitle = @"停留";
                        [_mapView addAnnotation:pointAnnotation];
                        currentState = @"stop";
                        laststop.latitude=userLocation.location.coordinate.latitude;
                        laststop.longitude=userLocation.location.coordinate.longitude;
                    
                    }
                    
                }else{
                }
            }else{
                
                if (userLocation.location.speed>0.5) {
                    currentState = @"move";
                }
                
                
            }
            
            
            /*
            long numFind = pointNum-2;
            long timeInterval = 0;
            CLLocation* currentLocation = userLocation.location;
            while (timeInterval < 300 || numFind ==0) {
                
                CLLocation* beforeLocation = [_pointList objectAtIndex:numFind];
                timeInterval = [currentLocation.timestamp timeIntervalSinceDate:beforeLocation.timestamp];
                numFind--;
            }
            
            if(numFind >0 && timeInterval>300){
                if((pointNum-numFind)<6){
                    //stop
                    if([currentState isEqualToString:@"move"]){
                        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
                        pointAnnotation.coordinate= userLocation.location.coordinate;
                        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
                        [dateformatter setDateFormat:@"MM-dd HH:mm:ss"];
                        NSString* title = [dateformatter stringFromDate:userLocation.location.timestamp];
                        pointAnnotation.title = title;
                        pointAnnotation.subtitle = @"停留";
                        [_mapView addAnnotation:pointAnnotation];
                        currentState = @"stop";
                    }
                    
                }
                else{
                    if (userLocation.location.speed>1.2) {
                        currentState = @"move";
                    }
                    
                
                }
            
            }
            */
         
        }
        
        Trace *trace = [[Trace alloc] initWithUser:username latitude:[NSNumber numberWithDouble:userLocation.location.coordinate.latitude] longitude:[NSNumber numberWithDouble:userLocation.location.coordinate.longitude] tracetime:userLocation.location.timestamp accuracy:[NSNumber numberWithDouble: userLocation.location.horizontalAccuracy] speed:[NSNumber numberWithDouble:userLocation.location.speed] altitude:[NSNumber numberWithDouble:userLocation.location.altitude] bearing:[NSNumber numberWithDouble:userLocation.location.course] state:currentState];
        TraceDAO *dao = [TraceDAO sharedManager];
        [dao create:trace];
        
        
        if (pointNum == 1000) {
            _pointList = [NSMutableArray array];
            _speedColors = [NSMutableArray array];
            indexes = [NSMutableArray array];
            free(_runningCoords);
            _runningCoords = (CLLocationCoordinate2D *)malloc(1000*sizeof(CLLocationCoordinate2D));
            
        }
    }
}

-(MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay{
    if([overlay isKindOfClass:[MAMultiPolyline class]]){
        MAMultiColoredPolylineRenderer *polylineRenderer = [[MAMultiColoredPolylineRenderer alloc] initWithMultiPolyline:overlay];
        polylineRenderer.lineWidth = 8.f;
        polylineRenderer.strokeColors = _speedColors;
        polylineRenderer.gradient = YES;
        
        return polylineRenderer;
    }
    //NSLog(@"it's rendererForOverlay()");
    return nil;
}
-(UIColor *)getColorForSpeed:(float)speed{
    const float lowSpeedTh = 0.f;
    const float highSpeedTh = 10.5f;
    const CGFloat warmHue = 0.02f;
    const CGFloat coldHue = 0.4f;
    float hue = coldHue-(speed-lowSpeedTh)*(coldHue-warmHue)/(highSpeedTh-lowSpeedTh);
    return [UIColor colorWithHue:hue saturation:1.f brightness:1.f alpha:1.f];
}
-(void)initData{
    _pointList = [NSMutableArray array];
    _traceList = [NSMutableArray array];
    _speedColors = [NSMutableArray array];
    indexes = [NSMutableArray array];
    _runningCoords = (CLLocationCoordinate2D *)malloc(1000*sizeof(CLLocationCoordinate2D));
    //currnentLoation = (CLLocationCoordinate2D *)malloc(sizeof(CLLocationCoordinate2D));
    
    laststop.latitude=0.f;
    laststop.longitude=0.f;
    //_laststop = (CLLocationcCoordonate2D *)malloc(1*sizeof(CLLocationCoordinate2D));
    
    /*
    _speedColors = [NSMutableArray array];
    NSData *jsdata = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"running" ofType:@"json"]];
    NSMutableArray *indexes = [NSMutableArray array];
    if(jsdata){
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:jsdata options:NSJSONReadingAllowFragments error:nil];
        _count = dataArray.count;
        _runningCoords = (CLLocationCoordinate2D *)malloc(_count * sizeof(CLLocationCoordinate2D));
        for(int i=0;i<_count;i++){
            @autoreleasepool {
                NSDictionary *data = dataArray[i];
                _runningCoords[i].latitude = [data[@"latitude"] doubleValue];
                _runningCoords[i].longitude = [data[@"longitude"] doubleValue];
                UIColor *speedColor = [self getColorForSpeed:[data[@"speed"] floatValue]];
                [_speedColors addObject:speedColor];
                [indexes addObject:@(i)];
            }
        }
    }
    _polyline = [MAMultiPolyline polylineWithCoordinates:_runningCoords count:_count drawStyleIndexes:indexes];
    */
    
}

- (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}



-(void)viewDidAppear:(BOOL)animated{
    [self initData];
    //[_mapView addOverlay:_polyline];
    //NSLog(@"it's viewDidAppear()");
    
    
    
    
    NSArray *allAnno= [_mapView annotations];
    for (int i=0; i< [allAnno count]; i++) {
        
        MAPointAnnotation *an=allAnno[i];
        
        StopDAO *dao = [StopDAO sharedManager];
        NSMutableArray *all=[dao findByLatitude:[NSNumber numberWithDouble:an.coordinate.latitude]];
        if (all==nil || all ==NULL||[all count]==0) {
            
        }else{
            
            StopPoint *myStop = all[0];
           
            CustomAnnotationView *anview = (CustomAnnotationView*)[_mapView viewForAnnotation:an];
            NSString *str = [an.title stringByAppendingString:myStop.purpose];
            anview.title=myStop.purpose;
        }
        
    }
   
    
    //测试放置两个 大头针的demo
    /*
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate= CLLocationCoordinate2DMake(30.51, 114.343);
    pointAnnotation.title = @"20160622";
    pointAnnotation.subtitle = @"test";
    [_mapView addAnnotation:pointAnnotation];
    
    MAPointAnnotation *pointAnnotation1 = [[MAPointAnnotation alloc] init];
    pointAnnotation1.coordinate= CLLocationCoordinate2DMake(30.50, 114.343);
    pointAnnotation1.title = @"20160622";
    pointAnnotation1.subtitle = @"test";
    [_mapView addAnnotation:pointAnnotation1];
    */
    /*测试nsdate相减的秒数
    NSDate *beforeDate = [self getCustomDateWithHour:0];
    NSDate *currentDate = [self getCustomDateWithHour:1];
    long timemill = [currentDate timeIntervalSinceDate:beforeDate];
    NSLog(@"interval is-%ld",timemill);
    */
    
}


/*注释掉默认的大头针生成方法
-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuseIndentifier = @"pointReuserIndentifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil) {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        annotationView.draggable = NO;
        annotationView.pinColor = MAPinAnnotationColorRed;
        annotationView.enabled=YES;
        
        return annotationView;
    }
    return  nil;
}*/
-(void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    send = view.annotation.title;
    NSLog(@"click info");
    [self performSegueWithIdentifier:@"SurveyView" sender:self];
    

}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"SurveyView"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        SurveyViewController *receive = segue.destinationViewController;
        receive.receive = send;
        
        // 这里不需要指定跳转了，因为在按扭的事件里已经有跳转的代码
        //        [self.navigationController pushViewController:receive animated:YES];
    }
}

-(void)dealloc{
    if(_runningCoords){
        free(_runningCoords);
        
        _count=0;
    }
}

- (IBAction)locationAction:(id)sender {
    if ([_pointList count] > 0 ) {
        
        //[_mapView setCenterCoordinate:_mapView.userLocation.location.coordinate animated:YES];
        [_mapView setCenterCoordinate:_runningCoords[[_pointList count]-1] animated:YES];
    }
    
}

//自定义大头针方法

//手动放置方法
-(void)addAnnotationWithCooordinate:(CLLocationCoordinate2D)coordinate
{
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = coordinate;
    annotation.title    = @"AutoNavi";
    annotation.subtitle = @"CustomAnnotationView";
    
    [_mapView addAnnotation:annotation];
}

- (CGPoint)randomPoint
{
    CGPoint randomPoint = CGPointZero;
    
    randomPoint.x = arc4random() % (int)(CGRectGetWidth(self.view.bounds));
    randomPoint.y = arc4random() % (int)(CGRectGetHeight(self.view.bounds));
    
    return randomPoint;
}

- (CGSize)offsetToContainRect:(CGRect)innerRect inRect:(CGRect)outerRect
{
    CGFloat nudgeRight = fmaxf(0, CGRectGetMinX(outerRect) - (CGRectGetMinX(innerRect)));
    CGFloat nudgeLeft = fminf(0, CGRectGetMaxX(outerRect) - (CGRectGetMaxX(innerRect)));
    CGFloat nudgeTop = fmaxf(0, CGRectGetMinY(outerRect) - (CGRectGetMinY(innerRect)));
    CGFloat nudgeBottom = fminf(0, CGRectGetMaxY(outerRect) - (CGRectGetMaxY(innerRect)));
    return CGSizeMake(nudgeLeft ?: nudgeRight, nudgeTop ?: nudgeBottom);
}

#pragma mark - MAMapViewDelegate


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *customReuseIndetifier = @"customReuseIndetifier";
        
        CustomAnnotationView *annotationView = (CustomAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIndetifier];
        
        
        if (annotationView == nil)
        {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
            // must set to NO, so we can show the custom callout view.
            annotationView.canShowCallout = NO;
            annotationView.draggable = YES;
            annotationView.calloutOffset = CGPointMake(0, -5);
        }
        //annotationView.date =date;
        /*
        annotationView.portrait = [UIImage imageNamed:@"hema.png"];
        annotationView.name     = @"河马";
        */
        //annotationView.delegate=self;
        //annotationView.title     = @"河马";
        return annotationView;
    }
    
    return nil;
}

#pragma mark - Action Handle

- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
    //NSLog(@"123");
    /* Adjust the map center in order to show the callout view completely. */
    if ([view isKindOfClass:[CustomAnnotationView class]]) {
        CustomAnnotationView *cusView = (CustomAnnotationView *)view;
        CGRect frame = [cusView convertRect:cusView.calloutView.frame toView:_mapView];
        
        frame = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(kCalloutViewMargin, kCalloutViewMargin, kCalloutViewMargin, kCalloutViewMargin));
        
        if (!CGRectContainsRect(_mapView.frame, frame))
        {
            /* Calculate the offset to make the callout view show up. */
            CGSize offset = [self offsetToContainRect:frame inRect:_mapView.frame];
            
            CGPoint theCenter = mapView.center;
            theCenter = CGPointMake(theCenter.x - offset.width, theCenter.y - offset.height);
            
            CLLocationCoordinate2D coordinate = [_mapView convertPoint:theCenter toCoordinateFromView:_mapView];
            
            [_mapView setCenterCoordinate:coordinate animated:YES];
        }
        
    }
}

- (void)addAction
{
    
    CLLocationCoordinate2D randomCoordinate = [_mapView convertPoint:[self randomPoint] toCoordinateFromView:self.view];
    
    [self addAnnotationWithCooordinate:randomCoordinate];
}
//
@end
