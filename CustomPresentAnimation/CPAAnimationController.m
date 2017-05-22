//
//  CPAAnimationController.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPAAnimationController.h"

@implementation CPAAnimationController


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return .7;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrameForToView = [transitionContext finalFrameForViewController:toViewController];
    UIView *containerView = transitionContext.containerView;
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    [containerView addSubview:toViewController.view];
    
    if (!self.isDismiss) {
        toViewController.view.frame = CGRectOffset(finalFrameForToView,bounds.size.width, 0);
    } else {
        toViewController.view.frame = finalFrameForToView;
        toViewController.view.alpha = 0.5f;
        toViewController.view.transform = CGAffineTransformMakeScale(0.96, 0.96);
        [containerView sendSubviewToBack:toViewController.view];
    }

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:1.f
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         if (!self.isDismiss) {
                             fromViewController.view.alpha = 0.5f;
                             fromViewController.view.transform = CGAffineTransformMakeScale(0.96, 0.96);
                             toViewController.view.frame = finalFrameForToView;
                         } else {
                             fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, bounds.size.width, 0);
                             toViewController.view.alpha = 1.0f;
                             toViewController.view.transform = CGAffineTransformIdentity;
                         }
                     } completion:^(BOOL finished) {
                         if (!self.isDismiss) {
                             fromViewController.view.transform = CGAffineTransformIdentity;
                         }
                         
                         [transitionContext completeTransition:YES];
                     }];
}

@end
