//
//  ACSideslipMacros.h
//


#ifndef ACSideslipMacros
#define ACSideslipMacros


#import "ACSideslipPresentAnimation.h"
#import "ACSideslipDismissAnimation.h"
#import "ACSideslipSwipeInteractiveTransition.h"



#define PRESENT_DURATION            0.5f            // 弹出动画时间
#define PRESENT_SPRING              0.8f            // 弹性


#define PARALLAX_DX                 -80.f           // 处于下面的视图的位置差，以便模拟相对运动


#define DISMISS_DURATION            0.3f            // 解散动画时间


#define SWIPE_PERCENT               0.58f           // 前视图滑动距离占屏幕多少百分比后松开完成解散视图


#endif
