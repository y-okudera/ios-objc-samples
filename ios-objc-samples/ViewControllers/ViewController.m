//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"

static NSString *const linkText = @"こちら";
static NSString *const linkURLString = @"https://www.google.com";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *oneLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLinesLabel;
@property (weak, nonatomic) IBOutlet UILabel *anyLinesLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;
@property (nonatomic) NSMutableAttributedString *attributedString;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self outputText];
    [self setupLinkLabel];
}

#pragma mark - IBAction

/**
 linkLabelのタップイベント

 タップした座標がリンクのエリア内の場合は、外部リンクに飛ばす

 @param sender (UITapGestureRecognizer *)
 */
- (IBAction)didTapLinkLabel:(UITapGestureRecognizer *)sender {

    CGPoint touchPoint = [sender locationInView:self.linkLabel];

    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self.attributedString];

    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];

    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:self.linkLabel.frame.size];
    [layoutManager addTextContainer:textContainer];

    textContainer.lineFragmentPadding = 0;

    NSString *const linkLabelText = self.linkLabel.text;
    NSRange range = [linkLabelText rangeOfString:linkText];

    NSRange glyphRange = [layoutManager glyphRangeForCharacterRange:range actualCharacterRange:nil];
    CGRect glyphRect = [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];

    // リンクのタップ領域を拡張する
    CGRect expandRext = CGRectMake(glyphRect.origin.x + 15, glyphRect.origin.y, glyphRect.size.width * 1.4, glyphRect.size.height);

#ifdef DEBUG
    // デバッグ実行の場合は、リンクのタップ領域をカラーリングする
    UIView *debugView = [[UIView alloc] initWithFrame:expandRext];
    debugView.backgroundColor = UIColor.redColor;
    debugView.alpha = 0.5;
    if (self.linkLabel.subviews.count == 0) {
        [self.linkLabel addSubview:debugView];
    }
#endif

    BOOL containsPoint = CGRectContainsPoint(expandRext, touchPoint);
    if (containsPoint) {
        NSURL *linkURL = [NSURL URLWithString:linkURLString];
        [[UIApplication sharedApplication] openURL:linkURL options:@{} completionHandler:nil];
    }
}

#pragma mark - Others

/**
 ラベルに文字列を設定する
 */
- (void)outputText {
    NSString *const sampleText = @"UILabelのサンプルです。\nStoryboardでUILabelのLinesに0を設定すると、\n複数行の文字列を表示することができます。";
    self.anyLinesLabel.text = sampleText;
}


/**
 ラベルの一部を装飾する
 */
- (void)setupLinkLabel {

    NSString *const linkLabelText = self.linkLabel.text;
    NSRange range = [linkLabelText rangeOfString:linkText];

    self.attributedString = [[NSMutableAttributedString alloc] initWithString:linkLabelText];
    [self.attributedString addAttribute:NSForegroundColorAttributeName
                                  value:UIColor.blueColor
                                  range:range];
    [self.attributedString addAttribute:NSUnderlineStyleAttributeName
                                  value:@(NSUnderlineStyleSingle)
                                  range:range];

    self.linkLabel.attributedText = self.attributedString;
}

@end
