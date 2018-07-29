//
//  ViewControllerFactory.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerFactory <NSObject>

+ (__kindof UIViewController *)makeViewController;

@end
