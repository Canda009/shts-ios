//
//  CustomAnnotationView.m
//  CustomAnnotationDemo
//
//  Created by songjian on 13-3-11.
//  Copyright (c) 2013年 songjian. All rights reserved.
//

#import "CustomAnnotationView.h"
#import "CustomCalloutView.h"
#import "ViewController.h"
#import "SurveyViewController.h"
#define kWidth  150.f
#define kHeight 60.f

#define kHoriMargin 5.f
#define kVertMargin 5.f

#define kPortraitWidth  50.f
#define kPortraitHeight 50.f

#define kCalloutWidth   200.0
#define kCalloutHeight  70.0


@interface CustomAnnotationView ()
//@property (nonatomic, strong) UIImageView *portraitImageView;
//@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation CustomAnnotationView
//@synthesize delegate;
@synthesize calloutView;
@synthesize date;
@synthesize title;
//@synthesize portraitImageView   = _portraitImageView;
//@synthesize nameLabel           = _nameLabel;

#pragma mark - Handle Action

- (void)btnAction
{
    CLLocationCoordinate2D coorinate = [self.annotation coordinate];
    
    //NSLog(@"coordinate = {%f, %f}", coorinate.latitude, coorinate.longitude);
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SurveyViewController *vc = [story instantiateViewControllerWithIdentifier:@"SurveyViewController"];
    //vc setValue:coorinate.latitude forKey:rLatitude;
    vc.rLatitude = [NSNumber numberWithDouble:coorinate.latitude];
    vc.rLongitude = [NSNumber numberWithDouble:coorinate.longitude] ;
    [[self viewController].navigationController pushViewController:vc animated:YES];
   // [self.delegate DoSegue];
    //[super performSegueWithIdentifier:@"SurveyView" sender:self];

}

- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - Override
/*
- (NSString *)name
{
    return self.nameLabel.text;
}

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

- (UIImage *)portrait
{
    return self.portraitImageView.image;
}

- (void)setPortrait:(UIImage *)portrait
{
    self.portraitImageView.image = portrait;
}*/

- (void)setSelected:(BOOL)selected
{
    [self setSelected:selected animated:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            /* Construct custom callout. */
            self.calloutView = [[CustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(10, 10, 40, 40);
            [btn setTitle:@"Add" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
            
            [self.calloutView addSubview:btn];
            
            UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 100, 30)];
            name.backgroundColor = [UIColor clearColor];
            name.textColor = [UIColor whiteColor];
            if (title == nil || title == NULL) {
                title=@"停留点";
            }else{
            }
            name.text = title;
            [self.calloutView addSubview:name];
        }
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL inside = [super pointInside:point withEvent:event];
    /* Points that lie outside the receiver’s bounds are never reported as hits,
     even if they actually lie within one of the receiver’s subviews.
     This can occur if the current view’s clipsToBounds property is set to NO and the affected subview extends beyond the view’s bounds.
     */
    if (!inside && self.selected)
    {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    
    return inside;
}

#pragma mark - Life Cycle

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.image=[UIImage imageNamed:@"tweet_selected"];
        
        /* Create portrait image view and add to view hierarchy. */
        //self.portraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kHoriMargin, kVertMargin, kPortraitWidth, kPortraitHeight)];
        //[self addSubview:self.portraitImageView];
        
        /* Create name label. */
        /*
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPortraitWidth + kHoriMargin,
                                                                   kVertMargin,
                                                                   kWidth - kPortraitWidth - kHoriMargin,
                                                                   kHeight - 2 * kVertMargin)];
        self.nameLabel.backgroundColor  = [UIColor clearColor];
        self.nameLabel.textAlignment    = NSTextAlignmentCenter;
        self.nameLabel.textColor        = [UIColor whiteColor];
        self.nameLabel.font             = [UIFont systemFontOfSize:15.f];
        [self addSubview:self.nameLabel];*/
    }
    
    return self;
}
/*
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint tempoint = [self.calloutView.navBtn convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.calloutView.navBtn.bounds, tempoint))
        {
            view = self.calloutView.navBtn;
        }
    }
    return view;
}
*/
@end
