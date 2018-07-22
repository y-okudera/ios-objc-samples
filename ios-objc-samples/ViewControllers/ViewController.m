//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"
#import "SPJPickerTextField.h"
#import "UITextField+ProhibitedCopyAndPaste.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SPJPickerTextField *fruitsField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.fruitsField setupWithDataList:@[@"apple", @"grape", @"peach", @"pineapple", @"strawberry"]];
}

@end
