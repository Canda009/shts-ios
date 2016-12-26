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
@synthesize btnSelect5;
@synthesize btnSelect6;
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
    
    btnSelect5.layer.borderWidth = 1;
    btnSelect5.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect5.layer.cornerRadius = 5;
    
    btnSelect6.layer.borderWidth = 1;
    btnSelect6.layer.borderColor = [[UIColor blackColor] CGColor];
    btnSelect6.layer.cornerRadius = 5;
    
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
    
    _iconLabel10.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel10.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-star"];
    [_iconLabel10 setTextColor:[UIColor darkGrayColor]];
    
    _iconLabel11.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    _iconLabel11.text = [NSString fontAwesomeIconStringForIconIdentifier:@"fa-star"];
    [_iconLabel11 setTextColor:[UIColor darkGrayColor]];
    
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
        [dropDown2 hideDropDown:sender];
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
    arr = [NSArray arrayWithObjects:@"第一产业", @"第二产业", @"第三产业", @"其他",nil];
    
    if(dropDown4 == nil) {
        CGFloat f = 160;
        dropDown4 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown4.delegate = self;
    }
    else {
        [dropDown4 hideDropDown:sender];
        //[self rel];
        dropDown4 = nil;
    }
}

- (IBAction)selectClicked5:(id)sender {
    /*
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"000", @"111", @"222", @"333",nil];
    
    if(dropDown5 == nil) {
        CGFloat f = 160;
        dropDown5 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown5.delegate = self;
    }
    else {
        [dropDown5 hideDropDown:sender];
        //[self rel];
        dropDown5 = nil;
    }
*/
    
    
    if([btnSelect4.titleLabel.text isEqualToString:@"选择"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"行业大类不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        NSArray * arr = [[NSArray alloc] init];
        
        

        if([btnSelect4.titleLabel.text isEqualToString:@"第一产业"]){
            arr = [NSArray arrayWithObjects:@"农业", @"林业", @"牧业", @"渔业",@"其他",nil];
        }
        if([btnSelect4.titleLabel.text isEqualToString:@"第二产业"]){
            arr = [NSArray arrayWithObjects:@"采矿业", @"制造业", @"电力燃气及水供应业", @"建筑业",nil];
        }
        if([btnSelect4.titleLabel.text isEqualToString:@"第三产业"]){
            arr = [NSArray arrayWithObjects:@"交通运输仓储邮政业", @"信息传输计算机业", @"批发零售餐饮业", @"金融房地产商业服务业",@"其他",nil];
        }
        if([btnSelect4.titleLabel.text isEqualToString:@"其他"]){
            arr = [NSArray arrayWithObjects:@"其他",nil];
        }
        if(dropDown5 == nil) {
            CGFloat f = 200;
            dropDown5 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
            dropDown5.delegate = self;
        }
        else {
            [dropDown5 hideDropDown:sender];
            //[self rel];
            dropDown5 = nil;
        }

    }
}

- (IBAction)selectClicked6:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"国家机关、党群组织、企业、事业单位负责人", @"专业技术人员", @"办事人员和有关人员", @"商业、服务人员",@"农林牧渔水利业生产人员",@"生产、运输设备操作人员",@"退休或无业人员",@"其他",nil];
    
    if(dropDown6 == nil) {
        CGFloat f = 160;
        dropDown6 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown6.delegate = self;
    }
    else {
        [dropDown6 hideDropDown:sender];
        //[self rel];
        dropDown6 = nil;
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
