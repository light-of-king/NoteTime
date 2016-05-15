//
//  Trans.m
//  tableView
//
//  Created by xukai on 16/4/19.
//  Copyright (c) 2016年 King. All rights reserved.
//

#import "Trans.h"
#import <objc/runtime.h>

@implementation Trans
+ (id)DictToProperty:(NSDictionary *)dict Class:(Class)cls{
    id result = [[cls alloc]init];
    
    uint count = 0;
    Ivar *ivars = class_copyIvarList([cls class], &count);
    //　遍历成员变量列表，其中每个变量都是Ivar类型的结构体
    for (const Ivar *p = ivars; p < ivars + count; ++p)
    {
        Ivar const ivar = *p;
        
        //　获取变量名
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 若此变量未在类结构体中声明而只声明为Property，则变量名加前缀 '_'下划线
        // 比如 @property(retain) NSString *abc;则 key == _abc;
        
        if ([key hasPrefix:@"_"]) {
            key = [key substringFromIndex:1];
        }
        
        //　获取变量值
        id value = [dict valueForKey:key];
        
        //　取得变量类型
        // 通过 type[0]可以判断其具体的内置类型
//        const char *type = ivar_getTypeEncoding(ivar);
        
        if (value)
        {
            [result setValue:value forKey:key];
        }
    }

    return result;
}
@end
