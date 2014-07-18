# ACSideslipTransition

让 presentViewController 拥有如 pushViewController 的动画和手势支持。 
<img src="https://github.com/albertgh/ACSideslipTransition/raw/master/screenshot.gif"/>

## Usage

将包含 10 个文件的 ACSideslipTransition 文件夹拖入你的项目中，

在你要发起 presentViewController 的 VC 导入如下头文件。
```Objective-C
#import "ACSideslipTransition.h"
```

然后在发起 presentViewController 的事件中添加如下类似代码，
以弹出新 UIViewController，
```Objective-C
SecondViewController *sVC =  [[SecondViewController alloc] init];
        
ACSideslipTransition *transition = [[ACSideslipTransition alloc] init];
[transition sideslip:sVC from:self];
```

或 UINavigationController
```Objective-C
SecondViewController *sVC =  [[SecondViewController alloc] init];
    
UINavigationController *nC = [[UINavigationController alloc] initWithRootViewController:sVC];
    
self.sideslipTransition = [[ACSideslipTransition alloc] init];
[self.sideslipTransition sideslip:nC from:self];
```

如果需要滑动关闭完成后的回调（比如需要在弹出模态视图控制器的根视图上控制状态栏颜色变化时）
导入协议
```Objective-C
#import "ACSideslipSwipeInteractiveTransitionFinishedDelegate.h"
```
并让弹出的根视图控制器实现 'ACSideslipSwipeInteractiveTransitionFinishedDelegate' 协议
然后就可以在完成回调里做相应操作了，如下。

```Objective-C
#pragma mark - ACSideslipSwipeInteractiveTransitionFinishedDelegate

- (void)swipeInteractiveTransitionDidFinished
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
```



### Requirements

* ARC
* iOS 7 +



#### License

######WTFPL 


WTFPL 
