//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+ProhibitedCopyAndPaste.h"

#pragma mark - Const

static const NSInteger SPJMaxLengthOfMailAddress = 64;
static NSString *const SPJError = @"エラー";
static NSString *const SPJNotMailAddress = @"メールアドレス形式ではありません。";
static NSString *const SPJOK = @"OK";

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *mailField;
@property (weak, nonatomic) IBOutlet UILabel *registeredMailAddressLabel;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mailField.delegate = self;
}

#pragma mark - IBAction

- (IBAction)didTapRegisterButton:(UIButton *)sender {

    NSString *const inputText = self.mailField.text;
    const BOOL isMailAddress = [self validateMailAddress:inputText];

    if (isMailAddress) {
        self.registeredMailAddressLabel.text = inputText;
    } else {
        [self showErrorMessage];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __func__);

    // 編集開始時に文字列を空にする
    textField.text = @"";

    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%s", __func__);
    
    // 文字列削除の場合
    if ([string isEqualToString:@""]) {
        NSLog(@"delete");
        return YES;
    }

    // 入力後の文字列の長さが0 ~ 64でなければNO
    if (range.location >= SPJMaxLengthOfMailAddress) {
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%s", __func__);

    // キーボードを閉じる
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Others

/**
 メールアドレス形式かどうか

 @param mailAddress メールアドレス
 @return YES: メールアドレス形式, NO: メールアドレス形式ではない
 */
- (BOOL)validateMailAddress:(NSString *)mailAddress {

    NSString *const expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";

    NSError *error = nil;
    NSRegularExpression *const regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                                 options:NSRegularExpressionCaseInsensitive
                                                                                   error:&error];

    // If the pattern is invalid, nil will be returned and an NSError will be returned by reference.
    if (error && error.code != 0) {
        NSLog(@"the pattern is invalid. error code: %ld, description: %@", error.code, error.description);
        return NO;
    }

    NSTextCheckingResult *const match = [regex firstMatchInString:mailAddress
                                                          options:NSMatchingReportProgress
                                                            range:NSMakeRange(0, mailAddress.length)];

    if (match) {
        return YES;
    } else {
        return NO;
    }
}

/**
 メールアドレス形式ではない場合のエラー表示
 */
- (void)showErrorMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SPJError
                                                                             message:SPJNotMailAddress
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:SPJOK style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];

    [self presentViewController:alertController animated:YES completion:nil];
}

@end
