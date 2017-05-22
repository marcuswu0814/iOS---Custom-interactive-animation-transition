//
//  CPAPresentingViewController.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/22.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPAPresentingViewController.h"
#import "CPAPresentedViewController.h"
#import "CPATransitioningDelegate.h"

@interface CPAPresentingViewController ()

@property (nonatomic, strong) id <UIViewControllerTransitioningDelegate> transitioningDelegateForPresent;

@end

@implementation CPAPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickOriginalPresent:(id)sender {
    CPAPresentedViewController *viewController = [CPAPresentedViewController new];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)clickCustomPresent:(id)sender {
    CPAPresentedViewController *viewController = [CPAPresentedViewController new];

    self.transitioningDelegateForPresent = [[CPATransitioningDelegate alloc] initWithToViewController:viewController];
    
    viewController.transitioningDelegate  = self.transitioningDelegateForPresent;
    
    [self presentViewController:viewController animated:YES completion:nil];
}



@end
