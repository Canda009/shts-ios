//
//  SurveyViewController.h
//  shtsios
//
//  Created by cdj on 16/7/31.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
@interface SurveyViewController : UIViewController<NIDropDownDelegate, UITextFieldDelegate>
{
    IBOutlet UIButton *select01;
    NIDropDown *dropDown01;
    IBOutlet UIButton *select02;
    NIDropDown *dropDown02;
    IBOutlet UIButton *select03;
    NIDropDown *dropDown03;
    IBOutlet UIButton *select04;
    NIDropDown *dropDown04;
    IBOutlet UIButton *select05;
    NIDropDown *dropDown05;
}
@property (weak, nonatomic) IBOutlet UILabel *label01;
@property (weak, nonatomic) IBOutlet UILabel *label02;
@property (weak, nonatomic) IBOutlet UILabel *label03;
@property (weak, nonatomic) IBOutlet UILabel *label04;
@property (weak, nonatomic) IBOutlet UILabel *label05;
@property (retain, nonatomic) IBOutlet UIButton *select01;
@property (retain, nonatomic) IBOutlet UIButton *select02;
@property (retain, nonatomic) IBOutlet UIButton *select03;
@property (retain, nonatomic) IBOutlet UIButton *select04;
@property (retain, nonatomic) IBOutlet UIButton *select05;
@property (weak, nonatomic) NSString *receive;

@property(retain,nonatomic)NSNumber *rLatitude;
@property(retain,nonatomic)NSNumber *rLongitude;
@property(retain,nonatomic)NSDate *rStoptime;

- (IBAction)selectClicked01:(id)sender;
- (IBAction)selectClicked02:(id)sender;
- (IBAction)selectClicked03:(id)sender;
- (IBAction)selectClicked04:(id)sender;
- (IBAction)selectClicked05:(id)sender;

- (IBAction)submit:(id)sender;
- (IBAction)backClicked:(id)sender;

@end
