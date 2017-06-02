//
//  FamilyTwoViewController.h
//  shtsios
//
//  Created by cdj on 17/5/31.
//  Copyright © 2017年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface FamilyTwoViewController  : UIViewController<NIDropDownDelegate, UITextFieldDelegate>
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
    
    
}


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
- (IBAction)btn01:(id)sender;

- (IBAction)btn02:(id)sender;
- (IBAction)btn03:(id)sender;
- (IBAction)btn04:(id)sender;
- (IBAction)btn05:(id)sender;
- (IBAction)btn06:(id)sender;
- (IBAction)btn07:(id)sender;
- (IBAction)btn08:(id)sender;
- (IBAction)btn09:(id)sender;

- (IBAction)btn10:(id)sender;

- (IBAction)btn11:(id)sender;

- (IBAction)submit:(id)sender;

@end
