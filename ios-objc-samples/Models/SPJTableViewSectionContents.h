//
//  SPJTableViewSectionContents.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPJTableViewSectionContents : NSObject

@property (nonatomic, readonly) NSString *genreName;
@property (nonatomic, readonly) NSArray <NSString *> *contentNames;
@property (nonatomic, getter=isOpening) BOOL opening;

#pragma mark - Initializer

- (instancetype)initWithGenreName:(NSString *)genreName contentsNames:(NSArray <NSString *> *)contentNames;
@end

NS_ASSUME_NONNULL_END
