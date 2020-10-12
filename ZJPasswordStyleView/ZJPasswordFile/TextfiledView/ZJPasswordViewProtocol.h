//
//  ZJPasswordViewProtocol.h
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define ZJBorderLayerCorlor          ZJColorWithHex(0xDEE2EC)

#define kNormarLineColor             ZJColorWithHex(0xE4E4E4)

#define kHightlightLineColor         ZJColorWithHex(0x3773FF)



NS_ASSUME_NONNULL_BEGIN
//最大密码长度
#define kMaxCount 6

typedef NS_ENUM(NSInteger,ZJPasswordViewEventType) {
    ZJPasswordViewEventAutoDone     = 1, //输入密码达到6位
    ZJPasswordViewEventLengthUpdate = 2, //输入密码长度变化
    ZJPasswordViewEventOKButton     = 3, //点击了键盘工具条,使键盘下落
    ZJPasswordViewAnimateViewFinish = 4, //输入密码动画完成了
};


@protocol ZJPasswordViewDelegate;

@protocol ZJPasswordViewProtocol <NSObject>


/**
 用户回调对应事件的委托
 */
@property (nonatomic, weak) id <ZJPasswordViewDelegate> delegate;


/**
 使键盘弹出
 */
- (void)makeTextfieldBecomeFirstResponder;


/**
 使键盘关闭
 */
- (void)makeTextfieldResignFirstResponder;


/**
 自动显示键盘

 @param delay 延迟多久
 */
- (void)autoShowKeyboardDelay:(NSTimeInterval)delay;


/**
 清除已经输入的全部字符
 */
- (void)clearAllInputChars;


/**
 当前输入的字符长度

 @return length
 */
- (NSInteger)textLength;


@optional;

- (void)showCircleAnimating;

- (void)stopCircleAnimating;

- (void)showCheckAnimation;


@end

@protocol  ZJPasswordViewDelegate <NSObject>

/**
 对应的代理事件
 
 @param textfieldView 响应的包含Textfield 的view
 @param result 加密后的结果(有些情况下可能为空)
 @param type 事件类型
 */
- (void)textfieldView:(UIView <ZJPasswordViewProtocol> *)textfieldView
               result:(NSString *)result
            eventType:(ZJPasswordViewEventType)type;


@optional

/**
 点击了Textfiled
 
 @param textfieldView 包含Textfield的view
 */
- (void)textfieldViewDidClicked:(UIView <ZJPasswordViewProtocol> *)textfieldView;



@end


NS_ASSUME_NONNULL_END
