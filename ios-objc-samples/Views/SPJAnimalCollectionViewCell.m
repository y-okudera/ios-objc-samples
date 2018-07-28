//
//  SPJAnimalCollectionViewCell.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJAnimalCollectionViewCell.h"
#import "CollectionViewRegisterNib.h"

@interface SPJAnimalCollectionViewCell () <CollectionViewRegisterNib>

@end

@implementation SPJAnimalCollectionViewCell

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

+ (void)registerCellToCollectionView:(UICollectionView *)collectionView {
    UINib *nib = [UINib nibWithNibName:[self identifier] bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:[self identifier]];
}

@end
