//
//  SPJSectionHeaderView.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPJSectionHeaderView : UIView

@property (nonatomic) NSInteger section;

- (void)setupWithGenreName:(NSString *)genreName inSection:(NSInteger)section;

#pragma mark - SPJNibInstantiateProtocol

+ (SPJSectionHeaderView *)instantiate;
@end

NS_ASSUME_NONNULL_END
