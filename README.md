# NSTimer
**第一种:NSTimer提供的API**
```
/**
 第一种:NSTimer提供的API
 使用NSTimer提供的API，在block中执行定时任务
 引用逻辑:self强引用timer弱引用target
 */
-(void)firstTimer{
    __weak typeof (self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf fire];
    }];
}

```

**第二种:借助runtime给对象添加消息处理的能力**
```
/**
 第二种:借助runtime给对象添加消息处理的能力
 
 引用逻辑:self强引用timer强引用target
 */
-(void)secondTimer{
    _target = [[NSObject alloc] init];
    class_addMethod([_target class], @selector(fire), class_getMethodImplementation([self class], @selector(fire)), "v@:");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:_target selector:@selector(fire) userInfo:nil repeats:YES];
}

-(void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}
```

** 第三种: 通过消息转发的方法的方式**
```
/**
 第三种: 通过消息转发的方法的方式
 创建一个集成自NSProxy的类XCProxy 声明一个target
 
 引用逻辑: self强引用timer强引用proxy弱引用self
 */
-(void)thirdTimer{
    self.proxy = [XCProxy alloc];
    self.proxy.target = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self.proxy selector:@selector(fire) userInfo:nil repeats:YES];
}

```

github：[demo](https://github.com/gitwangxiancheng/NSTimer.git)

参考：[iOS中解决NSTimer循环引用的三种方式](https://segmentfault.com/a/1190000019615349)
