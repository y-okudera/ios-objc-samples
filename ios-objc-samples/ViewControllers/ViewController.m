//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"

#pragma mark - Const

static NSString * const SPJAlert = @"アラート";
static NSString * const SPJChangeTheBGColor = @"背景色を変更しますか？";
static NSString * const SPJOK = @"OK";
static NSString * const SPJCancel = @"Cancel";
static NSString * const SPJActionSheet = @"アクションシート";
static NSString * const SPJSelectTheBGColor = @"背景色を選択してください。";
static NSString * const SPJColorNameWhite = @"White";
static NSString * const SPJColorNameRed = @"Red";
static NSString * const SPJColorNameBlue = @"Blue";
static NSString * const SPJColorNameYellow = @"Yellow";


@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - IBAction

- (IBAction)didTapShowAlertButton:(UIButton *)sender {
    [self showAlert];
}

- (IBAction)didTapShowActionSheetButton:(UIButton *)sender {
    [self showActionSheet];
}

#pragma mark - Others

- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SPJAlert
                                                                             message:SPJChangeTheBGColor
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    __weak typeof(self) weakSelf = self;
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:SPJOK style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        UIColor *nowColor = strongSelf.view.backgroundColor;
        strongSelf.view.backgroundColor = nowColor == UIColor.whiteColor ? UIColor.greenColor : UIColor.whiteColor;
    }];

    [alertController addAction:okAction];

    // Cancel選択時は何もしないため、handlerはnil
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:SPJCancel style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showActionSheet {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SPJActionSheet
                                                                             message:SPJSelectTheBGColor
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    __weak typeof(self) weakSelf = self;

    UIAlertAction *whiteColorAction = [UIAlertAction actionWithTitle:SPJColorNameWhite style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        strongSelf.view.backgroundColor = UIColor.whiteColor;
    }];
    [alertController addAction:whiteColorAction];

    UIAlertAction *redColorAction = [UIAlertAction actionWithTitle:SPJColorNameRed style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        strongSelf.view.backgroundColor = UIColor.redColor;
    }];
    [alertController addAction:redColorAction];

    UIAlertAction *blueColorAction = [UIAlertAction actionWithTitle:SPJColorNameBlue style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        strongSelf.view.backgroundColor = UIColor.blueColor;
    }];
    [alertController addAction:blueColorAction];

    UIAlertAction *yellowColorAction = [UIAlertAction actionWithTitle:SPJColorNameYellow style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        strongSelf.view.backgroundColor = UIColor.yellowColor;
    }];
    [alertController addAction:yellowColorAction];

    // Cancel選択時は何もしないため、handlerはnil
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:SPJCancel style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];
}

@end
