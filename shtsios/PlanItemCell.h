//
//  PlanItemCell.h
//  shtsios
//
//  Created by cdj on 16/2/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"
@protocol myTabVdelegate<NSObject>
-(void)myTabVClick:(UITableViewCell*)cell;
@end

@interface PlanItemCell : UITableViewCell
@property(assign,nonatomic)id<myTabVdelegate>delegate;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *purposeLabel;

@property (weak, nonatomic) IBOutlet UILabel *organizerLabel;
@property (weak, nonatomic) IBOutlet UILabel *startendLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UIButton *joinButton;

@property (weak, nonatomic) IBOutlet UILabel *iconLabel01;

@property (weak, nonatomic) IBOutlet UILabel *iconLabel02;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel03;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel04;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel05;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel06;


- (IBAction)joinAction:(id)sender;

@end
