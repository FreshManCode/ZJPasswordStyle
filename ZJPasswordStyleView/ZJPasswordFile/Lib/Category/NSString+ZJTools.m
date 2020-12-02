//
//  NSString+ZJTools.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2020/12/2.
//  Copyright © 2020 com.zhangjunjun.com. All rights reserved.
//

#import "NSString+ZJTools.h"

@implementation NSString (ZJTools)

- (BOOL)isNull {
    if ( [self isKindOfClass:[NSNull class]] ||self.length < 1  ) {
        return true;
    }
    return  false;
}

/// 过滤空格
- (NSString *)filterSpaceChar {
    if ([self isNull]) {
        return self;
    }
    if ([self containsString:@" "]) {
        return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return self;
}

@end
