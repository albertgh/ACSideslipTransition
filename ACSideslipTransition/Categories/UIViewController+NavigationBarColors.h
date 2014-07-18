//
//  Created by Albert Chu on 14/7/10.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBarColors)

/**
 *  设置导航栏三颜色
 *
 *  @param titleColor   标题文字颜色
 *  @param barColor     导航栏颜色
 *  @param actionColor  导航栏按钮颜色
 */
- (void)ac_setNavigationBarColorsWithTitleColor:(UIColor *)titleColor
                                       barColor:(UIColor *)barColor
                                    actionColor:(UIColor *)actionColor;

@end
