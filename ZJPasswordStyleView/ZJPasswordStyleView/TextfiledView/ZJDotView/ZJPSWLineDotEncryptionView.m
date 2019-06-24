//
//  ZJPSWLineDotEncryptionView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWLineDotEncryptionView.h"

@implementation ZJPSWLineDotEncryptionView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_initUIWithFrame:frame];
    }
    return self;
}
- (void)p_initUIWithFrame:(CGRect)frame {
    [self.verticalLineView   setHidden:true];
    [self.titleLab           setHidden:true];
    
    self.bottomLineView.frame =  CGRectMake(self.kLineLeftGap, frame.size.height - 5.f, frame.size.width - 2 * self.kLineLeftGap, 1.f);
    
    [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.dotViewRaduis * 2, self.dotViewRaduis * 2));
    }];
}



- (void)zj_addSubviews {
    [super zj_addSubviews];
    [self.titleLab         setHidden:true];
    [self.verticalLineView setHidden:true];
}



@end
