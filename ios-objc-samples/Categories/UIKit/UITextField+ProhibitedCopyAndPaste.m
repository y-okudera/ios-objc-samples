//
//  UITextField+ProhibitedCopyAndPaste.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/23.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "UITextField+ProhibitedCopyAndPaste.h"

@implementation UITextField (ProhibitedCopyAndPaste)

#pragma mark - UIResponder

// コピー/ペーストのメニューを表示させない
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {

    if (action == @selector(copy:) || action == @selector(paste:)) {
        return NO;
    }
    return YES;
}
@end
