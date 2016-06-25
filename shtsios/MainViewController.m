//
//  MainViewController.m
//  shtsios
//
//  Created by cdj on 16/2/21.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "MainViewController.h"
#import "NSString+FontAwesome.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
//@property (strong, nonatomic)  UIButton *star;
//@property (weak, nonatomic) IBOutlet UIButton *emailBtn;

//@property (weak, nonatomic) IBOutlet UIButton *tryBtn;

@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@end

@implementation MainViewController
{
   // UIButton *_star;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){255,251,240,1});
    
    
    [_phoneBtn.layer setMasksToBounds:YES];
    [_phoneBtn.layer setBorderWidth:1];
    [_phoneBtn.layer setCornerRadius:10];   
    [_phoneBtn.layer setBorderColor:color];
    
    /*
    [_emailBtn.layer setMasksToBounds:YES];
    [_emailBtn.layer setBorderWidth:1];
    [_emailBtn.layer setCornerRadius:10];
    [_emailBtn.layer setBorderColor:color];
    
    [_tryBtn.layer setMasksToBounds:YES];
    [_tryBtn.layer setBorderWidth:1];
    [_tryBtn.layer setCornerRadius:10];
    [_tryBtn.layer setBorderColor:color];
*/
    
    //_star = [UIButton buttonWithType:UIButtonTypeCustom];
    //star.tag = i;
    //_star.frame = CGRectMake(60.f, 200.f, 40.f, 40.f);
    /*
    _star.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _star.titleLabel.shadowOffset = CGSizeMake(0, -1);
    [_star setTitle:[NSString fontAwesomeIconStringForEnum:FAIconStarEmpty] forState:UIControlStateNormal];
    [_star setTitle:[NSString fontAwesomeIconStringForEnum:FAIconStar] forState:UIControlStateSelected];
    [_star setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_star addTarget:self action:@selector(didSelectStar:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_star];
     */
    
    _iconLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _iconLabel.text = [NSString fontAwesomeIconStringForEnum:FAMobile];
    [_iconLabel setTextColor:[UIColor whiteColor]];
   
    
}
/*
- (void)didSelectStar:(id)sender
{
    
        [_star setSelected:true];
}
 */
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
