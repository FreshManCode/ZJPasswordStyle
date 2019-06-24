//
//  ZJPSWRectDotNormalView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWRectDotNormalView.h"

@implementation ZJPSWRectDotNormalView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_initUIWithFrame:frame];
    }
    return self;
}

- (void)p_initUIWithFrame:(CGRect)frame {
    [self.dotView          setHidden:true];
    [self.bottomLineView   setHidden:true];
    
    self.verticalLineView.frame =  CGRectMake(frame.size.width - 1, 0, 1.f, frame.size.height);
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
}




@end
