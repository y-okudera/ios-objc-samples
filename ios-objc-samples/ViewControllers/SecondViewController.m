//
//  SecondViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"
#import "ViewControllerFactory.h"

@interface SecondViewController () <ViewControllerFactory, UINavigationControllerDelegate>

@end

@implementation SecondViewController

#pragma mark ViewControllerFactory

+ (SecondViewController *)makeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SecondViewController" bundle:nil];
    SecondViewController *secondVC = [storyboard instantiateInitialViewController];
    return secondVC;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s %d", __func__, __LINE__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s %d", __func__, __LINE__);
    self.navigationController.delegate = self;
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    if (![parent isEqual:self.parentViewController]) {

        NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
        if (viewControllers.count < 2) {
            return;
        }

        NSInteger nowVCIndex = viewControllers.count - 1;
        if (![viewControllers[nowVCIndex] isMemberOfClass:[SecondViewController class]]) {
            NSLog(@"Not SecondViewController's event.");
            return;
        }
        NSLog(@"%s %d Did tap 'Back'.", __func__, __LINE__);
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.delegate = nil;
}

#pragma mark - IBAction

- (IBAction)toThirdVC:(UIButton *)sender {
    ThirdViewController *thirdVC = [ThirdViewController makeViewController];
    thirdVC.navigationItem.title = @"Second -> Third";
    [self.navigationController pushViewController:thirdVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

    BOOL isFirstViewController = [viewController isMemberOfClass:[FirstViewController class]];
    if (isFirstViewController) {
        viewController.navigationItem.title = @"Second -> First";
        return;
    }
}

@end
