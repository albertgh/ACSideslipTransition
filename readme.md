# ACSideslipTransition

Make presentViewController's Animation more like pushViewController's。 
<img src="https://github.com/albertgh/ACSideslipTransition/raw/master/screenshot.gif"/>

## Installing

Drag **ACSideslipTransition** src folder into your project. 

```objective-c
#import "UIViewController+ACSideslip.h"
```
    
## Usage

- Sideslip from some viewController to a new viewController

```objc
[self ac_sideslip:newVC completion:^{
    NSLog(@"sideslip complete");
}];
```


- Dismiss Delegate

```Objective-C
#import "ACSideslipSwipeInteractiveTransitionFinishedDelegate.h"

@interface YourViewController () <ACSideslipSwipeInteractiveTransitionFinishedDelegate>

...

```

```Objective-C
#pragma mark - ACSideslipSwipeInteractiveTransitionFinishedDelegate

- (void)swipeInteractiveTransitionDidFinished
{
    NSLog(@"dismissed by gesture");
}
```


## Requirements

* ARC
* iOS 7 +


## ToDo

- [ ] option for swipe from left edge or full viewController.view


## License
[**WTFPL**](https://en.wikipedia.org/wiki/WTFPL)


