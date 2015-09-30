//
//  ViewController.h
//  SphereMenu
//
//  Created by Tu You on 14-8-24.
//  Copyright (c) 2014年 TU YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SphereItemDelegate<NSObject>
- (void) positionPanItem:(CGFloat) x :(CGFloat) y;
@end

@interface ViewController : UIViewController
@property (nonatomic,weak) id<SphereItemDelegate> delegate;

@end
