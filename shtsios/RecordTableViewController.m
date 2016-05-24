//
//  RecordTableViewController.m
//  shtsios
//
//  Created by cdj on 16/2/29.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "RecordTableViewController.h"
#import "RecordItemCell.h"
#import "HomeViewController.h"
#import "RecordDao.h"

@interface RecordTableViewController ()<myTabVdelegate01>
{
    NSMutableArray *recordsArray;
}

@end

@implementation RecordTableViewController

-(void)myTabVClick:(UITableViewCell *)cell{
    /*
    NSIndexPath *index = [self.tableView indexPathForCell:cell];
    //NSLog(@"the current cell == %ld",index.row);
    NSDictionary *recordDict = [recordsArray objectAtIndex:index.row];
    
    NSString *joinPlanId = [recordDict objectForKey:@"id"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    NSLog(@"%@",username);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_email"]=username;
    params[@"plan_id"]=joinPlanId;
    NSString *action = @"/new-shts/joinplan.do?device=ios";
    NSString *joinplanUrl = [SERVER_URL stringByAppendingString:action];
    
    // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
    [manager POST:joinplanUrl parameters:params progress:^(NSProgress *progress){
        
    } success:^(NSURLSessionDataTask *operation,id responseObject){
        // NSLog(@"%@",responseObject);
        //NSLog(@"%@",[NSThread currentThread]);
        
        
        NSString *result = [responseObject objectForKey:@"result"];
        if([result isEqualToString:@"success"]){
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *hadjoin = @"yes";
            
            [userDefaults setObject:hadjoin forKey:@"hadjoin"];
            
            [userDefaults synchronize];
            
            [self performSegueWithIdentifier:@"JoinPlan" sender:nil];
            
        }
        
        else{
            NSLog(@"join failed");
            //login failed  do  nothing;
        }
        
    } failure:^(NSURLSessionDataTask *operation,NSError *error){
        NSLog(@"%@",error);
    }];
    */
    /*
     HomeViewController *homeViewController = [[HomeViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
     
     [self presentViewController:navigationController animated:YES completion:^{}];*/
    
}


- (void)viewDidLoad {
    recordsArray = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyyMMdd"];
    [dateformatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSString * dateStr=[dateformatter stringFromDate:nowDate];
    
    Record  *record = [[Record alloc] initWithUser:@"20160516" datestring:dateStr startlatitude:[NSNumber numberWithDouble:30.1111] startlongitude:[NSNumber numberWithDouble: 114.11] recordstarttime:[NSDate date] pointnum:[NSNumber numberWithInt:1] stopnum:[NSNumber numberWithInt:1]];
    RecordDAO *dao = [RecordDAO sharedManager];
    [dao create:record];
    
    
    NSMutableArray *all =  [dao findAll];
    for (int i=0; i< [all count]; i++) {
        Record *myRecord = all[i];
        
        //NSLog(@"time-%@",timeString);
        NSLog(@"修改前%@,%@,%@,%@,%@",myRecord.startlatitude,myRecord.startlongitude,myRecord.recordstarttime,myRecord.stopnum,myRecord.datestring);
        [recordsArray addObject:myRecord];
    }
    [self.tableView reloadData];
    NSNumber *countNumber = [NSNumber numberWithUnsignedInteger:[recordsArray count]];
    
    NSLog(@"the count is %@",[countNumber stringValue]);
    /*
    Record *record01 = [[Record alloc]init];
    record01.datestring = dateStr;
    NSLog(@"datestring-%@,",dateStr);
    record01.stopnum = [NSNumber numberWithInt:11];
    [dao modify:record01];
    NSMutableArray *all01 =  [dao findAll];
    for (int i=0; i< [all01 count]; i++) {
        Record *myRecord = all[i];
        //NSLog(@"time-%@",timeString);
        NSLog(@"修改后%@,%@,%@,%@,%@",myRecord.startlatitude,myRecord.startlongitude,myRecord.recordstarttime,myRecord.stopnum,myRecord.datestring);
    }
    */
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"the count is %lu",[recordsArray count]);
    return [recordsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"RecordCell";
    RecordItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Record  *record = [recordsArray objectAtIndex:[indexPath row]];
    
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateformatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSString * starttimestring =[dateformatter stringFromDate:record.recordstarttime];
    NSString * endtimestring =[dateformatter stringFromDate:record.recordendtime];
    
    cell.starttime.text = starttimestring;
    cell.endtime.text = endtimestring;
    cell.distance.text = record.distance.description;
    cell.avgspeed.text = record.avgsped.description;
    cell.stopnum.text = record.stopnum.description;
    
    [cell.detailButton.layer setCornerRadius:6];
    
    //NSLog(@"the name is %@",[recordDict objectForKey:@"name"]);
    
    cell.delegate = self;
    // Configure the cell...
    //NSLog(@"cellforrowadindex");
    return cell;
    
}



@end
