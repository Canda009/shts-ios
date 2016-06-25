//
//  RegisterViewController.h
//  shtsios
//
//  Created by cdj on 16/6/15.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface RegisterViewController : UIViewController<NIDropDownDelegate>
{
    IBOutlet UIButton *btnSelect;
    NIDropDown *dropDown;
    IBOutlet UIButton *btnSelect1;
    NIDropDown *dropDown1;
    IBOutlet UIButton *btnSelect2;
    NIDropDown *dropDown2;
    IBOutlet UIButton *btnSelect3;
    NIDropDown *dropDown3;
    IBOutlet UIButton *btnSelect4;
    NIDropDown *dropDown4;
}

@property (retain, nonatomic) IBOutlet UIButton *btnSelect;
@property (retain, nonatomic) IBOutlet UIButton *btnSelect1;
@property (retain, nonatomic) IBOutlet UIButton *btnSelect2;
@property (retain, nonatomic) IBOutlet UIButton *btnSelect3;
@property (retain, nonatomic) IBOutlet UIButton *btnSelect4;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgain;
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UILabel *iconLabel01;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel02;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel03;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel04;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel05;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel06;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel07;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel08;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel09;


- (IBAction)selectClicked:(id)sender;
- (IBAction)selectClicked1:(id)sender;
- (IBAction)selectClicked2:(id)sender;
- (IBAction)selectClicked3:(id)sender;
- (IBAction)selectClicked4:(id)sender;
- (IBAction)sumbitClicked:(id)sender;

- (IBAction)backClicked:(id)sender;
-(void)rel;
@end


