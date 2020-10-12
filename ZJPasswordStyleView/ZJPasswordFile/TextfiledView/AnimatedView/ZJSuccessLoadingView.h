//
//  ZJSuccessLoadingView.h
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/7/4.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJPSWBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJSuccessLoadingView : ZJPSWBaseView

@property (nonatomic,copy) void (^ZJSuccessLoadEnd)(void);


- (void)beginAnimating;

- (void)stopAnimating;



@end

NS_ASSUME_NONNULL_END
