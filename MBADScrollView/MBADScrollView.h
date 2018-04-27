//
//  MBADScrollView.h
//
//  Created by Bing Ma on 1/22/16.
//  Copyright © 2016 mabing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PageControlStyle) {
    PageControlAtCenter,
    PageControlAtRight,
};

@interface MBADScrollView : UIView

/**
 *  place holder image.
 */
@property (nonatomic,strong) UIImage *placeImage;
/**a
 *  default -> 2.0f, < 0.5 don't auto play.
 */
@property (nonatomic,assign) NSTimeInterval AutoScrollDelay;
/**
 *  page control's style
 */
@property (nonatomic,assign) PageControlStyle style; //default is PageControlAtCenter

@property (nonatomic,strong) UIColor *pageIndicatorTintColor;
@property (nonatomic,strong) UIColor *currentPageIndicatorTintColor;
@property (nonatomic,strong) UIColor *textColor;//default is [[UIColor alloc] initWithWhite:0.5 alpha:1]
@property (nonatomic,strong) UIFont *font;

/**
 *  image's title
 */
@property (nonatomic,copy) NSArray<NSString *> *titleData;
/**
 *  block click review.
 */
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(NSInteger index);


/**
 *  init frame with image's strings or image's url string
 *
 *  @param frame    -> Frame
 *  @param imageUrl -> Image Url
 *
 *  @return         -> instancetype
 */
+ (instancetype)picScrollViewWithFrame:(CGRect)frame WithImageUrls:(NSArray<NSString *> *)imageUrl;

- (void)setStyle:(PageControlStyle)style;

@end
