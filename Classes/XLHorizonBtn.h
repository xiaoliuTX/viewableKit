//
//  XLHorizonBtn.h
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface XLHorizonBtn : UIButton
@property (nonatomic) IBInspectable NSInteger textLeadingSpace;
@property (nonatomic) IBInspectable NSInteger imageLeadingSpace;
@property (nonatomic) IBInspectable CGSize    imageSize;
@property (nonatomic) IBInspectable CGSize    titleSize;
@end
