//
//  CustomAnnotationView.h
//  CustomAnnotationDemo
//
//  Created by songjian on 13-3-11.
//  Copyright (c) 2013年 songjian. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "ViewController.h"
@interface CustomAnnotationView : MAAnnotationView
/*{
    id<SegueDelegate> delegate;
}*/
//@property (nonatomic, retain) NSObject<SegueDelegate> *delegate;
@property (nonatomic, copy) NSDate *date;

//@property (nonatomic, strong) UIImage *portrait;

@property (nonatomic, strong) UIView *calloutView;

@end
