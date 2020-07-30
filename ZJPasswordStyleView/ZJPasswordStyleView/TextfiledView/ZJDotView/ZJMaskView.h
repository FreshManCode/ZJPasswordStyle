//
//  ZJMaskView.h
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@class ZJMaskView;
@protocol ZJMaskViewDelegate <NSObject>
@optional;
- (void)maskViewDidClick:(ZJMaskView *)maskView;

@end

@interface ZJMaskView : ZJPSWBaseView

{
    struct {
        unsigned int ClickMaskView : 1;
    }_DelegateFlags;
}

@property (nonatomic,weak) id <ZJMaskViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
