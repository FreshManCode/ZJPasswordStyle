//
//  ZJModel.h
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,ZJPasswordStyleType) {
    ZJPasswordStyleBottomLineNormal  = 0, //下划线高亮样式明文
    ZJPasswordStyleBottomLineEncrypt = 1, //下划线高亮样式密文
    ZJPasswordStyleRectangleNormal   = 2, //矩形框样式明文
    ZJPasswordStyleRectangleEncrypt  = 3, //矩形框样式密文
    ZJPasswordStyleWithAnimating     = 4, //带动画的
    
};

@interface ZJModel : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) ZJPasswordStyleType styleType;

@end

@interface ZJViewModel : NSObject

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowInSection:(NSInteger)setion;

- (ZJModel *)rowModelOfIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
