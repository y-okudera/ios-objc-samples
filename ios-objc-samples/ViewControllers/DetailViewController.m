//
//  DetailViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSString *imageName;
@end

@implementation DetailViewController

#pragma mark - Factory

+ (DetailViewController *)makeWithImageName:(NSString *)imageName {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DetailViewController" bundle:nil];
    DetailViewController *detailVC = [storyboard instantiateInitialViewController];
    detailVC.imageName = imageName;
    return detailVC;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.imageName;
    self.imageView.image = [UIImage imageNamed:self.imageName];
}

@end
