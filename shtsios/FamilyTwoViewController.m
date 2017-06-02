//
//  FamilyTwoViewController.m
//  shtsios
//
//  Created by cdj on 17/5/31.
//  Copyright © 2017年 itiis. All rights reserved.
//

#import "FamilyTwoViewController.h"
#import "NIDropDown.h"
#import "Constants.h"
#import <AFHTTPSessionManager.h>
@interface FamilyTwoViewController ()

@end

@implementation FamilyTwoViewController
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
    arr = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4+",nil];
    
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

- (IBAction)btn02:(id)sender {
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"花园住宅", @"公寓", @"职工住宅", @"新式里弄", @"旧式里弄", @"间屋", @"其他",nil];
    
    if(dropDown02 == nil) {
        CGFloat f = 280;
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
    arr = [NSArray arrayWithObjects:@"40平米下", @"40-60平米", @"60-80平米", @"80－100平米", @"100-120平米", @"120-140平米", @"140-160平米", @"160-180平米", @"180-200平米", @"200平米以上",nil];
    
    if(dropDown03 == nil) {
        CGFloat f = 400;
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
    arr = [NSArray arrayWithObjects:@"是", @"否",nil];
    
    if(dropDown04 == nil) {
        CGFloat f = 80;
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
    arr = [NSArray arrayWithObjects:@"不足1个月",@"1－4个月", @"4-8个月", @"8-12个月", @"1年以上",nil];
    
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
    arr = [NSArray arrayWithObjects:@"脚踏自行车",@"电动自行车", @"摩托车", @"出租车", @"地铁轻轨", @"公交", @"驾驶小汽车", @"乘坐小汽车", @"班车", @"轮渡", @"网约车", @"共享单车", @"货车",nil];
    
    if(dropDown06 == nil) {
        CGFloat f = 200;
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
    arr = [NSArray arrayWithObjects:@"省钱",@"省时", @"方便", @"时间上可靠", @"舒适", @"锻炼身体", @"道路交通状况",nil];
    
    if(dropDown07 == nil) {
        CGFloat f = 200;
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
    arr = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"无",nil];
    
    if(dropDown08 == nil) {
        CGFloat f = 200;
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
    arr = [NSArray arrayWithObjects:@"轿车",@"跑车", @"越野车", @"面包车", @"皮卡", @"SUV", @"MPV", @"其他",nil];
    
    if(dropDown09 == nil) {
        CGFloat f = 200;
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
    arr = [NSArray arrayWithObjects:@"愿意",@"不愿意",nil];
    
    if(dropDown10 == nil) {
        CGFloat f = 80;
        dropDown10 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
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
    arr = [NSArray arrayWithObjects:@"距离较远",@"无直达路线", @"候车时间过长", @"首末车时间不合适", @"过于拥挤", @"其他",nil];
    
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

- (IBAction)submit:(id)sender {
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
        params[@"houses"]= [NSString stringWithFormat:@"%d",[dropDown01 selected:uibtn01.titleLabel.text]];
        params[@"housetype1"]= [NSString stringWithFormat:@"%d",[dropDown02 selected:uibtn02.titleLabel.text]];
        params[@"housearea1"]= [NSString stringWithFormat:@"%d",[dropDown03 selected:uibtn03.titleLabel.text]];
        params[@"houseowner"]= [NSString stringWithFormat:@"%d",[dropDown04 selected:uibtn04.titleLabel.text]];
        params[@"houselivetime"]= [NSString stringWithFormat:@"%d",[dropDown05 selected:uibtn05.titleLabel.text]];
        params[@"tripmode"]= [NSString stringWithFormat:@"%d",[dropDown06 selected:uibtn06.titleLabel.text]];
        params[@"reasontripmode"]= [NSString stringWithFormat:@"%d",[dropDown07 selected:uibtn07.titleLabel.text]];
        params[@"buycaryearslater"]= [NSString stringWithFormat:@"%d",[dropDown08 selected:uibtn08.titleLabel.text]];
        
        params[@"will_tripbysubway"]= [NSString stringWithFormat:@"%d",[dropDown10 selected:uibtn10.titleLabel.text]];
        params[@"reason_notSubway"]= [NSString stringWithFormat:@"%d",[dropDown11 selected:uibtn11.titleLabel.text]];
       
        
        
        
        NSString *action = @"/new-shts/questionSurvey.do?action=questionSurvey02";
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
                [self performSegueWithIdentifier:@"FamilyThree" sender:nil];

                
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
