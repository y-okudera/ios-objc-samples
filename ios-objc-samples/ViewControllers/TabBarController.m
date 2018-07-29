//
//  TabBarController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "TabBarController.h"
#import "ListViewController.h"
#import "ConfigurationViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)loadView {
    [super loadView];
    [self setupTabBarIcons];
}

- (void)setupTabBarIcons {
    NSArray *viewControllers = self.viewControllers;
    for (__kindof UIViewController *vc in viewControllers) {

        if ([vc isMemberOfClass:[UINavigationController class]]) {
            UINavigationController *navigationController = (UINavigationController *)vc;
            if ([navigationController.topViewController isMemberOfClass:[ListViewController class]]) {
                UIImage *listTabImage = [UIImage imageNamed:@"tab_list"];
                navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"一覧"
                                                                                image:listTabImage
                                                                        selectedImage:listTabImage];
                continue;
            }

            if ([navigationController.topViewController isMemberOfClass:[ConfigurationViewController class]]) {
                UIImage *configurationTabImage = [UIImage imageNamed:@"tab_configuration"];
                navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"設定"
                                                                                image:configurationTabImage
                                                                        selectedImage:configurationTabImage];
                continue;
            }
        }
    }
}

@end
