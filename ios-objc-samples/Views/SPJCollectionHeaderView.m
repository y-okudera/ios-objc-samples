//
//  SPJCollectionHeaderView.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJCollectionHeaderView.h"
#import "CollectionViewRegisterNib.h"

@interface SPJCollectionHeaderView () <CollectionViewRegisterNib>

@end

@implementation SPJCollectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - CollectionViewRegisterNib

#pragma mark @required

+ (NSString *)identifier {
    return NSStringFromClass(self);
}

#pragma mark @optional

+ (void)registerSectionHeaderToCollectionView:(UICollectionView *)collectionView {
    UINib *nib = [UINib nibWithNibName:[self identifier] bundle:nil];
    [collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[self identifier]];
}

@end
