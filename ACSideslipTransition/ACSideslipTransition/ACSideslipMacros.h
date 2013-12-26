//
//  ACSideslipMacros.h
//


#ifndef ACSideslipMacros
#define ACSideslipMacros


#import "ACSideslipPresentAnimation.h"
#import "ACSideslipDismissAnimation.h"
#import "ACSideslipSwipeInteractiveTransition.h"



#define PRESENT_DURATION            0.5f                    // 弹出动画时间
#define DISMISS_DURATION            0.3f                    // 解散动画时间

#define PRESENT_SPRING              1.0f                    // 弹性 (低于 1.0 有一定回弹特效)

#define PARALLAX_DX                 -95.f                   // 处于下面的视图的位置差，以便模拟相对运动

#define SWIPE_PERCENT               0.5f                    // 前视图滑动距离占屏幕多少百分比后松开完成解散视图

#define BLACK_MASK_ALPHA_MAX        0.2                     // 处于 上层 与 下层 之间的黑色遮罩 最大透明度
#define SHADOW_MASK_ALPHA_MAX       0.6                     // 处于 上层 VC 之下的阴影遮罩 最大透明度


#define CANCEL_DURATION             (0.3f / SWIPE_PERCENT)  // 拖拽手势停止后，会按已拖出占多少百分比乘以这个时间来取消动画
#define FINISH_DURATION             (0.1f / SWIPE_PERCENT)  // 拖拽手势停止后，会按已拖出占多少百分比乘以这个时间来完成动画


#endif
