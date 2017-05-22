//
//  CPAAnimationController.h
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/23.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CPAAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isDismiss;

@end
