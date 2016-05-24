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

@property (weak, nonatomic) IBOutlet UILabel *starttime;
@property (weak, nonatomic) IBOutlet UILabel *endtime;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *avgspeed;
@property (weak, nonatomic) IBOutlet UILabel *stopnum;

@property (weak, nonatomic) IBOutlet UIButton *detailButton;
- (IBAction)detailView:(id)sender;

@end
