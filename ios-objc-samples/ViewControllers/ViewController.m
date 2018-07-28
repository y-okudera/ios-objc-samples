//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"
#import "SPJAnimalCollectionViewCell.h"
#import "SPJCollectionHeaderView.h"
#import "SPJCollectionFooterView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) NSMutableArray <UIImage *> *items;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

#pragma mark - IBAction

- (IBAction)handleLongPressGesture:(UILongPressGestureRecognizer *)sender {

    UIGestureRecognizerState state = sender.state;

    switch (state) {
        case UIGestureRecognizerStateBegan: {
            NSIndexPath *selectedIndexPath = [self.collectionView indexPathForItemAtPoint:[sender locationInView:sender.view]];
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectedIndexPath];
            break;
        }

        case UIGestureRecognizerStateChanged:
            [self.collectionView updateInteractiveMovementTargetPosition:[sender locationInView:sender.view]];
            break;

        case UIGestureRecognizerStateEnded:
            [self.collectionView endInteractiveMovement];
            break;

        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

#pragma mark - UICollectionViewDataSource

#pragma mark @required

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SPJAnimalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[SPJAnimalCollectionViewCell identifier]
                                                                                  forIndexPath:indexPath];
    cell.imageView.image = self.items[indexPath.row];
    return cell;
}

#pragma mark @optional

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                          withReuseIdentifier:[SPJCollectionHeaderView identifier]
                                                                 forIndexPath:indexPath];
        return reusableview;
    }

    if (kind == UICollectionElementKindSectionFooter) {
        reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                          withReuseIdentifier:[SPJCollectionFooterView identifier]
                                                                 forIndexPath:indexPath];


        return reusableview;
    }
    return reusableview;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    UIImage *image = self.items[sourceIndexPath.row];
    [self.items removeObjectAtIndex:sourceIndexPath.item];
    [self.items insertObject:image atIndex:destinationIndexPath.item];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section: %ld, row: %ld, image: %@", indexPath.section, indexPath.row, self.items[indexPath.row]);
}

#pragma mark - Others

- (void)setupCollectionView {

    // setup sample data.
    self.items = [[self images] mutableCopy];

    // setup flowLayout.
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(132, 132);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16);
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 44);
    self.flowLayout.footerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 44);
    self.collectionView.collectionViewLayout = self.flowLayout;

    // register cell and header footer views.
    [SPJAnimalCollectionViewCell registerCellToCollectionView:self.collectionView];
    [SPJCollectionHeaderView registerSectionHeaderToCollectionView:self.collectionView];
    [SPJCollectionFooterView registerSectionFooterToCollectionView:self.collectionView];
}

#pragma mark Sample data

- (NSArray <UIImage *> *)images {
    return @[
             [UIImage imageNamed:@"00"],
             [UIImage imageNamed:@"01"],
             [UIImage imageNamed:@"02"],
             [UIImage imageNamed:@"03"],
             [UIImage imageNamed:@"04"],
             [UIImage imageNamed:@"05"],
             [UIImage imageNamed:@"06"],
             [UIImage imageNamed:@"07"],
             [UIImage imageNamed:@"08"],
             [UIImage imageNamed:@"09"]
             ];
}

@end
