//
//  XCProxy.m
//  TimerTest
//
//  Created by XianCheng Wang on 2019/7/15.
//  Copyright © 2019 XianCheng Wang. All rights reserved.
//

#import "XCProxy.h"
@implementation XCProxy
// 发送给target
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
// 给target注册一个方法签名
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

@end
