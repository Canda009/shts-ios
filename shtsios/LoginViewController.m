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
#import "NSString+FontAwesome.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameInput;  //用户名输入框
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;  //密码输入框
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;  //登陆按钮
//@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;  //注册按钮
@property (weak, nonatomic) IBOutlet UILabel *signupIconLabel;  //
- (IBAction)backAction:(id)sender;  //后退方法
- (IBAction)loginAction:(id)sender;  //登陆方法
- (IBAction)signupAction:(id)sender;  //

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[_backButton setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];  //读取本地纪录填好用户名一栏
    _usernameInput.text = username;
    
    //[_loginBtn.layer setMasksToBounds:YES];
    //[_loginBtn.layer setBorderWidth:1];
    
    
    [_loginBtn.layer setCornerRadius:5];
    
    [_registerBtn.layer setMasksToBounds:YES];
    [_registerBtn.layer setBorderWidth:1];
    [_registerBtn.layer setCornerRadius:5];
    
    _signupIconLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _signupIconLabel.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-user"];
    [_signupIconLabel setTextColor:[UIColor blackColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    NSMutableDictionary *params = [NSMutableDictionary dictionary];  //参数数组列表
    params[@"user.email"]=username;
    params[@"user.password"]=password;
    params[@"device"]=@"ios";  //设备为ios
    NSString *action = @"/new-shts/login.do";
    NSString *loginUrl = [SERVER_URL stringByAppendingString:action];  //登陆地址
    //NSLog(@"%@",loginUrl);
   // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
    [manager POST:loginUrl parameters:params progress:^(NSProgress *progress){  //开始连接服务器
    
    } success:^(NSURLSessionDataTask *operation,id responseObject){  //通信链接成功
        //NSLog(@"%@",responseObject);
        //NSLog(@"%@",[NSThread currentThread]);
      
        
        NSString *result = [responseObject objectForKey:@"result"];  //获取返回结果
        if([result isEqualToString:@"success"]){  //登陆成功
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults setObject:username forKey:@"username"];
            [userDefaults setObject:password forKey:@"password"];
            [userDefaults synchronize];  //将用户名以及密码都存储到本地
            [self performSegueWithIdentifier:@"FamilyOne" sender:nil];  //跳转页面
            
        }
        else if([result isEqualToString:@"success01"]){  //登陆成功并且已经加入过计划
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults setObject:username forKey:@"username"];
            [userDefaults setObject:password forKey:@"password"];
            [userDefaults synchronize];  //将用户名以及密码都存储到本地
            
            
            [self performSegueWithIdentifier:@"HadJoin" sender:nil];  //跳转页面
            
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

- (IBAction)signupAction:(id)sender {
    
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"功能暂未开放" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //[alert show];
}

-(void)registerCompletion:(NSNotification*)notification{  //注册成功以后自动将用户名传过来填入输入框中
    NSDictionary *theData = [notification userInfo];
    NSString *username = [theData objectForKey:@"username"];
    _usernameInput.text = username;
    
}

@end
