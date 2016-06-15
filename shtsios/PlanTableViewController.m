//
//  PlanTableViewController.m
//  shtsios
//
//  Created by cdj on 16/2/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "PlanTableViewController.h"
#import "PlanItemCell.h"
#import "HomeNaviViewController.h"
#import "HomeViewController.h"
#import <AFHTTPSessionManager.h>
#import "Constants.h"

@interface PlanTableViewController ()<myTabVdelegate>
{
    NSMutableArray *plansArray ;
}

@end

@implementation PlanTableViewController

-(void)myTabVClick:(UITableViewCell *)cell{
    NSIndexPath *index = [self.tableView indexPathForCell:cell];
    //NSLog(@"the current cell == %ld",index.row);
    NSDictionary *planDict = [plansArray objectAtIndex:index.row];
    
    NSString *joinPlanId = [planDict objectForKey:@"id"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    //NSLog(@"%@",username);
    
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
            
            
            [self performSegueWithIdentifier:@"JoinPlan" sender:nil];
            
        }
       
        else{
            //NSLog(@"join failed");
            //login failed  do  nothing;
        }
        
    } failure:^(NSURLSessionDataTask *operation,NSError *error){
        //NSLog(@"%@",error);
    }];

    /*
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];

    [self presentViewController:navigationController animated:YES completion:^{}];*/
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    
    //NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    //NSString *username = [userDefault objectForKey:@"username"];
    
        //NSLog(@"the username is %@",username);
       
    
    NSString *action = @"/new-shts/plan.do?action=ios";
    NSString *planUrl = [SERVER_URL stringByAppendingString:action];
 
    
    
    [manager POST:planUrl parameters:nil progress:^(NSProgress *progress){
        
    } success:^(NSURLSessionDataTask *operation,id responseObject){
       // NSLog(@"responseObject%@",responseObject);
        plansArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.tableView reloadData];
        /*
        NSNumber *countNumber = [NSNumber numberWithUnsignedInteger:[plansArray count]];
        
        NSLog(@"the count is %@",[countNumber stringValue]);
        for(NSUInteger i=0;i<[countNumber intValue];i++){
           
            NSDictionary *myDict = [plansArray objectAtIndex:i];
            NSLog(@"%@",myDict);
        }*/
    
    } failure:^(NSURLSessionDataTask *operation,NSError *error){
        //NSLog(@"%@",error);
    }];
    
    
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
    //NSLog(@"the count is %lu",[plansArray count]);
    return [plansArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    PlanItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary *planDict = [plansArray objectAtIndex:[indexPath row]];
    
    cell.titleLabel.text = [planDict objectForKey:@"name"];
    cell.typeLabel.text = [planDict objectForKey:@"type"];
    cell.purposeLabel.text = [planDict objectForKey:@"purpose"];
    cell.organizerLabel.text = [planDict objectForKey:@"organizer"];
    cell.startendLabel.text = [planDict objectForKey:@"starttime"];
    cell.areaLabel.text = [planDict objectForKey:@"area"];
    [cell.joinButton.layer setCornerRadius:6];
   
    //NSLog(@"the name is %@",[planDict objectForKey:@"name"]);

    cell.delegate = self;
    // Configure the cell...
    //NSLog(@"cellforrowadindex");
    return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
