//
//  ViewController.m
//  RootModel
//
//  Created by chjsun on 2016/12/12.
//  Copyright © 2016年 chjsun. All rights reserved.
//

#import "ViewController.h"
#import "person.h"
#import "NSObject+CJSingle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 自己调用想要测试的方法
    [self test];

}

#pragma mark - 测试
- (void)test{
    person *p = [person singleObject];
    NSLog(@"原始地址：%p",  p);
    NSLog(@"单例地址：%p",  [person singleObject]);
    NSLog(@"单例地址：%p",  [person singleObject]);

    // 删除
    [p removeSingleObject];

    NSLog(@"%p",  p);

    NSLog(@"%p",  [person singleObject]);
    NSLog(@"%p",  [person singleObject]);

    person *p2 = [[person alloc] init];

    NSLog(@"%p",  [person singleObject]);

    NSLog(@"新对象地址%p",  p2);

    [p2 joinSingle];

    NSLog(@"%p",  p2);

    [p2 joinSingleForce];

    NSLog(@"强制更新：%p",  p2);
    NSLog(@"强制更新：%p",  [person singleObject]);
    NSLog(@"%p",  p);
}

@end
