//
//  FamilyViewController.h
//  shtsios
//
//  Created by cdj on 17/5/30.
//  Copyright © 2017年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
@interface FamilyViewController : UIViewController<NIDropDownDelegate, UITextFieldDelegate>
{
    IBOutlet UIButton *uibtn01;
    NIDropDown *dropDown01;
    IBOutlet UIButton *uibtn02;
    NIDropDown *dropDown02;
    IBOutlet UIButton *uibtn03;
    NIDropDown *dropDown03;
    IBOutlet UIButton *uibtn04;
    NIDropDown *dropDown04;
    IBOutlet UIButton *uibtn05;
    NIDropDown *dropDown05;
    IBOutlet UIButton *uibtn06;
    NIDropDown *dropDown06;
    IBOutlet UIButton *uibtn07;
    NIDropDown *dropDown07;
    IBOutlet UIButton *uibtn08;
    NIDropDown *dropDown08;
    IBOutlet UIButton *uibtn09;
    NIDropDown *dropDown09;
    IBOutlet UIButton *uibtn10;
    NIDropDown *dropDown10;
    IBOutlet UIButton *uibtn11;
    NIDropDown *dropDown11;
    IBOutlet UIButton *uibtn12;
    NIDropDown *dropDown12;
    IBOutlet UIButton *uibtn13;
    NIDropDown *dropDown13;
    IBOutlet UIButton *uibtn14;
    NIDropDown *dropDown14;
    IBOutlet UIButton *uibtn15;
    NIDropDown *dropDown15;
    IBOutlet UIButton *uibtn16;
    NIDropDown *dropDown16;
    IBOutlet UIButton *uibtn17;
    NIDropDown *dropDown17;
    IBOutlet UIButton *uibtn18;
    NIDropDown *dropDown18;
    
    
}
- (IBAction)btn02:(id)sender;
- (IBAction)btn01:(id)sender;
- (IBAction)btn03:(id)sender;
- (IBAction)btn04:(id)sender;
- (IBAction)btn05:(id)sender;
- (IBAction)btn06:(id)sender;
- (IBAction)btn07:(id)sender;
- (IBAction)btn08:(id)sender;
- (IBAction)btn09:(id)sender;
- (IBAction)btn10:(id)sender;

- (IBAction)btn11:(id)sender;
- (IBAction)btn12:(id)sender;
- (IBAction)btn13:(id)sender;
- (IBAction)btn14:(id)sender;
- (IBAction)btn15:(id)sender;
- (IBAction)btn16:(id)sender;
- (IBAction)btn17:(id)sender;
- (IBAction)btn18:(id)sender;

- (IBAction)submit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *familyNum;


@property (retain, nonatomic) IBOutlet UIButton *uibtn01;

@property (retain, nonatomic) IBOutlet UIButton *uibtn02;
@property (retain, nonatomic) IBOutlet UIButton *uibtn03;

@property (retain, nonatomic) IBOutlet UIButton *uibtn04;
@property (retain, nonatomic) IBOutlet UIButton *uibtn05;
@property (retain, nonatomic) IBOutlet UIButton *uibtn06;

@property (retain, nonatomic) IBOutlet UIButton *uibtn07;


@property (retain, nonatomic) IBOutlet UIButton *uibtn08;
@property (retain, nonatomic) IBOutlet UIButton *uibtn09;
@property (retain, nonatomic) IBOutlet UIButton *uibtn10;
@property (retain, nonatomic) IBOutlet UIButton *uibtn11;
@property (retain, nonatomic) IBOutlet UIButton *uibtn12;
@property (retain, nonatomic) IBOutlet UIButton *uibtn13;
@property (retain, nonatomic) IBOutlet UIButton *uibtn14;
@property (retain, nonatomic) IBOutlet UIButton *uibtn15;
@property (retain, nonatomic) IBOutlet UIButton *uibtn16;
@property (retain, nonatomic) IBOutlet UIButton *uibtn17;
@property (retain, nonatomic) IBOutlet UIButton *uibtn18;


@end
