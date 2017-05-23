//
//  CPASwipeInteractiveTransition.h
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPASwipeInteractiveTransition : UIPercentDrivenInteractiveTransition

- (instancetype)initWithToViewController:(UIViewController *)toViewController;

@property (nonatomic, readonly) BOOL interacting;

@end
