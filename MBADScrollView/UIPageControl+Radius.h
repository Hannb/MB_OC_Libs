//
//  UIPageControl+Radius.h
//  NoMoneyMe
//
//  Created by Bing Ma on 5/24/17.
//  Copyright © 2017 CQ (Hannb). All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIPageControl (Radius)

@property (nonatomic, setter=cu_setPageIndicatorRadius:) CGFloat cu_pageIndicatorRadius;//dot radius， default is 0, if <=0 do nothing.

@end

NS_ASSUME_NONNULL_END
