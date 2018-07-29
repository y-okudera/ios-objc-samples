//
//  PageViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "PageViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface PageViewController () <UIPageViewControllerDataSource>

@end

@implementation PageViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    FirstViewController *firstVC = [FirstViewController makeViewController];
    [self setViewControllers:@[firstVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.dataSource = self;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    if ([viewController isMemberOfClass:[ThirdViewController class]]) {
        return [SecondViewController makeViewController];
    } else if ([viewController isMemberOfClass:[SecondViewController class]]) {
        return [FirstViewController makeViewController];
    } else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    if ([viewController isMemberOfClass:[FirstViewController class]]) {
        return [SecondViewController makeViewController];
    } else if ([viewController isMemberOfClass:[SecondViewController class]]) {
        return [ThirdViewController makeViewController];
    } else {
        return nil;
    }
}

@end
