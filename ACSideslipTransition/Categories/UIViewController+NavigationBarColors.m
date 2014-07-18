//
//  Created by Albert Chu on 14/7/10.
//

#import "UIViewController+NavigationBarColors.h"

@implementation UIViewController (NavigationBarColors)

- (void)ac_setNavigationBarColorsWithTitleColor:(UIColor *)titleColor
                                       barColor:(UIColor *)barColor
                                    actionColor:(UIColor *)actionColor
{
    NSDictionary *navBarTitleTextAttributes =
    [NSDictionary dictionaryWithObjectsAndKeys: titleColor, NSForegroundColorAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = navBarTitleTextAttributes;
    
    self.navigationController.navigationBar.barTintColor = barColor;
    self.navigationController.navigationBar.tintColor = actionColor;
}

@end
