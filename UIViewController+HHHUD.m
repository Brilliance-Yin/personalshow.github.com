//
//  UIViewController+HHHUD.m
//  LIVE直播
//
//  Created by Watson on 2017/10/19.
//  Copyright © 2017年 github. All rights reserved.
//

#import "UIViewController+HHHUD.h"
#import <objc/runtime.h>

static const void *HUDKey = &HUDKey;

@implementation UIViewController (HHHUD)

#pragma mark 动态绑定HUD属性
- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, HUDKey);
}

/**
 *  objc_setAssociatedObject 将一个对象与另一个对象关联
 */
- (void)setHUD:(MBProgressHUD * _Nullable)HUD {
    return objc_setAssociatedObject(self, HUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark 方法实现
- (void)showHUDInView:(UIView *)view hint:(NSString *)hint {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = hint;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

- (void)showHUDInView:(UIView *)view hint:(NSString *)hint yOffset:(CGFloat)yOffset {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = hint;
    HUD.margin = 10.f;
    NSLog(@"%f",HUD.offset.x);
    HUD.offset = CGPointMake(HUD.offset.x, HUD.offset.y + yOffset) ;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

#pragma mark 显示提示信息
- (void)showHint:(NSString *)hint {
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.userInteractionEnabled = YES;
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = hint;
    HUD.margin = 10.f;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint inView:(UIView *)view {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [view addSubview:HUD];
    HUD.userInteractionEnabled = YES;
    HUD.mode= MBProgressHUDModeText;
    HUD.label.text = hint;
    HUD.margin = 10.f;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.userInteractionEnabled = YES;
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = hint;
    HUD.offset = CGPointMake(HUD.offset.x, HUD.offset.y + yOffset) ;
    HUD.margin = 10.f;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:2];
}

/**
 *  隐藏
 */
- (void)hideHUD {
    [[self HUD] hideAnimated:YES];
}

@end
