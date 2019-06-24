//
//  ZJPSWLineDotNormalView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWLineDotNormalView.h"

@implementation ZJPSWLineDotNormalView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_initUIWithFrame:frame];
    }
    return self;
}
- (void)p_initUIWithFrame:(CGRect)frame {
    [self.dotView          setHidden:true];
    [self.verticalLineView setHidden:true];
    
    self.bottomLineView.frame =  CGRectMake(self.kLineLeftGap, frame.size.height - 5.f, frame.size.width - 2 * self.kLineLeftGap, 1.f);
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
}





@end
