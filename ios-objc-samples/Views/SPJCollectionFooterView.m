//
//  SPJCollectionFooterView.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJCollectionFooterView.h"
#import "CollectionViewRegisterNib.h"

@interface SPJCollectionFooterView () <CollectionViewRegisterNib>

@end

@implementation SPJCollectionFooterView

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

+ (void)registerSectionFooterToCollectionView:(UICollectionView *)collectionView {
    UINib *nib = [UINib nibWithNibName:[self identifier] bundle:nil];
    [collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[self identifier]];
}

@end
