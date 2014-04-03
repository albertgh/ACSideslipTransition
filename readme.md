# ACSideslipTransition

让 presentViewController 拥有如 pushViewController 的动画和手势支持。 
<img src="https://github.com/albertgh/ACSideslipTransition/raw/master/screenshot.gif"/>

## Usage

将包含9个文件的 ACSideslipTransition 文件夹拖入你的项目中，

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


### Requirements

* 项目使用了 ARC
* 只适用 iOS 7



### LICENSE

最近好像比较流行用这个协议，

WTFPL 

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.

```