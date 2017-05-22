//
//  CPATransitioningDelegate.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPATransitioningDelegate.h"
#import "CPAAnimationController.h"


@implementation CPATransitioningDelegate

- (instancetype)initWithToViewController:(UIViewController *)toViewController {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}


- (id <UIViewControllerAnimatedTransitioning>)animationController {
    if (!_animationController) {
        _animationController = [[CPAAnimationController alloc] init];
    }
    
    return _animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.animationController.isDismiss = YES;
    
    return self.animationController;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source {
    self.animationController.isDismiss = NO;
    
    return self.animationController;
}


@end
