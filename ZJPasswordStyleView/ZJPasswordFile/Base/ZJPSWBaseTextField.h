//
//  ZJBaseTextField.h
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2018/12/20.
//  Copyright © 2018年 ZhangJunJun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZJPSWBaseTextField : UITextField

@property (nonatomic,weak) id <UITextFieldDelegate> pDelegate;
@property (nonatomic, assign) NSInteger maxCount;

/**
 是否允许长按弹出 Copy等相关选择框 (YES/NO)
 */
@property (nonatomic, assign) BOOL allowCopyMenu;


/**
 是否允许显示键盘上方的工具条
 */
@property (nonatomic, assign) BOOL showToolbarView;


/**
 工具条事件回调
 */
@property (nonatomic,copy) void (^ToolBarViewEvent)(void);



- (BOOL)isReachMaxCountCharacterRange:(NSRange)range replacmentString:(NSString *)string;


@end


