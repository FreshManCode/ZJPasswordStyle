//
//  ZJSuccessLoadingView.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/7/4.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJSuccessLoadingView.h"

@interface ZJSuccessLoadingView () <CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@property (nonatomic, strong) CAShapeLayer *markLayer;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) CGFloat startAngle;

@property (nonatomic, assign) CGFloat endAngle;

@property (nonatomic, assign) CGPoint arcCenter;


@end

@implementation ZJSuccessLoadingView

static CGFloat const kRadius = 60.f;

static NSString * const kAnimationKey    = @"AnimationKey";
static NSString * const kCircleAnimation = @"kCircleAnimationValue";
static NSString * const kMarkAnimation = @"kMarkAnimationValue";

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.lineWidth  = 4.f;
    self.startAngle = - M_PI_2;
    self.endAngle   = - M_PI_2 + M_PI * 2;
    self.arcCenter  = CGPointMake(kRadius/2.0,kRadius / 2.0);
    
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.frame  = CGRectMake((CGRectGetWidth(self.frame ) -  kRadius ) / 2.0, (CGRectGetHeight(self.frame ) -  kRadius ) / 2.0, kRadius, kRadius);
    self.circleLayer.strokeColor = [UIColor blueColor].CGColor;
    self.circleLayer.lineWidth   = self.lineWidth;
    self.circleLayer.fillColor   = [UIColor clearColor].CGColor;
    self.circleLayer.lineCap     = kCALineCapRound;
    [self.layer addSublayer:self.circleLayer];
}

- (void)beginAnimating {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:self.arcCenter
                                                              radius:kRadius / 2.0
                                                          startAngle:self.startAngle
                                                            endAngle:self.endAngle
                                                           clockwise:true];
    self.circleLayer.path = bezierPath.CGPath;
    
    CABasicAnimation *aniamtion = [self anitionWithDuration:0.8f];
    [aniamtion setValue:kCircleAnimation     forKey:kAnimationKey];
    [self.circleLayer addAnimation:aniamtion forKey:kAnimationKey];
}

- (void)stopAnimating {
    if (self.circleLayer) {
        [self.circleLayer removeFromSuperlayer];
    }
    if (self.markLayer) {
        [self.markLayer removeFromSuperlayer];
    }
}

- (void)addSuccessMarkView {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = self.lineWidth;
    [bezierPath moveToPoint:CGPointMake(self.arcCenter.x - 20, self.arcCenter.y + 10)];
    [bezierPath addLineToPoint:CGPointMake(self.arcCenter.x - 5, self.arcCenter.y + 15)];
    [bezierPath addLineToPoint:CGPointMake(self.arcCenter.x + 20, self.arcCenter.y - 15)];
    shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.path = bezierPath.CGPath;
    CABasicAnimation *animaion = [self anitionWithDuration:0.4];
    [animaion setValue:kMarkAnimation forKey:kAnimationKey];
    [shapeLayer addAnimation:animaion forKey:kAnimationKey];
    self.markLayer = shapeLayer;
    [self.circleLayer addSublayer:self.markLayer];
}

- (CABasicAnimation *)anitionWithDuration:(NSTimeInterval)duration {
    CABasicAnimation *aniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    aniamtion.fromValue = @(0);
    aniamtion.toValue   = @(1);
    aniamtion.removedOnCompletion = false;
    aniamtion.duration  = duration;
    aniamtion.repeatCount = 1;
    aniamtion.delegate = self;
    return aniamtion;
}

- (void)animationDidStop:(CAAnimation *)anim
                finished:(BOOL)flag {
    if ([[anim valueForKey:kAnimationKey] isEqualToString:kCircleAnimation]) {
        [self addSuccessMarkView];
    }
    else if ([[anim valueForKey:kAnimationKey] isEqualToString:kMarkAnimation]) {
        ZJAfter(0.2, ^{
            [self stopAnimating];
            !self.ZJSuccessLoadEnd ? : self.ZJSuccessLoadEnd();
        });
    }
}



@end
