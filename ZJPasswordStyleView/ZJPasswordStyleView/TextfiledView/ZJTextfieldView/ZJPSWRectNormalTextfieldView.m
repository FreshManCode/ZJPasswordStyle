//
//  ZJPSWRectNormalTextfieldView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWRectNormalTextfieldView.h"

#import "ZJPasswordDotView.h"
#import "ZJMaskView.h"
#import "ZJPSWBaseTextField.h"
#import "ZJPasswordViewProtocol.h"

@interface ZJPSWRectNormalTextfieldView ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) ZJPasswordDotView *dotView;
@property (nonatomic, strong) ZJMaskView *maskView;
@property (nonatomic, strong) ZJPSWBaseTextField *textField;
@property (nonatomic, strong) NSMutableArray <ZJPasswordDotView *> *dotViews;

@end

@implementation ZJPSWRectNormalTextfieldView

@synthesize delegate = _delegate;

- (void)zj_addSubviews {
    
    self.titleLab = CreateCenterAlignmentLabel(Font(16.f), ZJColorWithHex(0x333333));
    [self addSubview:self.titleLab];
    [self.titleLab setText:@"请输入密码"];
    
    _textField = [ZJPSWBaseTextField new];
    _textField.textColor = [UIColor whiteColor];
    _textField.tintColor = [UIColor whiteColor];
    _textField.secureTextEntry = true;
    _textField.maxCount  = kMaxCount;
    _textField.allowCopyMenu = false;
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    [_textField addTarget:self action:@selector(textfieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    __weak typeof(self) weakSelf     = self;
    _textField.showToolbarView = true;
    _textField.ToolBarViewEvent = ^{
        [weakSelf callOkButtonFunnctionWithText:weakSelf.textField.text];
    };
    
    [self addSubview:_textField];
    
    _maskView = [[ZJMaskView alloc] init];
    _maskView.layer.cornerRadius = 8.f;
    _maskView.layer.borderColor  = ZJBorderLayerCorlor.CGColor;
    _maskView.layer.borderWidth  = 1.f;
    [_maskView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:_maskView];
}

- (void)zj_addConstraints {
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(60);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.titleLab.mas_bottom).offset(60);
        make.height.mas_equalTo(50);
    }];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self.textField);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
    }];
    [_textField layoutIfNeeded];
    [_maskView layoutIfNeeded];
    [self p_initDotViewWithFrame:_maskView.bounds];
}
- (void)p_initDotViewWithFrame:(CGRect)frame {
    self.dotViews = [[NSMutableArray alloc] initWithCapacity:6];
    CGFloat viewW = frame.size.width / kMaxCount;
    CGFloat viewH = frame.size.height;
    for (int i = 0; i < kMaxCount; i ++) {
        CGRect frame = CGRectMake(viewW * i , 0, viewW , viewH );
        ZJPasswordDotView *dotView = [ZJPasswordDotView createDotViewWithType:ZJPasswordRectangleNormal
                                                                        frame:frame];
        [dotView.verticalLineView setHidden:i == kMaxCount - 1];
        [self.maskView  addSubview:dotView];
        [self.dotViews  addObject:dotView];
    }
    [self updateInputNumWithText:_textField.text];
}

- (void)textfieldDidChanged:(UITextField *)textfiled {
    [self updateInputNumWithText:textfiled.text];
}

- (void)updateInputNumWithText:(NSString *)text {
    NSInteger length = text.length;
    const char *textChar = text.UTF8String;
    //更新输入框内容
    [self.dotViews enumerateObjectsUsingBlock:^(ZJPasswordDotView * obj, NSUInteger idx, BOOL * stop) {
        //更新输入的内容
        if (idx < length) {
            NSString *text_string = [NSString stringWithFormat:@"%c",textChar[idx]];
            [obj setDotTitle:text_string];
        } else {
            [obj setDotTitle:@""];
        }
    }];
    
    if (length == kMaxCount) {
        [self callBackAutoDoneFunnctionWithText:text];
    }
    else {
        [self callBackInpuTextLengthUpdateWithText:text];
    }
}

- (void)callBackAutoDoneFunnctionWithText:(NSString *)text {
    [self makeTextfieldResignFirstResponder];
    if (_delegate && [_delegate respondsToSelector:@selector(textfieldView:result:eventType:)]) {
        [_delegate textfieldView:self result:text eventType:ZJPasswordViewEventAutoDone];
    }
}
- (void)callBackInpuTextLengthUpdateWithText:(NSString *)text {
    if (_delegate && [_delegate respondsToSelector:@selector(textfieldView:result:eventType:)]) {
        [_delegate textfieldView:self result:text eventType:ZJPasswordViewEventLengthUpdate];
    }
}

- (void)callOkButtonFunnctionWithText:(NSString *)text {
    [self makeTextfieldResignFirstResponder];
    if (_delegate && [_delegate respondsToSelector:@selector(textfieldView:result:eventType:)]) {
        [_delegate textfieldView:self result:text eventType:ZJPasswordViewEventOKButton];
    }
}

- (void)makeTextfieldBecomeFirstResponder {
    [_textField becomeFirstResponder];
}

- (void)makeTextfieldResignFirstResponder {
    [_textField resignFirstResponder];
}

- (void)clearAllInputChars {
    [self.textField setText:@""];
    [self updateInputNumWithText:@""];
}

- (void)autoShowKeyboardDelay:(NSTimeInterval)delay {
    ZJAfter(delay, ^{
        [_textField becomeFirstResponder];
    });
}
- (NSInteger)textLength {
    return _textField.text.length;
}

@end
