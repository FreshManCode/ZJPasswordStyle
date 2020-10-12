//
//  ZJPasswordDotView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPasswordDotView.h"
#import "ZJPasswordViewProtocol.h"

#import "ZJPSWLineDotNormalView.h"
#import "ZJPSWLineDotEncryptionView.h"
#import "ZJPSWRectDotNormalView.h"
#import "ZJPSWRectDotEncryptionView.h"


@interface ZJPasswordDotView ()

@property (nonatomic, strong) ZJPasswordDotView *currentDotView;

@end


@implementation ZJPasswordDotView

+ (instancetype)createDotViewWithType:(ZJPasswordType)type
                                frame:(CGRect)frame {
    ZJPasswordDotView *dotView = [[ZJPasswordDotView alloc] initWithFrame:frame type:type];
    return dotView;
}

- (id)initWithFrame:(CGRect)frame type:(ZJPasswordType)type {
    ZJPasswordDotView *currentDotView = nil;
    switch (type) {
        case ZJPasswordBottomLineNormal: {
            currentDotView = [[ZJPSWLineDotNormalView alloc] initWithFrame:frame];
        }
            break;
        case ZJPasswordBottomLineEncrytion: {
            currentDotView = [[ZJPSWLineDotEncryptionView alloc] initWithFrame:frame];
        }
            break;
        case ZJPasswordRectangleNormal: {
            currentDotView = [[ZJPSWRectDotNormalView alloc] initWithFrame:frame];
        }
            break;
        case ZJPasswordRectangleEncryption: {
            currentDotView = [[ZJPSWRectDotEncryptionView alloc] initWithFrame:frame];
        }
            break;
            
        default: {
            currentDotView = [[ZJPSWLineDotNormalView alloc] initWithFrame:frame];
        }
            break;
    }
    [self setCurrentDotView:currentDotView];
    return currentDotView;
}

- (void)zj_addConstraints {
    self.dotViewRaduis = 6.f;
    self.kLineLeftGap  = 8.f;
    self.kLineTopGap   = 0.f;
    
    self.titleLab = CreateCenterAlignmentLabel(BFont(25), ZJColorWithHex(0x333333));
    self.titleLab.userInteractionEnabled = true;
    [self addSubview:self.titleLab];
    
    self.dotView = [[ZJMaskView alloc] init];
    self.dotView.backgroundColor = ZJColorWithHex(0x333333);
    self.dotView.layer.cornerRadius = self.dotViewRaduis;
    self.dotView.clipsToBounds = true;
    [self addSubview:self.dotView];
    
    self.bottomLineView = [UIView new];
    [self.bottomLineView setBackgroundColor:kNormarLineColor];
    [self addSubview:self.bottomLineView];
    
    self.verticalLineView = [UIView new];
    [self.verticalLineView setBackgroundColor:ZJBorderLayerCorlor];
    [self addSubview:self.verticalLineView];
}


/**
 设置 bottomLine 是否高亮
 
 @param isHightlight YES/NO
 */
- (void)setDotBottomLineHightlight:(BOOL)isHightlight {
    [self.bottomLineView setBackgroundColor:isHightlight ?
                                     kHightlightLineColor : kNormarLineColor ];
}

/**
 设置Title
 
 @param aTitle title
 */
- (void)setDotTitle:(NSString *)aTitle {
    [self.titleLab setText:aTitle];
}


/**
 设置实心圆点是否显示
 
 @param isHide  yes/no
 */
- (void)setDotPointHide:(BOOL)isHide {
    [self.dotView setHidden:isHide];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *pointView = [super hitTest:point withEvent:event];
    if ([pointView isKindOfClass:self.class]) {
        return nil;
    }
    return pointView;
}


@end
