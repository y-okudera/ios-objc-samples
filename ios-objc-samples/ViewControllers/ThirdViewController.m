//
//  ThirdViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ThirdViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ViewControllerFactory.h"

@interface ThirdViewController () <ViewControllerFactory>

@end

@implementation ThirdViewController

#pragma mark ViewControllerFactory

+ (ThirdViewController *)makeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ThirdViewController" bundle:nil];
    ThirdViewController *thirdVC = [storyboard instantiateInitialViewController];
    return thirdVC;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s %d", __func__, __LINE__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s %d", __func__, __LINE__);
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    if (![parent isEqual:self.parentViewController]) {
        NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
        if (viewControllers.count < 2) {
            return;
        }

        NSInteger nowVCIndex = viewControllers.count - 1;
        if (![viewControllers[nowVCIndex] isMemberOfClass:[ThirdViewController class]]) {
            NSLog(@"Not ThirdViewController's event.");
            return;
        }

        NSLog(@"%s %d Did tap 'Back'.", __func__, __LINE__);

        NSInteger sourceVCIndex = viewControllers.count - 2;
        
        // in case of viewControllers[sourceVCIndex]'s class is equal to SecondViewController.
        if ([viewControllers[sourceVCIndex] isMemberOfClass:[SecondViewController class]]) {
            SecondViewController *secondVC = [SecondViewController makeViewController];
            secondVC.navigationItem.title = @"Third -> Second";
            [viewControllers removeObjectAtIndex:sourceVCIndex];
            [viewControllers insertObject:secondVC atIndex:sourceVCIndex];
            self.navigationController.viewControllers = viewControllers.copy;
        }
    }
}

#pragma mark - IBAction

- (IBAction)popToRootVC:(UIButton *)sender {
    NSLog(@"%s %d", __func__, __LINE__);
    FirstViewController *firstVC = [FirstViewController makeViewController];
    firstVC.navigationItem.title = @"Third -> First";
    NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
    [viewControllers removeObjectAtIndex:0];
    [viewControllers insertObject:firstVC atIndex:0];
    self.navigationController.viewControllers = viewControllers.copy;
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
