//
//  ZJPSWTextfieldContext.h
//  ImitateBaiduCourse
//
//  Created by 张君君 on 2019/6/21.
//  Copyright © 2019年 ZhangJunJun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJPasswordViewProtocol.h"

typedef NS_ENUM(NSInteger,ZJPSWTextfieldViewType) {
    ZJPSWTextfieldViewLineNormal     = 0,
    ZJPSWTextfieldViewLineEncryption = 1,
    ZJPSWTextfieldViewRectNormal     = 2,
    ZJPSWTextfieldViewRectEncryption = 3,
    ZJPSWTextfieldViewWithAnimating  = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZJPSWTextfieldContext : NSObject

+ (UIView <ZJPasswordViewProtocol> *)configureTextfieldView:(ZJPSWTextfieldViewType)viewType
                                                      frame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
