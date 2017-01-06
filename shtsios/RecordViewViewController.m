//
//  RecordViewViewController.m
//  shtsios
//
//  Created by cdj on 16/6/16.
//  Copyright © 2016年 itiis. All rights reserved.
//


#import "RecordViewViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>


#import "Constants.h"
#import "TraceDao.h"
#import "RecordDao.h"


@interface RecordViewViewController ()<MAMapViewDelegate>
{
    __weak IBOutlet UITableView *timelineTable;
    MAMapView *_mapView;
    //UILayoutContainerView
    NSMutableArray *_speedColors;
    CLLocationCoordinate2D *_runningCoords;
    NSUInteger _count;
    NSMutableArray *_pointList;
    NSMutableArray *indexes;
    MAMultiPolyline *_polyline;
    
    
}

@end

@implementation RecordViewViewController
@synthesize receiveDate;
- (void)initMapView{
    
    [AMapServices sharedServices].apiKey = IOS_KEY_RECORD;
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)/2)];
    _mapView.delegate = self;
    _mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 22);
    _mapView.scaleOrigin = CGPointMake(_mapView.scaleOrigin.x, 22);
    
    
    [self.view addSubview:_mapView];
    
   
    //NSLog(@"it's initMapView()");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recordViewAction:) name:@"RecordViewNotification" object:nil];
 
    [self initMapView];
    _mapView.showsUserLocation = NO;
    //NSLog(@"thenameis-%@",receiveDate);

    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
    // Dispose of any resources that can be recreated.
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
    _speedColors = [NSMutableArray array];
    indexes = [NSMutableArray array];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSString * receivedtimestring =[dateformatter stringFromDate:receiveDate];
    //NSLog(@"received:%@",receivedtimestring);
    
    NSDate *startDate = [self getCustomDateWithHour01:0 withdata:receiveDate];
    //NSString * starttimestring =[dateformatter stringFromDate:startDate];
    //NSLog(@"received:%@",starttimestring);
    
    NSDate *endDate = [self getCustomDateWithHour01:24 withdata:receiveDate];
    //NSString * endtimestring =[dateformatter stringFromDate:endDate];
    //NSLog(@"received:%@",endtimestring);
    
    //NSLog(@"endtime:%@",endtimestring);
    
    
    TraceDAO *dao = [TraceDAO sharedManager];
    //[dao create:record];
    
    
    NSMutableArray *all =  [dao findByStartDate:startDate endDate:endDate];
    _runningCoords = (CLLocationCoordinate2D *)malloc([all count]*sizeof(CLLocationCoordinate2D));
    NSString *lastState=@"move";
    int gpscount=0;
    for (int i=0; i< [all count]; i++) {
        Trace *myTrace = all[i];
        //long pointNum = i+1;
        
        if ([myTrace.accuracy doubleValue]<=30.0) {
            _runningCoords[gpscount].latitude =[myTrace.latitude doubleValue];
            _runningCoords[gpscount].longitude=[myTrace.longitude doubleValue];
            UIColor *speedColor = [self getColorForSpeed:[myTrace.speed doubleValue]];
            [_speedColors addObject:speedColor];
            [indexes addObject:@(gpscount)];
            gpscount++;
        }
        /*
        _runningCoords[i].latitude =[myTrace.latitude doubleValue];
        _runningCoords[i].longitude=[myTrace.longitude doubleValue];
        UIColor *speedColor = [self getColorForSpeed:[myTrace.speed doubleValue]];
        [_speedColors addObject:speedColor];
        [indexes addObject:@(i)];
        */
        
        
                //放置停留点
        if ([myTrace.state isEqualToString:@"stop"]&&[lastState isEqualToString:@"move"]) {
            MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
            pointAnnotation.coordinate= CLLocationCoordinate2DMake([myTrace.latitude doubleValue], [myTrace.longitude doubleValue]);
            NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
            [dateformatter setDateFormat:@"MM-dd HH:mm:ss"];
            NSString* title = [dateformatter stringFromDate:myTrace.tracetime];
            pointAnnotation.title = title;
            pointAnnotation.subtitle = @"停留";
            [_mapView addAnnotation:pointAnnotation];
        }
        lastState=myTrace.state;
        
    }
    //NSLog(@"trace count is-%lu",[all count]);
    if ([all count]>0) {
        [_mapView setCenterCoordinate:_runningCoords[0] animated:YES];
        //[_mapView setZoomLevel:10];
    }
    
    _polyline = [MAMultiPolyline polylineWithCoordinates:_runningCoords count:gpscount drawStyleIndexes:indexes];
    
 
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
- (NSDate *)getCustomDateWithHour01:(NSInteger)hour withdata:(NSDate*)date
{
    //获取当前时间
    
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:date];
    
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
    [super viewDidAppear:YES];
    [self initData];
    
    
    [_mapView addOverlay:_polyline];
    
  
}


-(void)dealloc{
    if(_runningCoords){
        free(_runningCoords);
        _count=0;
    }
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:NO completion:nil];
    //[self performSegueWithIdentifier:@"RecordViewBack" sender:nil];
}

-(UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
@end
