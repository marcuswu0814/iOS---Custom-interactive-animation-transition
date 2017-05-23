//
//  CPAAnimationController.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPAAnimationController.h"
#import "CPASwipeInteractiveTransition.h"

@interface CPAAnimationController ()

@property (nonatomic, weak) CPASwipeInteractiveTransition *interactiveTransition;

@end

@implementation CPAAnimationController

- (instancetype)initWithInteractiveTransition:(CPASwipeInteractiveTransition *)interactiveTransition {
    self = [super init];
    
    if (self) {
        self.interactiveTransition = interactiveTransition;
    }
    
    return self;
}

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

    if (self.interactiveTransition.interacting) {
        // Only possible happend when dismissed
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, bounds.size.width, 0);
                             toViewController.view.alpha = 1.0f;
                             toViewController.view.transform = CGAffineTransformIdentity;
                         } completion:^(BOOL finished) {
                             BOOL wasCancelled = [transitionContext transitionWasCancelled];

                             toViewController.view.transform = CGAffineTransformIdentity;
                             
                             [transitionContext completeTransition:!wasCancelled];
                         }];
    } else {
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
                             BOOL wasCancelled = [transitionContext transitionWasCancelled];

                             if (!wasCancelled && !self.isDismiss) {
                                 fromViewController.view.transform = CGAffineTransformIdentity;
                             }
                             
                             [transitionContext completeTransition:!wasCancelled];
                         }];

    }
}

@end
