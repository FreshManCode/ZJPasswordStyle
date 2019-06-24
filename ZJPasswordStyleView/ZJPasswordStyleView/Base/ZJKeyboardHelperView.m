//
//  ZJKeyboardHelperView.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJKeyboardHelperView.h"

@interface ZJKeyboardHelperView ()

@property (nonatomic, strong) UIButton *downButton;
@property (nonatomic, strong) UIView *sepratorLine;
@property (nonatomic, strong) UIView *bottomSepratorLine;
@property (nonatomic,copy) void (^DismissEvent)(void);


@end

@implementation ZJKeyboardHelperView

static CGFloat const kButtonW = 40.f;

+ (instancetype)createHelerViewWithFrame:(CGRect)frame
                         keyboardDismiss:(void(^)(void))dismiss {
    ZJKeyboardHelperView *helerView = [[ZJKeyboardHelperView alloc] initWithFrame:frame];
    helerView.DismissEvent = dismiss;
    return helerView;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = ZJImage(@"wx_Back_icon_normal");
        [_downButton setBackgroundImage:image forState:UIControlStateNormal];
        [_downButton setBackgroundImage:image forState:UIControlStateSelected];
        [_downButton setBackgroundImage:image forState:UIControlStateHighlighted];
        _downButton.transform = [self rotateTransform];
        CGFloat w = CGRectGetWidth(frame);
        CGFloat h = CGRectGetHeight(frame);
        _downButton.frame = CGRectMake((w - kButtonW)/2.0, ( h - kButtonW )/2.0, kButtonW, kButtonW);
        [_downButton addTarget:self action:@selector(downEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_downButton];
        
        _sepratorLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 1.f)];
        [_sepratorLine setBackgroundColor:ZJColorWithHex(0xF4F4F4)];
        [self addSubview:_sepratorLine];
        
        _bottomSepratorLine = [[UIView alloc] initWithFrame:CGRectMake(0, h - 1, w, 1.f)];
        [_bottomSepratorLine setBackgroundColor:ZJColorWithHex(0xF4F4F4)];
        [self addSubview:_bottomSepratorLine];
    }
    return self;
}

- (CGAffineTransform)rotateTransform {
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2 + M_PI);
    return transform;
}

- (void)downEvent:(UIButton *)sender {
    !self.DismissEvent ? : self.DismissEvent();
}



@end
