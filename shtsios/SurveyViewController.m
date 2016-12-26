//
//  SurveyViewController.m
//  shtsios
//
//  Created by cdj on 16/7/31.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "SurveyViewController.h"
#import "NIDropDown.h"
#import <AFHTTPSessionManager.h>
#import "Constants.h"
#import "NSString+FontAwesome.h"
#import "StopDao.h"

@interface SurveyViewController ()

@end

@implementation SurveyViewController
@synthesize select01;
@synthesize select02;
@synthesize select03;
@synthesize select04;
@synthesize select05;
@synthesize receive;
@synthesize rLatitude;
@synthesize rLongitude;
@synthesize rStoptime;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    
    //NSLog(@"rLatitude-%f",rLatitude.doubleValue);
    //NSLog(@"rLongitude-%f",rLongitude.doubleValue);
    
    select01.layer.borderWidth = 1;
    select01.layer.borderColor = [[UIColor blackColor] CGColor];
    select01.layer.cornerRadius = 5;
    
    select02.layer.borderWidth = 1;
    select02.layer.borderColor = [[UIColor blackColor] CGColor];
    select02.layer.cornerRadius = 5;
    
    select03.layer.borderWidth = 1;
    select03.layer.borderColor = [[UIColor blackColor] CGColor];
    select03.layer.cornerRadius = 5;
    
    select04.layer.borderWidth = 1;
    select04.layer.borderColor = [[UIColor blackColor] CGColor];
    select04.layer.cornerRadius = 5;
    
    select05.layer.borderWidth = 1;
    select05.layer.borderColor = [[UIColor blackColor] CGColor];
    select05.layer.cornerRadius = 5;
    
    
    _label01.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _label01.text = [NSString fontAwesomeIconStringForEnum:FAMobile];
    [_label01 setTextColor:[UIColor darkGrayColor]];
    
    _label02.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _label02.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-lock"];
    [_label02 setTextColor:[UIColor darkGrayColor]];
    
    _label03.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _label03.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-lock"];
    [_label03 setTextColor:[UIColor darkGrayColor]];
    
    _label04.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _label04.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-user"];
    [_label04 setTextColor:[UIColor darkGrayColor]];
    
    _label05.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _label05.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-mars"];
    [_label05 setTextColor:[UIColor darkGrayColor]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectClicked01:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"上班上学", @"公务业务", @"生活购物", @"文体娱乐", @"探亲访友",@"其他",nil];
    
    if(dropDown01 == nil) {
        CGFloat f = 200;
        dropDown01 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown01.delegate = self;
    }
    else {
        [dropDown01 hideDropDown:sender];
        //[self rel];
        dropDown01 = nil;
    }
}

- (IBAction)selectClicked02:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"步行", @"电动车", @"私人小汽车", @"出租车", @"公交",@"地铁",nil];
    
    if(dropDown02 == nil) {
        CGFloat f = 200;
        dropDown02 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown02.delegate = self;
    }
    else {
        [dropDown02 hideDropDown:sender];
        //[self rel];
        dropDown02 = nil;
    }
}

- (IBAction)selectClicked03:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"同事", @"家人", @"朋友", @"同学", @"无",@"其他",nil];
    
    if(dropDown03 == nil) {
        CGFloat f = 200;
        dropDown03 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown03.delegate = self;
    }
    else {
        [dropDown03 hideDropDown:sender];
        //[self rel];
        dropDown03 = nil;
    }
}

- (IBAction)selectClicked04:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5",@"其他",nil];
    
    if(dropDown04 == nil) {
        CGFloat f = 200;
        dropDown04 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown04.delegate = self;
    }
    else {
        [dropDown04 hideDropDown:sender];
        //[self rel];
        dropDown04 = nil;
    }
}

- (IBAction)selectClicked05:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"住宅", @"工业", @"文教", @"办公", @"商业服务区",@"文体娱乐",nil];
    
    if(dropDown05 == nil) {
        CGFloat f = 200;
        dropDown05 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown05.delegate = self;
    }
    else {
        [dropDown05 hideDropDown:sender];
        //[self rel];
        dropDown05 = nil;
    }
}

- (IBAction)submit:(id)sender {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    /*
    StopPoint *stop = [[StopPoint alloc] initWithUser:@"111" latitude:[NSNumber numberWithDouble:30.1] longitude:[NSNumber numberWithDouble:114.0] stoptime:[NSDate date] purpose:@"123" vehicle:@"123" companytype:@"123" companynum:@"123" building:@"123" isvalid:@"123"];
    StopDAO *dao = [StopDAO sharedManager];
    [dao create:stop];
    */
    //TraceDAO *dao = [TraceDAO sharedManager];
    //[dao create:record];
    /*
    NSDate* start = [self getCustomDateWithHour01:0 withdata:[NSDate date]];
    NSDate* end = [self getCustomDateWithHour01:24 withdata:[NSDate date]];
    
    NSMutableArray *all =  [dao findByStartDate:start endDate:end];
    NSLog(@"the size is %lu",[all count]);*/
    
    
    
    if([select01.titleLabel.text isEqualToString:@"选择"] || [select02.titleLabel.text isEqualToString:@"选择"] || [select03.titleLabel.text isEqualToString:@"选择"] || [select04.titleLabel.text isEqualToString:@"选择"]||[select05.titleLabel.text isEqualToString:@"选择"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"选择项不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        
        StopPoint *stop = [[StopPoint alloc] initWithUser:username latitude:rLatitude longitude:rLongitude stoptime:[NSDate date] purpose:select01.titleLabel.text vehicle:select02.titleLabel.text companytype:select03.titleLabel.text companynum:select04.titleLabel.text building:select05.titleLabel.text isvalid:@"1"];
        StopDAO *dao = [StopDAO sharedManager];
        [dao create:stop];
        /*
        NSDate* start = [self getCustomDateWithHour01:0 withdata:[NSDate date]];
        NSDate* end = [self getCustomDateWithHour01:24 withdata:[NSDate date]];
        
        NSMutableArray *all =  [dao findByStartDate:start endDate:end];
        StopPoint *s = [all objectAtIndex:1];
        NSLog(@"user-%@",s.user);
        NSLog(@"lat-%@",s.latitude);
        NSLog(@"long-%@",s.longitude);
        NSLog(@"purp-%@",s.purpose);
        */
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"survey.purpose"]=select01.titleLabel.text;
        params[@"survey.vehicle"]=select02.titleLabel.text;
        params[@"survey.company_type"]=select03.titleLabel.text;
        params[@"survey.duration"]=select04.titleLabel.text;
        params[@"survey.latitude"]=[NSString stringWithFormat:@"%@",rLatitude];
        params[@"survey.longitude"]=[NSString stringWithFormat:@"%@",rLongitude];
        params[@"userEmail"]=username;
        
        
        NSString *action = @"/new-shts/survey.do";
        NSString *surveyUrl = [SERVER_URL stringByAppendingString:action];
        //NSLog(@"%@",loginUrl);
        // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
        [manager POST:surveyUrl parameters:params progress:^(NSProgress *progress){
            
        } success:^(NSURLSessionDataTask *operation,id responseObject){
            //NSLog(@"%@",responseObject);
            //NSLog(@"%@",[NSThread currentThread]);
            //[self backClicked:NULL];
            
        } failure:^(NSURLSessionDataTask *operation,NSError *error){
            //NSLog(@"%@",error);
          
        }];
    }
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)backClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}




- (void) niDropDownDelegateMethod:(NIDropDown *)sender{
    sender = nil;
    //[self rel];
    //NSLog(@"%@", btnSelect.titleLabel.text);
    
}

-(void)rel{
    //    [dropDown release];
    dropDown01 = nil;
    dropDown02 = nil;
    dropDown03 = nil;
    dropDown04 = nil;
    dropDown05 = nil;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    //[[self findFirstResponderBeneathView:self] resignFirstResponder];
    [textField resignFirstResponder];
    return YES;
}
- (UIView*)findFirstResponderBeneathView:(UIView*)view
{
    // Search recursively for first responder
    for ( UIView *childView in view.subviews ) {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] )
            return childView;
        UIView *result = [self findFirstResponderBeneathView:childView];
        if ( result )
            return result;
    }
    return nil;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
@end
