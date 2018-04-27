//
//  UIPageControl+Radius.m
//  NoMoneyMe
//
//  Created by Bing Ma on 5/24/17.
//  Copyright © 2017 CQ (Hannb). All rights reserved.
//

#import "UIPageControl+Radius.h"
#import <objc/runtime.h>

static inline void cu_swizzleSelector(Class theClass, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(theClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(theClass, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@implementation UIPageControl (Radius)
@dynamic cu_pageIndicatorRadius;

- (void)cu_setPageIndicatorRadius:(CGFloat)cu_pageIndicatorRadius
{
    objc_setAssociatedObject(self, @selector(cu_pageIndicatorRadius), @(cu_pageIndicatorRadius), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)cu_pageIndicatorRadius
{
    return [objc_getAssociatedObject(self, @selector(cu_pageIndicatorRadius)) floatValue];
}

+ (void)load
{
    cu_swizzleSelector([UIPageControl class], @selector(setCurrentPage:), @selector(cu_setCurrentPage:));
}

- (void)cu_setCurrentPage:(NSInteger)page
{
    [self cu_setCurrentPage:page];
    
    CGFloat pageIndicatorRadius = self.cu_pageIndicatorRadius;
    // if <= 0, do nothing.
    if (pageIndicatorRadius < 0.000001)
    {
        return;
    }
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++)
    {
        UIImageView *subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.width = pageIndicatorRadius*2;
        size.height = size.width;
        
        subview.layer.cornerRadius = pageIndicatorRadius;
        CGPoint center = subview.center;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y, size.width, size.height)];
        subview.center = center;
    }
}
@end
