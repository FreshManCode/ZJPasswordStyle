//
//  ZJPasswordDotView.h
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWBaseView.h"
#import "ZJMaskView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,ZJPasswordType) {
    ZJPasswordBottomLineNormal    = 0, //下划线正常样式
    ZJPasswordBottomLineEncrytion = 1, //下划线加密样式
    ZJPasswordRectangleNormal     = 2, //矩形框正常样式
    ZJPasswordRectangleEncryption = 3, //矩形框加密样式
};

@interface ZJPasswordDotView : ZJPSWBaseView

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIView *verticalLineView;
@property (nonatomic, strong) ZJMaskView *dotView;

//实心圆点半径
@property (nonatomic, assign) CGFloat dotViewRaduis;
//底部分割线与view的gap
@property (nonatomic, assign) CGFloat kLineLeftGap;
//垂直分割线与View的gap
@property (nonatomic, assign) CGFloat kLineTopGap;



+ (instancetype)createDotViewWithType:(ZJPasswordType)type
                                frame:(CGRect)frame;


/**
 设置 bottomLine 是否高亮

 @param isHightlight YES/NO
 */
- (void)setDotBottomLineHightlight:(BOOL)isHightlight;

/**
 设置Title

 @param aTitle title
 */
- (void)setDotTitle:(NSString *)aTitle;


/**
 设置实心圆点是否显示

 @param isHide  yes/no
 */
- (void)setDotPointHide:(BOOL)isHide;

@end

NS_ASSUME_NONNULL_END
