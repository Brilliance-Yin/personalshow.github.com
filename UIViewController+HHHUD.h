//
//  UIViewController+HHHUD.h
//  LIVE直播
//
//  Created by Watson on 2017/10/19.
//  Copyright © 2017年 github. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIViewController (HHHUD)

/** HUD */
@property (nonatomic, weak, readonly) MBProgressHUD * HUD;

/**
 *  @param view 显示在哪个view 有加载效果
 *  @param hint 提示文字
 */
- (void)showHUDInView:(UIView *)view hint:(NSString *)hint;
- (void)showHUDInView:(UIView *)view hint:(NSString *)hint yOffset:(CGFloat)yOffset;
/**
 *  隐藏
 */
- (void)hideHUD;

/**
 *  普通弹出提示文字
 */
- (void)showHint:(NSString *)hint;
- (void)showHint:(NSString *)hint inView:(UIView *)view;
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;


@end
