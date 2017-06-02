//
//  RecordItemCell.h
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol myTabVdelegate01<NSObject>
-(void)myTabVClick:(UITableViewCell*)cell;
@end
@interface RecordItemCell : UITableViewCell
@property(assign,nonatomic)id<myTabVdelegate01>delegate;

@property (weak, nonatomic) IBOutlet UILabel *starttime;  //开始时间
@property (weak, nonatomic) IBOutlet UILabel *endtime;  //结束时间
@property (weak, nonatomic) IBOutlet UILabel *distance;  //里程
@property (weak, nonatomic) IBOutlet UILabel *avgspeed;  //平均速度
@property (weak, nonatomic) IBOutlet UILabel *stopnum;  //停留点个数

@property (weak, nonatomic) IBOutlet UIButton *detailButton;  //详情按钮
@property (weak, nonatomic) IBOutlet UILabel *iconLabel01;  //里程图标
@property (weak, nonatomic) IBOutlet UILabel *iconLabel02;  //平均速度图标
@property (weak, nonatomic) IBOutlet UILabel *iconLabel03;  //停留点个数图标



- (IBAction)detailView:(id)sender;

@end
