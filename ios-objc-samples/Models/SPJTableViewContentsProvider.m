//
//  SPJTableViewContentsProvider.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJTableViewContentsProvider.h"

@interface SPJTableViewContentsProvider ()

@property (nonatomic) NSArray <SPJTableViewSectionContents *> *sectionContentsList;
@property (nonatomic) NSMutableArray <SPJTableViewSectionContents *> *mutableSectionContentsList;
@property (nonatomic, readwrite) UITableViewRowAnimation tableViewRowAnimation;
@end

@implementation SPJTableViewContentsProvider

#pragma mark - Initializer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableSectionContentsList = [@[] mutableCopy];
        self.sectionContentsList = [self.mutableSectionContentsList copy];
        self.tableViewRowAnimation = UITableViewRowAnimationFade;
    }
    return self;
}

#pragma mark - Add data

- (void)addSectionContent:(SPJTableViewSectionContents *)sectionContents {
    [self.mutableSectionContentsList addObject:sectionContents];
    self.sectionContentsList = [self.mutableSectionContentsList copy];
}

#pragma mark - Get Count

- (NSInteger)sectionCount {
    return self.sectionContentsList.count;
}

- (NSInteger)rowCountInSection:(NSInteger)section {
    if (self.sectionContentsList.count == 0) {
        return 0;
    }

    // 開いているセクションの場合、contentNamesの件数を返却
    if (self.sectionContentsList[section].isOpening) {
        return self.sectionContentsList[section].contentNames.count;
    }

    // 開いていないセクションの場合、0を返却
    return 0;
}

#pragma mark - Get genre name

- (NSString *)genreNameInSection:(NSInteger)section {
    if (self.sectionContentsList.count == 0) {
        return nil;
    }
    return self.sectionContentsList[section].genreName;
}

#pragma mark - Get content name

- (NSString *)contentNameAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sectionContentsList.count == 0) {
        return nil;
    }
    return self.sectionContentsList[indexPath.section].contentNames[indexPath.row];
}

#pragma mark - Opening status

- (BOOL)isOpeningInSection:(NSInteger)section {
    if (self.sectionContentsList.count == 0) {
        return NO;
    }
    return self.sectionContentsList[section].isOpening;
}

- (void)changeTheOpeningStatusInSection:(NSInteger)section {
    if (self.sectionContentsList.count == 0) {
        return;
    }
    self.sectionContentsList[section].opening = ![self isOpeningInSection:section];
}

@end
