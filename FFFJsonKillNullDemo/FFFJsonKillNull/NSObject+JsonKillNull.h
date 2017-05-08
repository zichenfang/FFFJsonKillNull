//
//  NSObject+JsonKillNull.h
//  FFFJsonKillNullDemo
//
//  Created by 殷玉秋 on 2017/5/8.
//  Copyright © 2017年 fff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JsonKillNull)
//递归方式处理掉object中的空值
- (id)noNullObject;

@end
