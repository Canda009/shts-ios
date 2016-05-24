//
//  RecordItemCell.m
//  shtsios
//
//  Created by cdj on 16/5/24.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import "RecordItemCell.h"

@implementation RecordItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)detailView:(id)sender {
    [self.delegate myTabVClick:self];
}

@end
