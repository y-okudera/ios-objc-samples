//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)didTapOutputLogButton:(UIButton *)sender {
    NSLog(@"(%s Line: %d) I tapped the button!", __func__, __LINE__);
}

// ボタンのsuperviewがuserInteractionEnabled = NOのため、ボタンのタップイベントは検出されない
- (IBAction)didTapButtonOnTheView:(UIButton *)sender {
    NSLog(@"I tapped button. The button's super view is disabled user interaction.");
}

@end
