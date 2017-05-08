//
//  NSDictionary+JsonKillNull.m
//  FFFJsonKillNullDemo
//
//  Created by 殷玉秋 on 2017/5/8.
//  Copyright © 2017年 fff. All rights reserved.
//

#import "NSDictionary+JsonKillNull.h"

@implementation NSDictionary (JsonKillNull)
-(NSString *)string_ForKey:(NSString *)theKey
{
    NSString * theNewStr =[NSString stringWithFormat:@"%@",[self objectForKey:theKey]];
    if ([theNewStr isEqualToString:@"<null>"]) {
        return @"";
    }
    if ([theNewStr isEqualToString:@"<NULL>"]) {
        return @"";
    }
    if ([theNewStr isEqualToString:@"NULL"]) {
        return @"";
    }
    if ([theNewStr isEqualToString:@"null"]) {
        return @"";
    }
    if ([theNewStr isEqualToString:@"(null)"]) {
        return @"";
    }
    return theNewStr;
}
-(NSDictionary *)dictionary_ForKey:(NSString *)theKey
{
    NSDictionary * theNewDic =[self objectForKey:theKey];
    if ([[theNewDic class]isSubclassOfClass:[NSDictionary class]]) {
        return theNewDic;
    }
    else
    {
        return @{};
    }
}
-(NSArray *)array_ForKey:(NSString *)theKey
{
    NSArray * array =[self objectForKey:theKey];
    if ([[array class]isSubclassOfClass:[NSArray class]]) {
        return array;
    }
    else{
        return @[];
    }
}
-(NSString *)json_String
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    //    NSLog(@"jsonString =%@",jsonString);
    //    return [jsonString stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    return jsonString;
}

- (NSMutableData *)xmlPostData
{
    NSMutableData *postBody = [NSMutableData data];
    
    if (self ==nil||self.allKeys.count==0) {
        return postBody;
    }
    [postBody appendData:[[NSString stringWithFormat:@"<xml>"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSArray * array = [NSMutableArray arrayWithArray:[self allKeys]];
    
    for (int i=0; i<array.count; i++) {
        NSString *akey = [array objectAtIndex:i];
        NSString *value =[self string_ForKey:akey];
        if (value ==nil||value.length<=0)//过滤掉value为空的键值对
        {
            continue;
        }
        [postBody appendData:[[NSString stringWithFormat:@"<%@>%@</%@>",akey,value,akey] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [postBody appendData:[[NSString stringWithFormat:@"</xml>"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return postBody;
}
@end
