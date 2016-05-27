//
//  SettingViewController.m
//  shtsios
//
//  Created by cdj on 16/2/29.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
@end
