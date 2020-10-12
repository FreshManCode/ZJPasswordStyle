//
//  ZJPSWRectEncryptView.h
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2020/6/3.
//  Copyright © 2020 com.zhangjunjun.com. All rights reserved.
//

#import "ZJPSWBaseView.h"
#import "ZJPasswordViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJPSWRectEncryptView : ZJPSWBaseView <ZJPasswordViewProtocol>

@property (nonatomic,weak) id <ZJPasswordViewDelegate> delegate;



@end

NS_ASSUME_NONNULL_END
