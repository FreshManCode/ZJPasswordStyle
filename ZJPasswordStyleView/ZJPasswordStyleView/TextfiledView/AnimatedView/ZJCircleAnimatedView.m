//
//  ZJCircleAnimatedView.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/7/4.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJCircleAnimatedView.h"

@interface ZJCircleAnimatedView ()

@property (nonatomic, strong) CAShapeLayer  *circleLayer;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) CGFloat startAngle;

@property (nonatomic, assign) CGFloat endAngle;

@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, assign) CGFloat speed;

@property (nonatomic, assign) CGPoint arcCenter;


@end

@implementation ZJCircleAnimatedView

static CGFloat const kRadius = 60;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.circleLayer = [CAShapeLayer layer];
        [self initUpUI];
    }
    return self;
}

- (void)initUpUI {
    self.lineWidth  = 4.f;
    self.startAngle = - M_PI_2;
    self.arcCenter  = CGPointMake(kRadius/2.0,kRadius / 2.0);
    
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.frame  = CGRectMake((CGRectGetWidth(self.frame ) -  kRadius ) / 2.0, (CGRectGetHeight(self.frame ) -  kRadius ) / 2.0, kRadius, kRadius);
    self.circleLayer.strokeColor = [UIColor blueColor].CGColor;
    self.circleLayer.lineWidth   = self.lineWidth;
    self.circleLayer.fillColor   = [UIColor clearColor].CGColor;
    self.circleLayer.lineCap  = kCALineCapRound;
    [self.layer addSublayer:self.circleLayer];
    
}

- (void)beginAnimating {
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(targetEvent:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)targetEvent:(CADisplayLink *)link {
    self.progress   += self.speed;
    self.startAngle = - M_PI_2;
    if (_progress >= 1) {
        self.progress = 0;
    }
    _endAngle = _startAngle + _progress * M_PI * 2;

    if (_endAngle > M_PI) {
        //大于180度时,速度变慢
        CGFloat progress = 1 - (1 - _progress) * 4;
        _startAngle = -M_PI_2 + progress * M_PI * 2;
    }

    CGFloat radius  = kRadius/2.0f - _lineWidth/2.0f;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.arcCenter
                                                        radius:radius
                                                    startAngle:_startAngle
                                                      endAngle:_endAngle
                                                     clockwise:true];
    self.circleLayer.path = path.CGPath;
}

//有种先快后慢的感觉
-(CGFloat)speed{
    if (_endAngle > M_PI) {
        return 0.3 / 60.f;
    }
    return 3 / 60.f;
}


- (void)endAnimating {
    self.displayLink.paused = true;
    [self.circleLayer removeFromSuperlayer];
}


@end
