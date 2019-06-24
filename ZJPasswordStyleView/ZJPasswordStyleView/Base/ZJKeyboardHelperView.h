//
//  ZJKeyboardHelperView.h
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJKeyboardHelperView : ZJBaseView

+ (instancetype)createHelerViewWithFrame:(CGRect)frame
                         keyboardDismiss:(void(^)(void))dismiss;


@end

NS_ASSUME_NONNULL_END
