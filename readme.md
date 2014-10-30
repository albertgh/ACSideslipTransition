# ACSideslipTransition

Make presentViewController's Animation more like pushViewController's。 
<img src="https://github.com/albertgh/ACSideslipTransition/raw/master/screenshot.gif"/>

## Installing

Drag **ACSideslipTransition** src folder into your project. 

```objective-c
#import "ACSideslipTransition.h"
```
    
## Usage

- Sideslip to a new viewController

```objc
SecondViewController *sVC =  [[SecondViewController alloc] init];
        
ACSideslipTransition *transition = [[ACSideslipTransition alloc] init];
[transition sideslip:sVC from:self];
```

- Or a UINavigationController

```objc
SecondViewController *sVC =  [[SecondViewController alloc] init];
    
UINavigationController *nC = [[UINavigationController alloc] initWithRootViewController:sVC];
    
self.sideslipTransition = [[ACSideslipTransition alloc] init];
[self.sideslipTransition sideslip:nC from:self];
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
    // some thing you want to do when dismiss finished
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
```


### Requirements

* ARC
* iOS 7 +



#### License

######WTFPL 

