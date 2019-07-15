//
//  XCProxy.h
//  TimerTest
//
//  Created by XianCheng Wang on 2019/7/15.
//  Copyright © 2019 XianCheng Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface XCProxy : NSProxy
@property (nonatomic,weak)id target;
@end

NS_ASSUME_NONNULL_END
