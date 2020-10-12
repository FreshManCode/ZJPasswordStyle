//
//  ZJPSWRectDotEncryptionView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWRectDotEncryptionView.h"

@implementation ZJPSWRectDotEncryptionView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_initUIWithFrame:frame];
    }
    return self;
}
- (void)p_initUIWithFrame:(CGRect)frame {
    [self.titleLab          setHidden:true];
    [self.bottomLineView setHidden:true];
    
    self.verticalLineView.frame =  CGRectMake(frame.size.width - 1, 0, 1.f, frame.size.height);
    
    [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.dotViewRaduis * 2, self.dotViewRaduis * 2));
    }];
}



@end
