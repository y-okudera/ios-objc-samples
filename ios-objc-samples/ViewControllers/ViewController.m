//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *contentModeLabel;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - IBAction

/**
 ImageViewのタップイベント

 @param sender (UITapGestureRecognizer *)
 */
- (IBAction)didTapImageView:(UITapGestureRecognizer *)sender {

    NSLog(@"%s Line: %d", __func__, __LINE__);
    [self changeContentMode];
}

#pragma mark - Others

/**
 ImageViewのContentModeを切り替える
 */
- (void)changeContentMode {

    NSLog(@"%s Line: %d", __func__, __LINE__);
    NSInteger contentModeIndex = (NSInteger)self.imageView.contentMode;
    contentModeIndex += 1;

    // UIViewContentModeの値は0~12のため、13以上になったら0にする
    if (contentModeIndex >= 13) {
        contentModeIndex = 0;
    }
    self.imageView.contentMode = (UIViewContentMode)contentModeIndex;
    self.contentModeLabel.text = [self updateContentModeLabel:self.imageView.contentMode];
}

/**
 ImageViewのContentModeの名称を取得する

 @param contentMode ImageViewのContentMode
 @return ContentModeの名称
 */
- (NSString *)updateContentModeLabel:(UIViewContentMode)contentMode {

    NSLog(@"%s Line: %d", __func__, __LINE__);
    switch (contentMode) {
        case UIViewContentModeScaleToFill:
            return @"UIViewContentModeScaleToFill";
        case UIViewContentModeScaleAspectFit:
            return @"UIViewContentModeScaleAspectFit";
        case UIViewContentModeScaleAspectFill:
            return @"UIViewContentModeScaleAspectFill";
        case UIViewContentModeRedraw:
            return @"UIViewContentModeRedraw";
        case UIViewContentModeCenter:
            return @"UIViewContentModeCenter";
        case UIViewContentModeTop:
            return @"UIViewContentModeTop";
        case UIViewContentModeBottom:
            return @"UIViewContentModeBottom";
        case UIViewContentModeLeft:
            return @"UIViewContentModeLeft";
        case UIViewContentModeRight:
            return @"UIViewContentModeRight";
        case UIViewContentModeTopLeft:
            return @"UIViewContentModeTopLeft";
        case UIViewContentModeTopRight:
            return @"UIViewContentModeTopRight";
        case UIViewContentModeBottomLeft:
            return @"UIViewContentModeBottomLeft";
        case UIViewContentModeBottomRight:
            return @"UIViewContentModeBottomRight";
    }
}

@end
