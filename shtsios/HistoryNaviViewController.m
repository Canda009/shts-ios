//
//  HistoryNaviViewController.m
//  shtsios
//
//  Created by cdj on 16/6/21.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "HistoryNaviViewController.h"

@interface HistoryNaviViewController ()

@end

@implementation HistoryNaviViewController

@synthesize receiveDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"navi-%@",receiveDate);
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

@end
