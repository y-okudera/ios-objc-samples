//
//  CollectionViewRegisterNib.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionViewRegisterNib <NSObject>

+ (NSString *)identifier;

@optional
+ (void)registerCellToCollectionView:(UICollectionView *)collectionView;
+ (void)registerSectionHeaderToCollectionView:(UICollectionView *)collectionView;
+ (void)registerSectionFooterToCollectionView:(UICollectionView *)collectionView;
@end
