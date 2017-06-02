//
//  FamilyThreeViewController.m
//  shtsios
//
//  Created by cdj on 17/6/1.
//  Copyright © 2017年 itiis. All rights reserved.
//

#import "FamilyThreeViewController.h"
#import "NIDropDown.h"
#import "Constants.h"
#import <AFHTTPSessionManager.h>
@interface FamilyThreeViewController ()

@end

@implementation FamilyThreeViewController
@synthesize uibtn01;
@synthesize uibtn02;
@synthesize uibtn03;
@synthesize uibtn04;
@synthesize uibtn05;
@synthesize uibtn06;
@synthesize uibtn07;
@synthesize uibtn08;
@synthesize uibtn09;
@synthesize uibtn10;
@synthesize uibtn11;
@synthesize uibtn12;
@synthesize uibtn13;
@synthesize uibtn14;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    uibtn01.layer.borderWidth = 1;
    uibtn01.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn01.layer.cornerRadius = 5;
    
    
    uibtn02.layer.borderWidth = 1;
    uibtn02.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn02.layer.cornerRadius = 5;
    
    uibtn03.layer.borderWidth = 1;
    uibtn03.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn03.layer.cornerRadius = 5;
    
    uibtn04.layer.borderWidth = 1;
    uibtn04.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn04.layer.cornerRadius = 5;
    
    uibtn05.layer.borderWidth = 1;
    uibtn05.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn05.layer.cornerRadius = 5;
    
    uibtn06.layer.borderWidth = 1;
    uibtn06.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn06.layer.cornerRadius = 5;
    
    uibtn07.layer.borderWidth = 1;
    uibtn07.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn07.layer.cornerRadius = 5;
    
    uibtn08.layer.borderWidth = 1;
    uibtn08.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn08.layer.cornerRadius = 5;
    
    uibtn09.layer.borderWidth = 1;
    uibtn09.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn09.layer.cornerRadius = 5;
    
    uibtn10.layer.borderWidth = 1;
    uibtn10.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn10.layer.cornerRadius = 5;
    
    uibtn11.layer.borderWidth = 1;
    uibtn11.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn11.layer.cornerRadius = 5;
    
    uibtn12.layer.borderWidth = 1;
    uibtn12.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn12.layer.cornerRadius = 5;
    
    uibtn13.layer.borderWidth = 1;
    uibtn13.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn13.layer.cornerRadius = 5;
    
    uibtn14.layer.borderWidth = 1;
    uibtn14.layer.borderColor = [[UIColor blackColor] CGColor];
    uibtn14.layer.cornerRadius = 5;

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

- (IBAction)btn01:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"是", @"否",nil];
    
    if(dropDown01 == nil) {
        CGFloat f = 80;
        dropDown01 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        
        dropDown01.delegate = self;
    }
    else {
        [dropDown01 hideDropDown:sender];
        //[self rel];
        dropDown01 = nil;
    }
}

- (IBAction)btn02:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"半年", @"半年－1年", @"1-2年", @"2年以上",nil];
    
    if(dropDown02 == nil) {
        CGFloat f = 160;
        dropDown02 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown02.delegate = self;
    }
    else {
        [dropDown02 hideDropDown:sender];
        //[self rel];
        dropDown02 = nil;
    }
}

- (IBAction)btn03:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"花园住宅", @"公寓", @"职工住宅", @"新式里弄", @"旧式里弄", @"间屋", @"其他",nil];

    
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

- (IBAction)btn04:(id)sender {
    
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"40平米下", @"40-60平米", @"60-80平米", @"80－100平米", @"100-120平米", @"120-140平米", @"140-160平米", @"160-180平米", @"180-200平米", @"200平米以上",nil];
    
    if(dropDown04 == nil) {
        CGFloat f = 280;
        dropDown04 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown04.delegate = self;
    }
    else {
        [dropDown04 hideDropDown:sender];
        //[self rel];
        dropDown04 = nil;
    }
}

- (IBAction)btn05:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"交通便利",@"环境宜人", @"价格便宜", @"其他",nil];
    
    if(dropDown05 == nil) {
        CGFloat f = 80;
        dropDown05 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown05.delegate = self;
    }
    else {
        [dropDown05 hideDropDown:sender];
        //[self rel];
        dropDown05 = nil;
    }
}

- (IBAction)btn06:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"赵巷镇",@"涂泾镇", @"华新镇", @"重固镇", @"白鹤镇", @"朱家角镇", @"练塘镇", @"金泽镇", @"夏阳街道", @"盈浦街道", @"香花桥街道",nil];
    
    if(dropDown06 == nil) {
        CGFloat f = 280;
        dropDown06 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown06.delegate = self;
    }
    else {
        [dropDown06 hideDropDown:sender];
        //[self rel];
        dropDown06 = nil;
    }
}

- (IBAction)btn07:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"公汽地铁／2小时15分／6元", @"出租车／1小时44分／147元",nil];
    
    if(dropDown07 == nil) {
        CGFloat f = 120;
        dropDown07 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown07.delegate = self;
    }
    else {
        [dropDown07 hideDropDown:sender];
        //[self rel];
        dropDown07 = nil;
    }

}

- (IBAction)btn08:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"公汽地铁／2小时15分／6元", @"出租车／1小时44分／147元",nil];
    
    if(dropDown08 == nil) {
        CGFloat f = 120;
        dropDown08 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown08.delegate = self;
    }
    else {
        [dropDown08 hideDropDown:sender];
        //[self rel];
        dropDown08 = nil;
    }
}

- (IBAction)btn09:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"公汽地铁／2小时15分／6元", @"出租车／1小时44分／147元",nil];
    
    if(dropDown09 == nil) {
        CGFloat f = 120;
        dropDown09 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown09.delegate = self;
    }
    else {
        [dropDown09 hideDropDown:sender];
        //[self rel];
        dropDown09 = nil;
    }

}

- (IBAction)btn10:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"地铁／52分／12元", @"地铁／62分／8元",@"地铁／70分／4元",nil];
    
    if(dropDown10 == nil) {
        CGFloat f = 160;
        dropDown10 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown10.delegate = self;
    }
    else {
        [dropDown10 hideDropDown:sender];
        //[self rel];
        dropDown10 = nil;
    }

}

- (IBAction)btn11:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"地铁／52分／12元", @"地铁／62分／8元",@"地铁／70分／4元",nil];
    
    if(dropDown11 == nil) {
        CGFloat f = 160;
        dropDown11 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown11.delegate = self;
    }
    else {
        [dropDown11 hideDropDown:sender];
        //[self rel];
        dropDown11 = nil;
    }
}

- (IBAction)btn12:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
   arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"地铁／52分／12元", @"地铁／62分／8元",@"地铁／70分／4元",nil];
    
    if(dropDown12 == nil) {
        CGFloat f = 160;
        dropDown12 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown12.delegate = self;
    }
    else {
        [dropDown12 hideDropDown:sender];
        //[self rel];
        dropDown12 = nil;
    }
}

- (IBAction)sumbit:(id)sender {
    
    if([uibtn01.titleLabel.text isEqualToString:@"选择"]
       || [uibtn02.titleLabel.text isEqualToString:@"选择"]
       || [uibtn03.titleLabel.text isEqualToString:@"选择"]
       || [uibtn04.titleLabel.text isEqualToString:@"选择"]
       || [uibtn05.titleLabel.text isEqualToString:@"选择"]
       || [uibtn06.titleLabel.text isEqualToString:@"选择"]
       || [uibtn07.titleLabel.text isEqualToString:@"选择"]
       || [uibtn08.titleLabel.text isEqualToString:@"选择"]
       || [uibtn09.titleLabel.text isEqualToString:@"选择"]
       || [uibtn10.titleLabel.text isEqualToString:@"选择"]
       || [uibtn11.titleLabel.text isEqualToString:@"选择"]
       || [uibtn12.titleLabel.text isEqualToString:@"选择"]
       || [uibtn14.titleLabel.text isEqualToString:@"选择"]
       || [uibtn13.titleLabel.text isEqualToString:@"选择"]
       ){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"选择项不能为空！"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        
        
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];  //填写信息存入参数列表
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];  //从本地数据取得用户名
        
        NSString *username = [userDefault objectForKey:@"username"];
        params[@"user_email"]= username;
        params[@"willbuehouse"]= [NSString stringWithFormat:@"%d",[dropDown01 selected:uibtn01.titleLabel.text]];
        params[@"buyHouseYearLater"]= [NSString stringWithFormat:@"%d",[dropDown02 selected:uibtn02.titleLabel.text]];
        params[@"buyHouseType"]= [NSString stringWithFormat:@"%d",[dropDown03 selected:uibtn03.titleLabel.text]];
        params[@"buyHouseArea"]= [NSString stringWithFormat:@"%d",[dropDown04 selected:uibtn04.titleLabel.text]];
        params[@"buyHouseFactors"]= [NSString stringWithFormat:@"%d",[dropDown05 selected:uibtn05.titleLabel.text]];
        params[@"buyHouseLocation"]= [NSString stringWithFormat:@"%d",[dropDown06 selected:uibtn06.titleLabel.text]];
        params[@"firstChoiceOfNO1"]= [NSString stringWithFormat:@"%d",[dropDown07 selected:uibtn07.titleLabel.text]];
        params[@"secondChoiceOfNO1"]= [NSString stringWithFormat:@"%d",[dropDown08 selected:uibtn08.titleLabel.text]];
        params[@"thirdChoiceOfNO1"]= [NSString stringWithFormat:@"%d",[dropDown08 selected:uibtn08.titleLabel.text]];
        
        params[@"firstChoiceOfNO2"]= [NSString stringWithFormat:@"%d",[dropDown10 selected:uibtn10.titleLabel.text]];
        params[@"secondChoiceOfNO2"]= [NSString stringWithFormat:@"%d",[dropDown11 selected:uibtn11.titleLabel.text]];
        params[@"thirdChoiceOfNO2"]= [NSString stringWithFormat:@"%d",[dropDown12 selected:uibtn12.titleLabel.text]];
        params[@"forthChoiceOfNO2"]= [NSString stringWithFormat:@"%d",[dropDown14 selected:uibtn13.titleLabel.text]];
        params[@"priorityfactors"]= [NSString stringWithFormat:@"%d",[dropDown14 selected:uibtn13.titleLabel.text]];
        
        
        
        
        NSString *action = @"/new-shts/questionSurvey.do?action=questionSurvey03";
        NSString *loginUrl = [SERVER_URL stringByAppendingString:action];
        //NSLog(@"%@",loginUrl);
        // NSDictionary *loginDict = @{@"user.email":@"8888",@"user.password":@"8888",@"device":@"ios"};
        [manager POST:loginUrl parameters:params progress:^(NSProgress *progress){
            
        } success:^(NSURLSessionDataTask *operation,id responseObject){
            //NSLog(@"%@",responseObject);
            //NSLog(@"%@",[NSThread currentThread]);
            
            
            NSString *result = [responseObject objectForKey:@"result"];
            if([result isEqualToString:@"success"]){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"提交成功！"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                [alert show];
                [self performSegueWithIdentifier:@"CompleteSurvey" sender:nil];
                
            }
            
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"提交失败！"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                [alert show];
                //  NSLog(@"reg failed");
                //login failed  do  nothing;
            }
            
        } failure:^(NSURLSessionDataTask *operation,NSError *error){
            //NSLog(@"%@",error);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"提交失败,网络故障！"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            //NSLog(@"reg failed");
        }];
        
        //
        
    }
    
    
}

- (IBAction)btn13:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"出行的费用",@"出行的时间", @"发车频率",@"健康／安全",@"其他",nil];
    
    if(dropDown13 == nil) {
        CGFloat f = 160;
        dropDown13 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown13.delegate = self;
    }
    else {
        [dropDown13 hideDropDown:sender];
        //[self rel];
        dropDown13 = nil;
    }
    
}

- (IBAction)btn14:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"小汽车/1小时44分／54元",@"地铁／52分／12元", @"地铁／62分／8元",@"地铁／70分／4元",nil];
    
    if(dropDown14 == nil) {
        CGFloat f = 160;
        dropDown14 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"up"];
        dropDown14.delegate = self;
    }
    else {
        [dropDown14 hideDropDown:sender];
        //[self rel];
        dropDown14 = nil;
    }
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
    dropDown06 = nil;
    dropDown07 = nil;
    dropDown08 = nil;
    dropDown09 = nil;
    dropDown10 = nil;
    dropDown11 = nil;
    dropDown12 = nil;
    
    
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



@end
