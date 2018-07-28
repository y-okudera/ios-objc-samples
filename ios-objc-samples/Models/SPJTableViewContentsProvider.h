//
//  SPJTableViewContentsProvider.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPJTableViewSectionContents.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPJTableViewContentsProvider : NSObject

@property (nonatomic, readonly) UITableViewRowAnimation tableViewRowAnimation;

#pragma mark - Add data

- (void)addSectionContent:(SPJTableViewSectionContents *)sectionContents;

#pragma mark - Get Count

- (NSInteger)sectionCount;

- (NSInteger)rowCountInSection:(NSInteger)section;

#pragma mark - Get genre name

- (NSString *)genreNameInSection:(NSInteger)section;

#pragma mark - Get content name

- (NSString *)contentNameAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Opening status

- (BOOL)isOpeningInSection:(NSInteger)section;

- (void)changeTheOpeningStatusInSection:(NSInteger)section;
@end

NS_ASSUME_NONNULL_END
