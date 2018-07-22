//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *hiraginoFontButton;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Hiraginoフォントでは、UIButtonの高さを十分にしても「g」や「j」の下が切れるためcontentVerticalAlignmentを変更する
    self.hiraginoFontButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
}

#pragma mark - IBAction

- (IBAction)didTapOutputLogButton:(UIButton *)sender {
    NSLog(@"(%s Line: %d) I tapped the button!", __func__, __LINE__);
}

// ボタンのsuperviewがuserInteractionEnabled = NOのため、ボタンのタップイベントは検出されない
- (IBAction)didTapButtonOnTheView:(UIButton *)sender {
    NSLog(@"I tapped button. The button's super view is disabled user interaction.");
}

@end
