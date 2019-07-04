//
//  ZJModel.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ZJModel.h"
#import <UIKit/UIKit.h>

@implementation ZJModel

@end

@interface ZJViewModel ()

@property (nonatomic, strong) NSMutableArray  <ZJModel *> *rows;


@end

@implementation ZJViewModel

- (id)init {
    if (self = [super init]) {
        [self configureDefaultData];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfRowInSection:(NSInteger)setion {

  
    
    return self.rows.count;
}

- (ZJModel *)rowModelOfIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.rows.count) {
        return nil;
    }
    return self.rows[indexPath.row];
}

- (void)configureDefaultData {
    for (int i = 0 ; i < 5; i++) {
        ZJModel *model = [ZJModel new];
        if (i == 0) {
            model.name = @"下划线高亮明文密码输入框样式";
            model.styleType = ZJPasswordStyleBottomLineNormal;
        }
        else if (i == 1) {
            model.name = @"下划线安全密码输入框样式";
            model.styleType = ZJPasswordStyleBottomLineEncrypt;
        }
        else if (i == 2) {
            model.name = @"矩形框明文密码输入框样式";
            model.styleType = ZJPasswordStyleRectangleNormal;
        }
        else if (i == 3) {
            model.name = @"矩形框安全密码输入框样式";
            model.styleType = ZJPasswordStyleRectangleEncrypt;
        }
        else if (i == 4) {
            model.name = @"密码密码框带完成动画";
            model.styleType = ZJPasswordStyleWithAnimating;
        }
        [self.rows addObject:model];
    }
}


- (NSMutableArray *)rows{
    if(!_rows){
        _rows = [NSMutableArray  new];
    }
    return _rows;
}



@end
