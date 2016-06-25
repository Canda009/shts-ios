//
//  SettingViewController.m
//  shtsios
//
//  Created by cdj on 16/2/29.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "SettingViewController.h"
#import "NSString+FontAwesome.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *settingLabel01;
@property (weak, nonatomic) IBOutlet UILabel *settingLabel02;
@property (weak, nonatomic) IBOutlet UILabel *settingLabel03;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _settingLabel01.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _settingLabel01.text = [NSString fontAwesomeIconStringForEnum:FAhistory];
    [_settingLabel01 setTextColor:[UIColor darkGrayColor]];
    
    _settingLabel02.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _settingLabel02.text = [NSString fontAwesomeIconStringForEnum:FABackward];
    [_settingLabel02 setTextColor:[UIColor darkGrayColor]];
    
    _settingLabel03.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _settingLabel03.text = [NSString fontAwesomeIconStringForEnum:FAUser];
    [_settingLabel03 setTextColor:[UIColor darkGrayColor]];
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

- (IBAction)logoutAction:(id)sender {
    /*NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:nil forKey:@"username"];
    [userDefaults setObject:nil forKey:@"password"];
    [userDefaults setObject:nil forKey:@"hadjoin"];
    [userDefaults synchronize];
    [self performSegueWithIdentifier:@"Logout" sender:nil];*/
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"功能暂未开放" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)viewHistory:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"功能暂未开放" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)quitPlan:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"功能暂未开放" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
@end
