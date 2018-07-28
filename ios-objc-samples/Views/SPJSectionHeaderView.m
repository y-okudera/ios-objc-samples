//
//  SPJSectionHeaderView.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJSectionHeaderView.h"
#import "SPJNibInstantiateProtocol.h"

@interface SPJSectionHeaderView () <SPJNibInstantiateProtocol>

@property (weak, nonatomic) IBOutlet UILabel *genreNameLabel;
@end

@implementation SPJSectionHeaderView

- (void)setupWithGenreName:(NSString *)genreName inSection:(NSInteger)section {
    self.genreNameLabel.text = genreName;
    self.section = section;
}

#pragma mark - SPJNibInstantiateProtocol

+ (SPJSectionHeaderView *)instantiate {
    UINib *nib = [UINib nibWithNibName:@"SPJSectionHeaderView" bundle:nil];
    return (SPJSectionHeaderView *)[nib instantiateWithOwner:self options:nil].firstObject;
}

@end
