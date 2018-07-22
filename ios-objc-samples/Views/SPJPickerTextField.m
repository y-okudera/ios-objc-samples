//
//  SPJPickerTextField.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/23.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJPickerTextField.h"

@interface SPJPickerTextField () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic) NSArray <NSString *> *dataList;
@property (nonatomic) UIPickerView *pickerView;
@end

@implementation SPJPickerTextField

- (void)setupWithDataList:(NSArray <NSString *> *)dataList {

    self.dataList = dataList;
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.showsSelectionIndicator = YES;

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 35)];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                          target:self
                                                                          action:@selector(done)];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                              target:self
                                                                              action:@selector(cancel)];
    [toolbar setItems:@[cancelItem, doneItem] animated:YES];
    self.inputView = self.pickerView;
    self.inputAccessoryView = toolbar;
}

#pragma mark - Selectors

- (void)done {
    NSInteger selectedRow = [self.pickerView selectedRowInComponent:0];
    self.text = self.dataList[selectedRow];
    [self endEditing:YES];
}

- (void)cancel {
    self.text = @"";
    [self endEditing:YES];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataList.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.dataList[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.text = self.dataList[row];
}

@end
