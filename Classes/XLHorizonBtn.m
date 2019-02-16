//
//  XLHorizonBtn.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "XLHorizonBtn.h"

@implementation XLHorizonBtn

- (void)setTextLeadingSpace:(NSInteger)textToLeftedgeSpace {
    _textLeadingSpace = textToLeftedgeSpace;
    
    [self titleRectForContentRect:self.bounds];
}

- (void)setImageLeadingSpace:(NSInteger)imageToLeftedgeSpace {
    _imageLeadingSpace = imageToLeftedgeSpace;
    
    [self imageRectForContentRect:self.bounds];
}

//- (void)setImageLeadingToTitleLabel:(NSInteger)imageLeadingToTitleLabel {
//    _imageLeadingToTitleLabel = imageLeadingToTitleLabel;
//
//    [self titleRectForContentRect:self.bounds];
//    [self imageRectForContentRect:self.bounds];
//}

- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
    
    [self titleRectForContentRect:self.bounds];
    [self imageRectForContentRect:self.bounds];
}

- (void)setTitleSize:(CGSize)titleSize {
    _titleSize = titleSize;
    
    [self titleRectForContentRect:self.bounds];
    [self imageRectForContentRect:self.bounds];
}

#pragma mark - 调整内部ImageView的frame --
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    UIImage *image = self.currentImage;
    CGSize size = CGSizeMake(ceilf(image.size.width), ceilf(image.size.height));
    CGRect frame = CGRectMake(_imageLeadingSpace, CGRectGetHeight(self.bounds)/2-size.height/2, size.width, size.height);
    
    return frame;
}
#pragma mark - 调整内部UIlable的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    NSString *textString = self.currentTitle;
    CGRect stringRect;
    if([textString respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        stringRect = [textString boundingRectWithSize:CGSizeMake(self.bounds.size.width, 80)
                                              options:(NSStringDrawingOptions)(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                                           attributes:@{NSFontAttributeName: self.font}
                                              context:NULL];
    }
    CGSize size = CGSizeMake(ceilf(stringRect.size.width), ceilf(stringRect.size.height));
    CGRect frame = CGRectMake(self.textLeadingSpace, CGRectGetHeight(self.bounds)/2 -size.height/2, size.width, size.height);
   
    return frame;
}
@end
