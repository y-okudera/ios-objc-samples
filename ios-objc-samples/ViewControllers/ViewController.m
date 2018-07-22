//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *oneLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLinesLabel;
@property (weak, nonatomic) IBOutlet UILabel *anyLinesLabel;

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self outputText];
}

#pragma mark - Others

/**
 ラベルに文字列を設定する
 */
- (void)outputText {
    NSString *const sampleText = @"UILabelのサンプルです。\nStoryboardでUILabelのLinesに0を設定すると、\n複数行の文字列を表示することができます。";
    self.anyLinesLabel.text = sampleText;
}


@end
