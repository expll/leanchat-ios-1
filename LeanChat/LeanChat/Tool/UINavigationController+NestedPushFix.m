//
//  UINavigationController+NestedPushFix.m
//  LeanChat
//
//  Created by 陈宜龙 on 15/12/27.
//  Copyright © 2015年 lzwjava@LeanCloud QQ: 651142978. All rights reserved.
// fix nested push crash ,look the crash log:
//2015-12-27 18:33:42.894 LeanChat[544:238601] Finishing up a navigation transition in an unexpected state. Navigation Bar subview tree might get corrupted.
//2015-12-27 18:33:42.894 LeanChat[544:238601] Finishing up a navigation transition in an unexpected state. Navigation Bar subview tree might get corrupted.
//2015-12-27 18:33:45.848 LeanChat[544:238601] nested pop animation can result in corrupted navigation bar
//2015-12-27 18:33:45.878 LeanChat[544:238601] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Can't add self as subview'
//*** First throw call stack:
//(0x1824fd900 0x181b6bf80 0x1824fd848 0x1871f7504 0x187489d7c 0x1871fe964 0x1873e9118 0x187504840 0x1873e8c90 0x187b51c7c 0x18748cb90 0x1873a24e8 0x1872ae9b8 0x1872ae694 0x1872ae5fc 0x1871eb778 0x184bfab2c 0x184bf5738 0x184bf55f8 0x184bf4c94 0x184bf49dc 0x184bee0cc 0x1824b4588 0x1824b232c 0x1824b275c 0x1823e1680 0x1838f0088 0x187258d90 0x100092fb0 0x181f828b8)
//libc++abi.dylib: terminating with uncaught exception of type NSException
//http://www.cnblogs.com/yanyan1119/p/3951976.html

#import "UINavigationController+NestedPushFix.h"

@implementation UINavigationController (NestedPushFix)

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated navigationLock:(id)lock;
{
    if (!lock || self.topViewController == lock)
    {
        [self pushViewController:viewController animated:animated];
    }
}

- (id)navigationlock
{
    return self.topViewController;
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated navigationLock:(id)lock;
{
    if (!lock || self.topViewController == lock)
    {
        [self popToViewController:viewController animated:animated];
    }
    return @[];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated navigationLock:(id)lock
{
    if (!lock || self.topViewController == lock)
    {
        [self popToRootViewControllerAnimated:animated];
    }
    return @[];
}

@end
