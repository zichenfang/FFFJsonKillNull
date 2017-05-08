//
//  NSDictionary+JsonKillNull.h
//  FFFJsonKillNullDemo
//
//  Created by 殷玉秋 on 2017/5/8.
//  Copyright © 2017年 fff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonKillNull)
-(NSString *)string_ForKey:(NSString *)theKey;
-(NSArray *)array_ForKey:(NSString *)theKey;
-(NSDictionary *)dictionary_ForKey:(NSString *)theKey;
-(NSString *)json_String;
- (NSMutableData *)xmlPostData;
@end
