//
//  ZJBaseTextField.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2018/12/20.
//  Copyright © 2018年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWBaseTextField.h"
#import "ZJKeyboardHelperView.h"


@interface ZJTextFieldHelper : NSObject <UITextFieldDelegate>
@property (nonatomic, strong) ZJPSWBaseTextField *textField;

@end

@implementation ZJTextFieldHelper

- (instancetype)initWithTextField:(ZJPSWBaseTextField *)textField {
    if (self = [super init]) {
        self.textField = textField;
        self.textField.delegate = self;
    }
    return self;
}

// MARK: - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    id <UITextFieldDelegate > pDelegate =  [(ZJPSWBaseTextField *)textField pDelegate];
    if ([pDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        [pDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    
    ZJPSWBaseTextField *p_textField = (ZJPSWBaseTextField *)textField;
//  判断是否达到设定的最大值
    if ([p_textField isReachMaxCountCharacterRange:range replacmentString:string ]) {
        return NO;
    }
    return true;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    id <UITextFieldDelegate>pDelegate = [(ZJPSWBaseTextField *)textField pDelegate];
    if ([pDelegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [pDelegate textFieldShouldClear:textField];
    }
    return true;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    id <UITextFieldDelegate>pDelegate = [(ZJPSWBaseTextField *)textField pDelegate];
    if ([pDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [pDelegate textFieldShouldBeginEditing:textField];
    }
    return true;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    id <UITextFieldDelegate>pDelegate = [(ZJPSWBaseTextField *)textField pDelegate];
    if ([pDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [pDelegate textFieldShouldEndEditing:textField];
    }
    return true;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    id<UITextFieldDelegate> pDelegate = ((ZJPSWBaseTextField*)textField).pDelegate;
    if([pDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [pDelegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    id<UITextFieldDelegate> pDelegate = ((ZJPSWBaseTextField*)textField).pDelegate;
    if([pDelegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [pDelegate textFieldShouldReturn:textField];
    }
    return YES;
}


@end

@interface ZJPSWBaseTextField ()

@property (nonatomic, strong) ZJTextFieldHelper *fieldHelper;
@property (nonatomic, strong) ZJKeyboardHelperView *helperView;


@end


@implementation ZJPSWBaseTextField


- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)p_defaultInit {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.borderStyle = UITextBorderStyleNone;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    _maxCount = 0;
    _fieldHelper = [[ZJTextFieldHelper alloc] initWithTextField:self];
}

- (void)setShowToolbarView:(BOOL)showToolbarView {
    if (showToolbarView) {
        [self setInputAccessoryView:self.helperView];
    }
}

- (BOOL)isReachMaxCountCharacterRange:(NSRange)range replacmentString:(NSString *)string {
    if (self.maxCount < 1) {
        return false;
    }
    NSString *new_string = [self.text stringByReplacingCharactersInRange:range withString:string];
    if (new_string.length > _maxCount) {
        return YES;
    }
    return false;
}

- (void)textFieldChanged:(UITextField *)textField {
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (self.allowCopyMenu) {
        return [super canPerformAction:action withSender:sender];
    }
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        menuController.menuVisible = NO;
    }
    return false;
}



- (ZJKeyboardHelperView *)helperView{
    if(!_helperView){
        __weak typeof(self) weakSelf     = self;
        _helperView = [ZJKeyboardHelperView createHelerViewWithFrame:CGRectMake(0, 0, ZJWinodwWidth, 45) keyboardDismiss:^{
            !weakSelf.ToolBarViewEvent ?  : weakSelf.ToolBarViewEvent ();
        }];
    }
    return _helperView;
}



@end
