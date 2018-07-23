//
//  SPJDatePickerTextField.m
//  ios-objc-samples
//
//  Created by YukiOkudera on 2018/07/23.
//  Copyright © 2018年 YukiOkudera. All rights reserved.
//

#import "SPJDatePickerTextField.h"

static NSString *const SPJDateFormat = @"yyyy/MM/dd";
static NSString *const SPJLocaleEnUSPOSIX = @"en_US_POSIX";

@interface SPJDatePickerTextField ()

@property (nonatomic) NSArray <NSString *> *dataList;
@property (nonatomic) UIDatePicker *datePicker;
@end

@implementation SPJDatePickerTextField

- (void)setNeedsLayout {
    [super setNeedsLayout];
    [self setup];
}

- (void)setup {
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 35)];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                              target:self
                                                                              action:@selector(done)];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(cancel)];
    [toolbar setItems:@[cancelItem, doneItem] animated:YES];
    self.inputView = self.datePicker;
    self.inputAccessoryView = toolbar;
}

#pragma mark - Selectors

- (void)datePickerValueChanged:(UIDatePicker *)datePicker {
    NSDate *selectedDate = datePicker.date;
    self.text = [self stringFromDate:selectedDate dateFormat:SPJDateFormat];
}

- (void)done {
    // TextFieldが空の場合は、DatePickerの値が変更されていないため当日を設定する
    if ([self.text isEqualToString:@""]) {
        NSDate *now = [NSDate date];
        self.text = [self stringFromDate:now dateFormat:SPJDateFormat];
    }
    [self endEditing:YES];
}

- (void)cancel {
    self.text = @"";
    [self endEditing:YES];
}

#pragma mark - DateFormatter

- (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:SPJLocaleEnUSPOSIX];
    dateFormatter.dateFormat = dateFormat;
    return [dateFormatter stringFromDate:date];
}

@end
