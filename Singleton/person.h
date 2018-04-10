//
//  person.h
//  Singleton
//
//  Created by 孙传俊 on 2018/4/4.
//  Copyright © 2018年 chjsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface person : NSObject

/**  */
@property(nonatomic, copy) NSString *name;
/** 说明 */
@property(nonatomic, copy) NSString *sex;
/** age */
@property(nonatomic, copy) NSString *age;

@end
