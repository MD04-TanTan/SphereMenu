//
//  ViewController.m
//  SphereMenu
//
//  Created by Tu You on 14-8-24.
//  Copyright (c) 2014年 TU YOU. All rights reserved.
//

#import "ViewController.h"
#import "SphereMenu.h"

@interface ViewController () <SphereMenuDelegate>{
    SphereMenu *sphereMenu;
}


@property UIPanGestureRecognizer * panGesture;
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.58 blue:0.27 alpha:1];
    
    UIImage *startImage = [UIImage imageNamed:@"start"];
    UIImage *image1 = [UIImage imageNamed:@"icon-twitter"];
    UIImage *image2 = [UIImage imageNamed:@"icon-email"];
    UIImage *image3 = [UIImage imageNamed:@"icon-facebook"];
    NSArray *images = @[image1, image2, image3];
     sphereMenu= [[SphereMenu alloc] initWithStartPoint:CGPointMake(CGRectGetWidth(self.view.frame) / 2, 320)
                                                         startImage:startImage
                                                      submenuImages:images];
    sphereMenu.sphereDamping = 0.3;
    sphereMenu.sphereLength = 85;
    sphereMenu.delegate = self;
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [sphereMenu addGestureRecognizer:_panGesture];
    [self.view addSubview:sphereMenu];
}

- (void)sphereDidSelected:(int)index
{
    NSLog(@"sphere %d selected", index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- ( void) panGesture:(UIPanGestureRecognizer *) gesture{
    CGFloat x = [gesture locationInView:self.view].x;
    CGFloat y = [gesture locationInView:self.view].y;
    //Point point =
    NSNumber * numbX = @(x);
    NSNumber * numbY = @(y);
    
    sphereMenu.center = CGPointMake(x, y);
    //NSLog(@"%f %f",x,y);
//    if ([self.delegate respondsToSelector:@selector(positionPanItem::)]) {
//        [self.delegate positionPanItem:x :y];
//    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:self userInfo:@{@"pointX":numbX,@"pointY":numbY}];
    
}

@end
