//
//  MainViewController.m
//  shtsios
//
//  Created by cdj on 16/2/21.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *emailBtn;

@property (weak, nonatomic) IBOutlet UIButton *tryBtn;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){255,251,240,1});
    
    
    [_phoneBtn.layer setMasksToBounds:YES];
    [_phoneBtn.layer setBorderWidth:1];
    [_phoneBtn.layer setCornerRadius:10];   
    [_phoneBtn.layer setBorderColor:color];
    
    
    [_emailBtn.layer setMasksToBounds:YES];
    [_emailBtn.layer setBorderWidth:1];
    [_emailBtn.layer setCornerRadius:10];
    [_emailBtn.layer setBorderColor:color];
    
    [_tryBtn.layer setMasksToBounds:YES];
    [_tryBtn.layer setBorderWidth:1];
    [_tryBtn.layer setCornerRadius:10];
    [_tryBtn.layer setBorderColor:color];

}
-(void)viewDidAppear:(BOOL)animated{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    NSString *hadjoin = [userDefault objectForKey:@"hadjoin"];
   
    
     if(username != nil){
        // [self performSegueWithIdentifier:@"HadLogin" sender:nil];
     //NSLog(@"the username is %@",username);
         
         if ([hadjoin isEqualToString:@"yes"]) {
             [self performSegueWithIdentifier:@"LoginAndJoin" sender:nil];
         }
         else {
             [self performSegueWithIdentifier:@"HadLogin" sender:nil];
         }
         
     }
	
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
