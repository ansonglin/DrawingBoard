//
//  Line.m
//  画图
//
//  Created by asl on 2016/11/21.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.points = [NSMutableArray array];
    }
    return self;
}

@end
