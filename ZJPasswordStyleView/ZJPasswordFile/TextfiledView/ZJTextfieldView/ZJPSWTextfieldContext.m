//
//  ZJPSWTextfieldContext.m
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import "ZJPSWTextfieldContext.h"
#import "ZJPSWLineNormalTextfiledView.h"
#import "ZJPSWLineEncryptTextfiledView.h"
#import "ZJPSWRectEncryptTextfiledView.h"
#import "ZJPSWRectNormalTextfieldView.h"
#import "ZJPSWRectAnimateTextfieldView.h"


@interface ZJPSWTextfieldContext ()

@property (nonatomic, strong) UIView <ZJPasswordViewProtocol> * textfiledView;


@end

@implementation ZJPSWTextfieldContext


+ (UIView <ZJPasswordViewProtocol> *)configureTextfieldView:(ZJPSWTextfieldViewType)viewType
                                                      frame:(CGRect)frame {
    return [[self alloc] configureWithType:viewType frame:frame];
}

- (UIView <ZJPasswordViewProtocol> *)configureWithType:(ZJPSWTextfieldViewType)type
                                                 frame:(CGRect)frame {
    switch (type) {
        case ZJPSWTextfieldViewLineNormal: {
            self.textfiledView = [[ZJPSWLineNormalTextfiledView alloc] initWithFrame:frame];
        }
            break;
        case ZJPSWTextfieldViewLineEncryption: {
            self.textfiledView = [[ZJPSWLineEncryptTextfiledView alloc] initWithFrame:frame];
        }
            break;
        case ZJPSWTextfieldViewRectNormal: {
            self.textfiledView = [[ZJPSWRectNormalTextfieldView alloc]initWithFrame:frame];
        }
            break;
        case ZJPSWTextfieldViewRectEncryption: {
            self.textfiledView = [[ZJPSWRectEncryptTextfiledView alloc] initWithFrame:frame];
        }
            break;
        case ZJPSWTextfieldViewWithAnimating: {
            self.textfiledView = [[ZJPSWRectAnimateTextfieldView alloc] initWithFrame:frame];
        }
            break;
            
        default:
            break;
    }
    [self.textfiledView autoShowKeyboardDelay:0.5f];
    return self.textfiledView;
}

@end
