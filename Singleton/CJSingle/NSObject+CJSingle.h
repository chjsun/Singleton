//
//  NSObject+CJSingle.h
//  Singleton
//
//  Created by 孙传俊 on 2018/4/4.
//  Copyright © 2018年 chjsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CJSingle)

/**
 创建一个单例对象

 @return 返回一个单例对象
 */
+(instancetype)singleObject;

/**
 将当前对象添加到单例列表中,已经有的则不覆盖
 */
- (void)joinSingle;

/**
 将当前对象添加到单例列表中,已经有的会被覆盖
 */
- (void)joinSingleForce;

/**
 清空当前类的所有属性值，还原到初始状态
 */
- (void)clearAttr;

/**
 删除当前单例对象，删除不是说清空，而是可以正常释放，并不会影响该对象作为局部对象的正常使用
 */
-(void)removeSingleObject;

@end
