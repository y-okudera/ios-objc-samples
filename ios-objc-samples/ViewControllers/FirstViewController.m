//
//  FirstViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ViewControllerFactory.h"

@interface FirstViewController () <ViewControllerFactory>

@end

@implementation FirstViewController

#pragma mark ViewControllerFactory

+ (FirstViewController *)makeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FirstViewController" bundle:nil];
    FirstViewController *firstVC = [storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    return firstVC;
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

#pragma mark - IBAction

- (IBAction)toSecondVC:(UIButton *)sender {
    SecondViewController *secondVC = [SecondViewController makeViewController];
    secondVC.navigationItem.title = @"First -> Second";
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (IBAction)toThirdVC:(UIButton *)sender {
    FirstViewController *firstVC = [[self class] makeViewController];
    SecondViewController *secondVC = [SecondViewController makeViewController];
    secondVC.navigationItem.title = @"Third -> Second";
    ThirdViewController *thirdVC = [ThirdViewController makeViewController];
    thirdVC.navigationItem.title = @"First -> Third";
    [self.navigationController setViewControllers:@[firstVC, secondVC, thirdVC] animated:YES];
}

@end
