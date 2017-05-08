//
//  NSObject+JsonKillNull.m
//  FFFJsonKillNullDemo
//
//  Created by 殷玉秋 on 2017/5/8.
//  Copyright © 2017年 fff. All rights reserved.
//

#import "NSObject+JsonKillNull.h"

@implementation NSObject (JsonKillNull)
//递归方式处理掉object中的空值
- (id)noNullObject
{
    NSString *classStr = [NSString stringWithFormat:@"%@",[self class]];
    //若是字典，则遍历其中的元素，并处理
    if ([classStr rangeOfString:@"Dictionary"].length>0) {
        
        NSMutableDictionary *coolDic = [NSMutableDictionary dictionary];
        NSDictionary *oldDic = (NSDictionary *)self;
        for(NSString *akey in [oldDic allKeys])
        {
            id coolValue = [[oldDic objectForKey:akey] noNullObject];
            [coolDic setObject:coolValue forKey:akey];
        }
        return coolDic;
        
    }
    //若是数组，则遍历其中的元素，并处理
    else if ([classStr rangeOfString:@"Array"].length>0)
    {
        NSMutableArray *coolArray = [NSMutableArray array];
        NSArray *oldArray = (NSArray *)self;
        for(id aobject in oldArray)
        {
            id coolObject = [aobject noNullObject];
            [coolArray addObject:coolObject];
        }
        return coolArray;
        
    }
    //若是空null，则返回空字符串
    else if ([classStr rangeOfString:@"Null"].length>0||[classStr rangeOfString:@"null"].length>0||[classStr rangeOfString:@"NULL"].length>0)
    {
        return @"";
    }
    //其他的类全部原值返回
    else
    {
        return self;
    }
    
    
}

@end
