//
//  PlanItemCell.h
//  shtsios
//
//  Created by cdj on 16/2/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
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
- (IBAction)joinAction:(id)sender;

@end
