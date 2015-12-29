//
//  UINavigationController+NestedPushFix.h
//  LeanChat
//
//  Created by 陈宜龙 on 15/12/27.
//  Copyright © 2015年 LeanCloud（Bug汇报：QQ1356701892）.  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NestedPushFix)

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated navigationLock:(id)lock;
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated navigationLock:(id)lock;
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated navigationLock:(id)lock;
- (id)navigationlock;

@end
