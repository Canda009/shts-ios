//
//  ViewController.h
//  shtsios
//
//  Created by cdj on 16/2/16.
//  Copyright © 2016年 itiis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCalloutView.h"
@protocol SegueDelegate <NSObject>

- (void)DoSegue;

@end

@interface ViewController : UIViewController <SegueDelegate>
-(void)DoSegue;

@end

