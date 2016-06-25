//
//  RegisterViewController.m
//  shtsios
//
//  Created by cdj on 16/6/15.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "RegisterViewController.h"
#import "NIDropDown.h"
#import <AFHTTPSessionManager.h>
#import "Constants.h"
#import "NSString+FontAwesome.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize btnSelect;
@synthesize btnSelect1;
@synthesize btnSelect2;
@synthesize btnSelect3;
@synthesize btnSelect4;
@synthesize username;
@synthesize password;
@synthesize passwordAgain;
@synthesize name;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    btnSelect.layer.borderWidth = 1;
    btnSelect.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect.layer.cornerRadius = 5;
    
    btnSelect1.layer.borderWidth = 1;
    btnSelect1.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect1.layer.cornerRadius = 5;
    
    btnSelect2.layer.borderWidth = 1;
    btnSelect2.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect2.layer.cornerRadius = 5;
    
    btnSelect3.layer.borderWidth = 1;
    btnSelect3.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect3.layer.cornerRadius = 5;
    
    btnSelect4.layer.borderWidth = 1;
    btnSelect4.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect4.layer.cornerRadius = 5;
    
    
    _iconLabel01.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel01.text = [NSString fontAwesomeIconStringForEnum:FAMobile];
    [_iconLabel01 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel02.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel02.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-lock"];
    [_iconLabel02 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel03.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel03.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-lock"];
    [_iconLabel03 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel04.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel04.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-user"];
    [_iconLabel04 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel05.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel05.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-mars"];
    [_iconLabel05 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel06.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel06.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-user-md"];
    [_iconLabel06 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel07.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel07.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-graduation-cap"];
    [_iconLabel07 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel08.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel08.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-suitcase"];
    [_iconLabel08 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel09.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel09.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-star"];
    [_iconLabel09 setTextColor:[UIColor darkGrayColor]];
    
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

- (IBAction)selectClicked:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"男", @"女", nil];
    //NSArray * arrImage = [[NSArray alloc] init];
    //arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], nil];
    if(dropDown == nil) {
        CGFloat f = 80;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        //[self rel];
        dropDown = nil;
    }

}

- (IBAction)selectClicked1:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"0-18岁", @"18-30岁", @"30-50岁", @"50岁以上",nil];
   
    if(dropDown1 == nil) {
        CGFloat f = 160;
        dropDown1 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown1.delegate = self;
    }
    else {
        [dropDown1 hideDropDown:sender];
        //[self rel];
        dropDown1 = nil;
    }

}

- (IBAction)selectClicked2:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小学", @"初中", @"高中", @"本科", @"硕士及以上",nil];
    
    if(dropDown2 == nil) {
        CGFloat f = 200;
        dropDown2 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown2.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        //[self rel];
        dropDown2 = nil;
    }
}

- (IBAction)selectClicked3:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"无收入", @"0.6万元以下", @"0.6 － 1万元", @"1 － 1.5万元", @"1.5 － 5万元", @"5 － 10万元", @"10 万元以上", nil];
    
    if(dropDown3 == nil) {
        CGFloat f = 200;
        dropDown3 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown3.delegate = self;
    }
    else {
        [dropDown3 hideDropDown:sender];
        //[self rel];
        dropDown3 = nil;
    }
}

- (IBAction)selectClicked4:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"在校中小学生", @"在校大专及以上学生", @"工人", @"公务员", @"事业单位人员 44", @"公司职员", @"服务人员", @"私营个体企业者", @"无业，失业人员", @"离退休人员",@"农民",@"其他",nil];
    
    if(dropDown4 == nil) {
        CGFloat f = 200;
        dropDown4 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown4.delegate = self;
    }
    else {
        [dropDown4 hideDropDown:sender];
        //[self rel];
        dropDown4 = nil;
    }
}


- (IBAction)sumbitClicked:(id)sender {
    if(username.text.length==0 || password.text.length==0 || passwordAgain.text.length==0 || name.text.length==0 ){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"输入不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else {
        if([self validateMobile:username.text]){
            if([btnSelect.titleLabel.text isEqualToString:@"选择"] || [btnSelect1.titleLabel.text isEqualToString:@"选择"] || [btnSelect2.titleLabel.text isEqualToString:@"选择"] || [btnSelect3.titleLabel.text isEqualToString:@"选择"] || [btnSelect4.titleLabel.text isEqualToString:@"选择"]){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"选择项不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
            else{
                if( ![password.text isEqualToString:passwordAgain.text ]){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次输入的密码不一致！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else{
                    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
                    NSMutableDictionary *params = [NSMutableDictionary dictionary];
                    params[@"user.email"]=username.text;
                    params[@"user.password"]=password.text;
                    params[@"user.username"]=name.text;
                    params[@"user.sex"]=btnSelect.titleLabel.text;
                    params[@"user.ageRange"]=btnSelect1.titleLabel.text;
                    params[@"user.education"]=btnSelect2.titleLabel.text;
                    params[@"user.workType"]=btnSelect3.titleLabel.text;
                    params[@"user.industry"]=btnSelect4.titleLabel.text;
                    params[@"device"]=@"ios";
                    
                    NSString *action = @"/new-shts/signup.do";
                    NSString *loginUrl = [SERVER_URL stringByAppendingString:action];
                    //NSLog(@"%@",loginUrl);
                    // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
                    [manager POST:loginUrl parameters:params progress:^(NSProgress *progress){
                        
                    } success:^(NSURLSessionDataTask *operation,id responseObject){
                        //NSLog(@"%@",responseObject);
                        //NSLog(@"%@",[NSThread currentThread]);
                        
                        
                        NSString *result = [responseObject objectForKey:@"result"];
                        if([result isEqualToString:@"success"]){
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                            [alert show];
                            [self dismissViewControllerAnimated:YES completion:^{
                                NSDictionary *dataDict = [NSDictionary dictionaryWithObject:self.username.text forKey:@"username"];
                                [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
                            }];
                           // NSLog(@"reg successed");
                            
                        }
                      
                        else{
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,账号已注册！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                            [alert show];
                           //  NSLog(@"reg failed");
                            //login failed  do  nothing;
                        }
                        
                    } failure:^(NSURLSessionDataTask *operation,NSError *error){
                        //NSLog(@"%@",error);
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,网络故障！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                        //NSLog(@"reg failed");
                    }];
                    
                    
                }
            }
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的11位手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
   
}

- (IBAction)backClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) niDropDownDelegateMethod:(NIDropDown *)sender{
    sender = nil;
    //[self rel];
    //NSLog(@"%@", btnSelect.titleLabel.text);

}

-(void)rel{
    //    [dropDown release];
    dropDown = nil;
}

- (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
