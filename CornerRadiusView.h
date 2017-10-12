//
//  CornerRadiusView.h
//  SqliteDemo
//
//  Created by Watson on 2017/10/12.
//  Copyright © 2017年 github. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CornerRadiusView : UIImageView

+ (instancetype)initWithRect:(CGRect)rect imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius;

@end
