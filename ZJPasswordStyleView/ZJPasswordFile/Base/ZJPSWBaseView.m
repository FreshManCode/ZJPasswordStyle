//
//  ZJBaseView.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJPSWBaseView.h"


@implementation ZJPSWBaseView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self zj_addSubviews];
    [self zj_addConstraints];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self zj_addSubviews];
        [self zj_addConstraints];
    }
    return self;
}


- (void)zj_addSubviews {
    
}

- (void)zj_addConstraints {
    
}
@end
