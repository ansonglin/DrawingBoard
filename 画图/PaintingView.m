//
//  PaintingView.m
//  画图
//
//  Created by asl on 2016/11/21.
//  Copyright © 2016年 Invisionhealth Digital Inc. All rights reserved.
//

#import "PaintingView.h"

@implementation PaintingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.lines = [NSMutableArray array];
        self.deleteLines = [NSMutableArray array];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();
    for (Line *l in self.lines) {
        CGContextSetStrokeColorWithColor(c, l.color.CGColor);
        CGContextSetLineWidth(c, l.width);
        for (int i = 0; i < l.points.count; i++) {
            CGPoint p = [l.points[i] CGPointValue];
            if (i == 0) {
                CGContextMoveToPoint(c, p.x, p.y);
            } else {
                CGContextAddLineToPoint(c, p.x, p.y);
            }
        }
        CGContextDrawPath(c, kCGPathStroke);
    }
}

//
-(void)back{
    if (self.lines.count == 0) return;
    Line *line = [self.lines lastObject];
    [self.deleteLines insertObject:line atIndex:0];
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}

-(void)clear{
    [self.lines removeAllObjects];
    [self.deleteLines removeAllObjects];
    [self setNeedsDisplay];
}

- (void)resume
{
    if (self.deleteLines.count == 0) return;
    Line *line = [self.deleteLines firstObject];
    [self.lines addObject:line];
    [self.deleteLines removeObjectAtIndex:0];
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    self.l = [[Line alloc]init];
    self.l.color = _color;
    self.l.width = _width;
    [self.l.points addObject:[NSValue valueWithCGPoint:p]];
    [self.lines addObject:self.l];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    [self.l.points addObject:[NSValue valueWithCGPoint:p]];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    [self.l.points addObject:[NSValue valueWithCGPoint:p]];
    [self setNeedsDisplay];
}

@end
