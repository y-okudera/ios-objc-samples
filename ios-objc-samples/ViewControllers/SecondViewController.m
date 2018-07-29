//
//  SecondViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

#pragma mark - ViewControllerFactory

+ (SecondViewController *)makeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SecondViewController" bundle:nil];
    SecondViewController *secondVC = [storyboard instantiateInitialViewController];
    return secondVC;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
