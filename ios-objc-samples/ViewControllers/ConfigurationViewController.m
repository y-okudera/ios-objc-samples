//
//  ConfigurationViewController.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/29.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "ConfigurationViewController.h"

static NSString *const SPJConfigurationAlertTitle = @"設定";
static NSString *const SPJConfigurationAlertMessage = @"%@が選択されました。";

@interface ConfigurationViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ConfigurationViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self contents].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConfigurationCell" forIndexPath:indexPath];
    cell.textLabel.text = [self contents][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *message = [NSString stringWithFormat:SPJConfigurationAlertMessage, [self contents][indexPath.row]];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SPJConfigurationAlertTitle
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Others

#pragma mark Sample data

- (NSArray <NSString *> *)contents {
    return @[@"ログイン", @"アプリバージョン", @"退会"];
}

@end
