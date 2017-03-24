//
//  Line.h
//  画图
//
//  Created by asl on 2016/11/21.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic) float width;
@property (nonatomic, strong) NSMutableArray *points;

@end
