//
//  MBWebImageManager.h
//
//  Created by Bing Ma on 1/22/16.
//  Copyright © 2016 mabing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MBWebImageManager : NSObject

/**
 *  when down error, will repeat to down. default is no repeat.
 */
@property (nonatomic,assign) NSUInteger DownloadImageRepeatCount;


/**
 *  download image, error will invoke this method.
 */
@property (nonatomic,copy) void(^downLoadImageError)(NSError *error,NSString *imageUrl);

/**
 *  cache.
 */
@property (nonatomic,strong) NSMutableDictionary *webImageCache;

+ (instancetype)shareManager;

/**
 *  down image will save to webImageCache & sandbox, key is url string.
 *
 *  @param urlSting -> void
 */
- (void)downloadImageWithUrlString:(NSString *)urlSting;

@end
