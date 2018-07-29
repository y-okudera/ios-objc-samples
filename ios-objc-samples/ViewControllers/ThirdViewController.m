//
//  ThirdViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

#pragma mark - ViewControllerFactory

+ (ThirdViewController *)makeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ThirdViewController" bundle:nil];
    ThirdViewController *thirdVC = [storyboard instantiateInitialViewController];
    return thirdVC;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
