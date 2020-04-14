//
//  TestView.m
//  TestApp
//
//  Created by tongyuan on 2019/12/10.
//  Copyright © 2019 tongyuan. All rights reserved.
//

#import "TestView.h"

@interface TestView ()
@property (nonatomic, assign) CGPoint startPoint;
@end

@implementation TestView

- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
//    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 400)];
//    [path addCurveToPoint:CGPointMake(400, 0) controlPoint1:CGPointMake(400, 300) controlPoint2:CGPointMake(0, 0)];
    [path addQuadCurveToPoint:CGPointMake(100, 350) controlPoint:CGPointMake(70, 400)];
    [path addLineToPoint:CGPointMake(300, 100)];
    [path stroke];
}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (CGPointEqualToPoint(self.startPoint, CGPointZero) && !CGPointEqualToPoint(self.startPoint, point)) {
//        self.startPoint = point;
//    }
//    else {
//
//    }
//
//    return nil;
//}

-  (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    //当前触摸点
    self.startPoint = [touch locationInView:self];
    
    if (self.superview) {
        [self.superview touchesBegan:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    self.userInteractionEnabled = NO;
    [self endEditing:YES];

//    if ([self.delegate respondsToSelector:@selector(swipeVertical:)]) {
        CGFloat offsetY = (endPoint.y - self.startPoint.y);
        if (offsetY != 0) {
//            [self.delegate swipeVertical:offsetY];
            CGRect frame = self.frame;
            frame.origin.y += offsetY;
            self.frame = frame;
        }
//    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    self.userInteractionEnabled = YES;
    if (CGPointEqualToPoint(self.startPoint, endPoint)) {
//        [self didTapCell];
    }
    else {
//        CGFloat offsetY = endPoint.y - self.realStartPoint.y;
//        if ([self.delegate respondsToSelector:@selector(swipeVerticalDidEnd:)]) {
//            [self.delegate swipeVerticalDidEnd:offsetY];
//        }
    }
    if (self.superview ) {
        [self.superview touchesEnded:touches withEvent:event];
    }
    self.startPoint = CGPointZero;
}

@end
