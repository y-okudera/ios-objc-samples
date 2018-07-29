//
//  FirstViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

#pragma mark - ViewControllerFactory

+ (FirstViewController *)makeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FirstViewController" bundle:nil];
    FirstViewController *firstVC = [storyboard instantiateInitialViewController];
    return firstVC;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
