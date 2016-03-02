//
//  PlanItemCell.m
//  shtsios
//
//  Created by cdj on 16/2/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "PlanItemCell.h"

@implementation PlanItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)joinAction:(id)sender {
    
    [self.delegate myTabVClick:self];
}
@end
