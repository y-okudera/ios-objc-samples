//
//  ThirdViewController.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController

#pragma mark ViewControllerFactory

+ (ThirdViewController *)makeViewController;
@end

NS_ASSUME_NONNULL_END
