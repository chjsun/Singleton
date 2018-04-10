//
//  NSObject+CJSingle.m
//  Singleton
//
//  Created by 孙传俊 on 2018/4/4.
//  Copyright © 2018年 chjsun. All rights reserved.
//

#import "NSObject+CJSingle.h"
#import <objc/runtime.h>

static NSString *saveSring = @"CJSaveSingleObject9527";

static NSMutableDictionary *storagePool;

@implementation NSObject (CJSingle)

+ (instancetype)singleObject{
    NSObject *model;
    NSString *modelClass = NSStringFromClass([self class]);
    if (storagePool != nil && [storagePool objectForKey:modelClass]) {//首先判断缓存池或缓存池是否存在
        model = storagePool[modelClass];

    }else{
        @synchronized(self){
            if (storagePool == nil) {//首先判断缓存池是否存在
                storagePool = [[NSMutableDictionary alloc] init];//不存在就先创建
            }
            if ([storagePool objectForKey:modelClass]) {
                return storagePool[modelClass];
            }else{
                model = [[self alloc] init];
                [storagePool setObject:model forKey:modelClass];
            }
        }
    }
    return model;
}

- (void)joinSingle{
    NSString *modelClass = NSStringFromClass([self class]);
    if (storagePool != nil && [storagePool objectForKey:modelClass]) {//首先判断缓存池或缓存池是否存在
        NSLog(@"提示--已经存在一个，不进行替换");
    }else{
        @synchronized(self){
            if (storagePool == nil) {//首先判断缓存池是否存在
                storagePool = [[NSMutableDictionary alloc] init];//不存在就先创建
            }
            if ([storagePool objectForKey:modelClass]) {
                NSLog(@"提示--已经存在一个，不进行替换");
            }else{
                [storagePool setObject:self forKey:modelClass];
            }
        }
    }
}

- (void)joinSingleForce{
    NSString *modelClass = NSStringFromClass([self class]);

    if (storagePool == nil) {//首先判断缓存池是否存在
        storagePool = [[NSMutableDictionary alloc] init];//不存在就先创建
    }

    [storagePool setObject:self forKey:modelClass];
}

- (void)clearAttr{
    // 记录属性的个数
    unsigned int propertyCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);

    // 把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        // 取出每一个属性
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        // 将所有属性值设置为nil

        //  number类型就放@(0)
        if ([[self valueForKey:[[NSString alloc] initWithUTF8String:propertyName]] isKindOfClass:[NSNumber class]]) {
            [self setValue:@(0) forKey:[[NSString alloc] initWithUTF8String:propertyName]];
            continue;
        }

        [self setValue:nil forKey:[[NSString alloc] initWithUTF8String:propertyName]];
    }
}

- (void)removeSingleObject{
    //判断缓存池是否存在
    if (storagePool == nil) {
        //不存在就先创建
        storagePool = [[NSMutableDictionary alloc] init];
    }

    NSString *modelClass = NSStringFromClass([self class]);

    [storagePool removeObjectForKey:modelClass];
}

@end
