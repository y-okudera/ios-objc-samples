//
//  ViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/22.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ViewController.h"
#import "SPJSectionHeaderView.h"
#import "SPJTableViewContentsProvider.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) SPJTableViewContentsProvider *contentsProvider;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
}

#pragma mark - UITableViewDataSource

#pragma mark @required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contentsProvider rowCountInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.contentsProvider contentNameAtIndexPath:indexPath];
    return cell;
}

#pragma mark @optional

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.contentsProvider sectionCount];
}

#pragma mark - UITableViewDelegate

#pragma mark @optional

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SPJSectionHeaderView *headerView = [SPJSectionHeaderView instantiate];
    NSString *genreName = [self.contentsProvider genreNameInSection:section];
    [headerView setupWithGenreName:genreName inSection:section];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(toggleGenreHeader:)];
    [headerView addGestureRecognizer:tapGestureRecognizer];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section: %@",[self.contentsProvider genreNameInSection:indexPath.section]);
    NSLog(@"row: %@",[self.contentsProvider contentNameAtIndexPath:indexPath]);
}

#pragma mark - Others

- (void)setup {
    self.contentsProvider = [[SPJTableViewContentsProvider alloc] init];

    SPJTableViewSectionContents *vegetablesSectionContents = [[SPJTableViewSectionContents alloc] initWithGenreName:@"Vegetables"
                                                                                                      contentsNames:[self vegetables]];
    [self.contentsProvider addSectionContent:vegetablesSectionContents];

    SPJTableViewSectionContents *fruitsSectionContents = [[SPJTableViewSectionContents alloc] initWithGenreName:@"Fruits"
                                                                                                  contentsNames:[self fruits]];
    [self.contentsProvider addSectionContent:fruitsSectionContents];
}

#pragma mark Selector

- (void)toggleGenreHeader:(UITapGestureRecognizer *)tapGestureRecognizer {

    SPJSectionHeaderView *header = (SPJSectionHeaderView *)tapGestureRecognizer.view;
    [self.contentsProvider changeTheOpeningStatusInSection:header.section];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:header.section]
                  withRowAnimation:self.contentsProvider.tableViewRowAnimation];
}

#pragma mark Sample data

- (NSArray <NSString *> *)vegetables {
    return @[@"Cabbage", @"Carrot", @"Pumpkin"];
}

- (NSArray <NSString *> *)fruits {
    return @[@"Apple", @"Apricot", @"Banana", @"Cherry", @"Grape", @"Kiwi-Fruit", @"Melon", @"Peach", @"Pear", @"Persimmon", @"Strawberry"];
}

@end
