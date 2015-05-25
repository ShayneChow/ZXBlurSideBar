//
//  ZXBlurSideBarViewController.h
//  ZXBlurSideBar
//
//  Created by ChowShayne on 15/5/25.
//  Copyright (c) 2015年 微加科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kSidebarWidth kScreenWidth/4*3 // 侧栏宽度，设屏宽为屏幕的3/4，右侧留一条空白可以看到背后页面内容


@interface ZXBlurSideBarViewController : UIViewController

@property (nonatomic, strong) UIView *contentView; // 所有要显示的子控件全添加到这里
@property (nonatomic, assign) BOOL isSidebarShown;

// 当有pan事件时调用，传入UIPanGestureRecognizer，仅供右滑返回手势使用
- (void)panDetectedForBack:(UIPanGestureRecognizer *)recoginzer;

// 当有pan事件时调用，传入UIPanGestureRecognizer
- (void)panDetected:(UIPanGestureRecognizer *)recoginzer;

// 执行显示/隐藏Sidebar
- (void)showHideSidebar;

// 已经完成显示，需要时可以在子类中用
- (void)sidebarDidShown;

// 触发了右滑事件，需要时可以在子类中用
- (void)slideToRightOccured;

@end
