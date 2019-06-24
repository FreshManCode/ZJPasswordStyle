//
//  ZJMaskView.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJMaskView.h"

@implementation ZJMaskView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    static BOOL first = true;
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        return nil;
    }
    return hitView;
}

@end
