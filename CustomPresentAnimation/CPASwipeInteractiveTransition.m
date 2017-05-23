//
//  CPASwipeInteractiveTransition.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPASwipeInteractiveTransition.h"

@interface CPASwipeInteractiveTransition ()

@property (nonatomic, weak) UIViewController *toViewController;
@property (nonatomic) BOOL interacting;
@property (nonatomic) BOOL shouldComplete;

@end

@implementation CPASwipeInteractiveTransition

- (instancetype)initWithToViewController:(UIViewController *)toViewController {
    self = [super init];
    
    if (self) {
        self.toViewController = toViewController;
        [self prepareGestureRecognizerInView:toViewController.view];
    }
    
    return self;
}

- (void)prepareGestureRecognizerInView:(UIView *)view {
    UIScreenEdgePanGestureRecognizer *leftGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    leftGesture.edges = UIRectEdgeLeft;
    
    [view addGestureRecognizer:leftGesture];
}

- (void)swipe:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    CGFloat width = CGRectGetWidth(gestureRecognizer.view.superview.bounds);
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            
            [self.toViewController dismissViewControllerAnimated:YES completion:nil];
            
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = translation.x / width;
            
            //Limit it between 0 and 1
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.3);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            
            self.interacting = NO;
            
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            
            break;
        default:
            break;
    }
}

@end
