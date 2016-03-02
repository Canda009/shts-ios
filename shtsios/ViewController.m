//
//  ViewController.m
//  shtsios
//
//  Created by cdj on 16/2/16.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AFHTTPSessionManager.h>

#define APIKey @"f3e9fad54427756a8373a0795e81fd00"
@interface ViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
    NSMutableArray *_speedColors;
    CLLocationCoordinate2D *_runningCoords;
    NSUInteger _count;
    NSMutableArray *_pointList;
    NSMutableArray *indexes;
    MAMultiPolyline *_polyline;
}
@end

@implementation ViewController

- (void)initMapView{
    [MAMapServices sharedServices].apiKey = APIKey;
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    _mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 22);
    _mapView.scaleOrigin = CGPointMake(_mapView.scaleOrigin.x, 22);
    
    [self.view addSubview:_mapView];
    NSLog(@"it's initMapView()");
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initMapView];
    _mapView.showsUserLocation = YES;
    _mapView.pausesLocationUpdatesAutomatically = NO;
    _mapView.allowsBackgroundLocationUpdates = YES;
    if(_mapView.userTrackingMode != MAUserTrackingModeFollow){
        [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    }
    NSLog(@"it's viewDidLoad()");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if(updatingLocation){
        //NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        NSString *currentLatitude = [NSString stringWithFormat:@"%f",userLocation.location.coordinate.latitude];
        NSString *currentLogitude = [NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude];
        NSString *speed = [NSString stringWithFormat:@"%f",userLocation.location.speed];
        NSString *accuracy = [NSString stringWithFormat:@"%f",userLocation.location.horizontalAccuracy];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *username = [userDefault objectForKey:@"username"];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"userEmail"]=username;
        params[@"trace.currentLatitude"]=currentLatitude;
        params[@"trace.currentLogitude"]=currentLogitude;
        params[@"trace.speed"]=speed;
        params[@"trace.accuracy"]=accuracy;

        
        // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
        [manager POST:@"http://192.168.1.111:8080/shts/trace.do" parameters:params progress:^(NSProgress *progress){
            
        } success:^(NSURLSessionDataTask *operation,id responseObject){
            NSLog(@"%@",responseObject);
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
        
        [_pointList addObject:userLocation.location];
        long pointNum= [_pointList count];
        if(pointNum == 1 ){
            _runningCoords[pointNum-1].latitude =userLocation.location.coordinate.latitude;
            _runningCoords[pointNum-1].longitude=userLocation.location.coordinate.longitude;
            UIColor *speedColor = [self getColorForSpeed:userLocation.location.speed];
            [_speedColors addObject:speedColor];
            [indexes addObject:@(pointNum)];
        }
        else if (pointNum>1){
            _runningCoords[pointNum-1].latitude =userLocation.location.coordinate.latitude;
            _runningCoords[pointNum-1].longitude=userLocation.location.coordinate.longitude;
            UIColor *speedColor = [self getColorForSpeed:userLocation.location.speed];
            [_speedColors addObject:speedColor];
            [indexes addObject:@(pointNum)];
            _polyline = [MAMultiPolyline polylineWithCoordinates:_runningCoords count:[_pointList count] drawStyleIndexes:indexes];
            [_mapView addOverlay:_polyline];
            
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
    NSLog(@"it's rendererForOverlay()");
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
    _runningCoords = (CLLocationCoordinate2D *)malloc(500*sizeof(CLLocationCoordinate2D));
    
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
-(void)viewDidAppear:(BOOL)animated{
    [self initData];
    //[_mapView addOverlay:_polyline];
    NSLog(@"it's viewDidAppear()");
}

-(void)dealloc{
    if(_runningCoords){
        free(_runningCoords);
        _count=0;
    }
}

@end
