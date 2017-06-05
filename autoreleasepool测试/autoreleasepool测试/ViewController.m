//
//  ViewController.m
//  autoreleasepool测试
//
//  Created by qwkj on 2017/6/5.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (long long i = 0; i < 1000000; ++i) {
//        @autoreleasepool {
            NSString *str = @"Hello World";
            str = [str stringByAppendingFormat:@" - %lld", i];
            str = [str uppercaseString];
            NSLog(@"%@", str);
//        }
    }
    //位添加autoreleasepool，程序在遍历未结束时内存一直在飙升，看着就像要搞事情
    //添加了autoreleasepool后括号内的变量执行一遍就会释放，内存使用上升很少。可见autoreleasepool资料http://blog.sunnyxx.com/2014/10/15/behind-autorelease/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
