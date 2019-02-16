//
//  XLButton.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "XLVerticalBtn.h"

@implementation XLVerticalBtn

- (void)setTextToBotomSpace:(NSInteger)textToBotomSpace {
    _textToBotomSpace = textToBotomSpace;
    
    self.titleLabel.frame = [self titleRectForContentRect:self.bounds];
}

- (void)setImageToBottomSpace:(NSInteger)imageToBottomSpace {
    _imageToBottomSpace = imageToBottomSpace;
    
    self.imageView.frame = [self imageRectForContentRect:self.bounds];
}

- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
    
    [self imageRectForContentRect:self.bounds];
}

- (void)setTitleSize:(CGSize)titleSize {
    _titleSize = titleSize;
    
    [self titleRectForContentRect:self.bounds];
}

#pragma mark - 调整内部ImageView的frame --
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    UIImage *image = self.currentImage;
    CGSize size;
    if (_imageSize.width == 0 && _imageSize.height == 0) {
        size = CGSizeMake(ceilf(image.size.width), ceilf(image.size.height));
    } else {
        size = _imageSize;
    }
    CGRect frame = CGRectMake(CGRectGetWidth(self.bounds)/2- size.width/2, CGRectGetHeight(self.bounds)- size.height- self.imageToBottomSpace, size.width, size.height);
//    NSLog(@"image frame=%@",NSStringFromCGRect(frame));
    return frame;
}

#pragma mark - 调整内部UIlable的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    NSString *textString = self.currentTitle;
    CGRect stringRect;
    if([textString respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        if (_titleSize.width == 0 && _titleSize.height == 0) {
            stringRect = [textString boundingRectWithSize:CGSizeMake(self.bounds.size.width, 80)
                                                  options:(NSStringDrawingOptions)(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                                               attributes:@{NSFontAttributeName: self.font}
                                                  context:NULL];
        } else {
            stringRect = [textString boundingRectWithSize:CGSizeMake(_titleSize.width, _titleSize.height)
                                                  options:(NSStringDrawingOptions)(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                                               attributes:@{NSFontAttributeName: self.font}
                                                  context:NULL];
        }
    }
    CGSize size = CGSizeMake(ceilf(stringRect.size.width), ceilf(stringRect.size.height));
    CGRect frame = CGRectMake(CGRectGetWidth(self.bounds)/2- size.width/2, CGRectGetHeight(self.bounds) -size.height- self.textToBotomSpace, size.width, size.height);

    return frame;
}
@end
