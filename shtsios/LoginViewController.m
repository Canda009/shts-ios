//
//  LoginViewController.m
//  shtsios
//
//  Created by cdj on 16/2/22.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "LoginViewController.h"
#import <AFHTTPSessionManager.h>
#import "Constants.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
- (IBAction)backAction:(id)sender;
- (IBAction)loginAction:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    _usernameInput.text = username;
    
    //[_loginBtn.layer setMasksToBounds:YES];
    //[_loginBtn.layer setBorderWidth:1];
    
    
    [_loginBtn.layer setCornerRadius:5];
    
    [_registerBtn.layer setMasksToBounds:YES];
    [_registerBtn.layer setBorderWidth:1];
    [_registerBtn.layer setCornerRadius:5];
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginAction:(id)sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *username = [_usernameInput text];
    NSString *password = [_passwordInput text];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user.email"]=username;
    params[@"user.password"]=password;
    params[@"device"]=@"ios";
    NSString *action = @"/new-shts/login.do";
    NSString *loginUrl = [SERVER_URL stringByAppendingString:action];
    //NSLog(@"%@",loginUrl);
   // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
    [manager POST:loginUrl parameters:params progress:^(NSProgress *progress){
    
    } success:^(NSURLSessionDataTask *operation,id responseObject){
        //NSLog(@"%@",responseObject);
        //NSLog(@"%@",[NSThread currentThread]);
      
        
        NSString *result = [responseObject objectForKey:@"result"];
        if([result isEqualToString:@"success"]){
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults setObject:username forKey:@"username"];
            [userDefaults setObject:password forKey:@"password"];
            [userDefaults synchronize];
            [self performSegueWithIdentifier:@"LoginSuccess" sender:nil];
            
        }
        else if([result isEqualToString:@"success01"]){
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults setObject:username forKey:@"username"];
            [userDefaults setObject:password forKey:@"password"];
            [userDefaults synchronize];
            
            
            [self performSegueWithIdentifier:@"HadJoin" sender:nil];
            
        }
        else{
           // NSLog(@"loign failed");
        //login failed  do  nothing;
        }
        
    } failure:^(NSURLSessionDataTask *operation,NSError *error){
        //NSLog(@"%@",error);
    }];
    /*[manager POST:@"http://202.114.93.4:8080/shts/login.do" parameters:loginDict success:^(NSURLSessionDataTask *operation,id responseObject){
        NSLog(@"%@",responseObject);
        NSLog(@"%@",[NSThread currentThread]);
    } failure:^(NSURLSessionDataTask *opeartion,NSError *error){
        NSLog(@"%@",error);
    }];*/
}
@end
