//
//  PaintingView.h
//  画图
//
//  Created by asl on 2016/11/21.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface PaintingView : UIView

@property (nonatomic, strong) NSMutableArray *lines; // 所有的笔画
@property (nonatomic, strong) NSMutableArray *deleteLines; // 删掉的笔画
@property (nonatomic) BOOL deleteType;
@property (nonatomic, strong) Line           *l; // 画笔
@property (nonatomic, strong) UIColor        *color; // 画笔颜色
@property (nonatomic)         float          width; // 画笔大小

-(void)clear; // 清除所有的画

-(void)back;  // 回退上一步
- (void)resume;
@end
