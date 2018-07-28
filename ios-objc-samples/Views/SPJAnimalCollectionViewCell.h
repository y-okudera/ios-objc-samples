//
//  SPJAnimalCollectionViewCell.h
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/28.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPJAnimalCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

#pragma mark - CollectionViewRegisterNib

+ (NSString *)identifier;
+ (void)registerCellToCollectionView:(UICollectionView *)collectionView;
@end

NS_ASSUME_NONNULL_END
