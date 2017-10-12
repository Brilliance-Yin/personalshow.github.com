//
//  CornerRadiusView.m
//  SqliteDemo
//
//  Created by Watson on 2017/10/12.
//  Copyright © 2017年 github. All rights reserved.
//

#import "CornerRadiusView.h"

@implementation CornerRadiusView

+ (instancetype)initWithRect:(CGRect)rect imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius {

    CornerRadiusView *headView = [[CornerRadiusView alloc] initWithFrame:rect];
    UIImage *image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(headView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:headView.bounds cornerRadius:cornerRadius] addClip];
    [image drawInRect:headView.bounds];
    headView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return headView;
}

@end
