//
//  CPATransitioningDelegate.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPATransitioningDelegate.h"
#import "CPAAnimationController.h"
#import "CPASwipeInteractiveTransition.h"

@interface CPATransitioningDelegate ()

@property (nonatomic, strong) CPASwipeInteractiveTransition *swipeInteractiveTransition;
@property (nonatomic, weak) UIViewController *toViewController;

@end

@implementation CPATransitioningDelegate

- (instancetype)initWithToViewController:(UIViewController *)toViewController {
    self = [super init];
    
    if (self) {
        self.toViewController = toViewController;
    }
    
    return self;
}

- (CPASwipeInteractiveTransition *)swipeInteractiveTransition {
    if (!_swipeInteractiveTransition) {
        _swipeInteractiveTransition = [[CPASwipeInteractiveTransition alloc] initWithToViewController:self.toViewController];
    }
    
    return _swipeInteractiveTransition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationController {
    if (!_animationController) {
        _animationController = [[CPAAnimationController alloc] initWithInteractiveTransition:self.swipeInteractiveTransition];
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

#pragma mark - Interactive

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.swipeInteractiveTransition.interacting ? self.swipeInteractiveTransition : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.swipeInteractiveTransition.interacting ? self.swipeInteractiveTransition : nil;
}

@end
