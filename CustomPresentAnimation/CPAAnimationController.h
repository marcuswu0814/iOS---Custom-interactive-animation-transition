//
//  CPAAnimationController.h
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CPASwipeInteractiveTransition;

@interface CPAAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithInteractiveTransition:(CPASwipeInteractiveTransition *)interactiveTransition;

@property (nonatomic) BOOL isDismiss;

@end
