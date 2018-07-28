//
//  SPJTableViewSectionContents.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJTableViewSectionContents.h"

@interface SPJTableViewSectionContents ()

@property (nonatomic, readwrite) NSString *genreName;
@property (nonatomic, readwrite) NSArray <NSString *> *contentNames;
@end

@implementation SPJTableViewSectionContents

#pragma mark - Initializer

- (instancetype)initWithGenreName:(NSString *)genreName contentsNames:(NSArray <NSString *> *)contentNames {
    self = [super init];
    if (self) {
        self.genreName = genreName;
        self.opening = NO;
        self.contentNames = contentNames;
    }
    return self;
}
@end
