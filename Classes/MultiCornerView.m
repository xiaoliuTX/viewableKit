//
//  MultiCornerView.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/7.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "MultiCornerView.h"
@interface MultiCornerView()
@property (nonatomic, assign) UIRectCorner rectCorner;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation MultiCornerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.shapeLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:self.shapeLayer];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.shapeLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:self.shapeLayer];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self drawCorners];
}

- (void)setCornerRadius:(NSInteger)cornerRadius {
    _cornerRadius = cornerRadius;
    
    [self drawCorners];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    [self drawCorners];
}

- (void)setBordertWidth:(NSInteger)bordertWidth {
    _bordertWidth = bordertWidth;
    
    [self drawCorners];
}

- (void)setCornerWeight:(NSInteger)cornerWeight {
    _cornerWeight = cornerWeight;
    UIRectCorner cornerRect;
    switch (_cornerWeight) {
        case 1:
            cornerRect = UIRectCornerTopLeft;
            break;
        case 2:
            cornerRect = UIRectCornerTopRight;
            break;
        case 4:
            cornerRect = UIRectCornerBottomLeft;
            break;
        case 8:
            cornerRect = UIRectCornerBottomRight;
            break;
        case 3:
            cornerRect = UIRectCornerTopRight | UIRectCornerTopLeft;
            break;
        case 5:
            cornerRect = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
        case 9:
            cornerRect = UIRectCornerTopLeft | UIRectCornerBottomRight;
            break;
        case 6:
            cornerRect = UIRectCornerTopRight | UIRectCornerBottomLeft;
            break;
        case 12:
            cornerRect = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 7:
            cornerRect = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft;
            break;
        case 11:
            cornerRect = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
        case 13:
            cornerRect = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 14:
            cornerRect = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 15:
            cornerRect = 0;
            break;
        default:
            cornerRect = UIRectCornerAllCorners;
            break;
    }
    self.rectCorner = cornerRect;
    
    
    [self drawCorners]; 
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    self.backgroundColor = [UIColor clearColor];
    [self drawCorners];
}

- (void)drawCorners {
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCorner cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
    self.shapeLayer.path = roundPath.CGPath;
    self.shapeLayer.fillColor = self.fillColor.CGColor;
    self.shapeLayer.strokeColor = self.borderColor.CGColor;
    self.shapeLayer.lineWidth = self.bordertWidth;
    self.shapeLayer.lineCap = @"round";
    self.shapeLayer.lineJoin = @"round";
    
    [self.layer insertSublayer:self.shapeLayer atIndex:0];
    
//    self.layer.masksToBounds = YES;
}

@end
