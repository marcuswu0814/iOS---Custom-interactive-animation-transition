//
//  CPATransitioningDelegate.h
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CPAAnimationController;

@interface CPATransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

- (instancetype)initWithToViewController:(UIViewController *)toViewController;

@property (nonatomic, strong) CPAAnimationController *animationController;

@end
