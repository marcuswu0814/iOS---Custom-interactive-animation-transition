//
//  CPAPresentedViewController.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/22.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPAPresentedViewController.h"

@interface CPAPresentedViewController ()

@end

@implementation CPAPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
