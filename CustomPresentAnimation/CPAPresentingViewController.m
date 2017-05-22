//
//  CPAPresentingViewController.m
//  CustomPresentAnimation
//
//  Created by Marcus Wu on 2017/5/22.
//  Copyright © 2017年 marcus.wu. All rights reserved.
//

#import "CPAPresentingViewController.h"
#import "CPAPresentedViewController.h"

@interface CPAPresentingViewController ()

@end

@implementation CPAPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickOriginalPresent:(id)sender {
    CPAPresentedViewController *viewContrller = [CPAPresentedViewController new];
    
    [self presentViewController:viewContrller animated:YES completion:nil];
}

- (IBAction)clickCustomPresent:(id)sender {
}



@end
