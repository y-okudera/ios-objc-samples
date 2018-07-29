//
//  FirstViewController.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController <ViewControllerFactory>

#pragma mark - ViewControllerFactory

+ (FirstViewController *)makeViewController;
@end

NS_ASSUME_NONNULL_END
