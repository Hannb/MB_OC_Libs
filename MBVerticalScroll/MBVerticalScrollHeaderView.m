//
//  MBVerticalScrollHeaderView.m
//  NoMoneyMe
//
//  Created by Bing Ma on 5/24/17.
//  Copyright © 2017 CQ (Hannb). All rights reserved.
//

#import "MBVerticalScrollHeaderView.h"
#import "MBVerticalView.h"

@interface MBVerticalScrollHeaderView()<CAAnimationDelegate>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) MBVerticalView *verticalView;

@end

@implementation MBVerticalScrollHeaderView

static int countInt = 0;
static NSString *notice_index;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}

- (void)p_setupViews {
    self.backgroundColor = [UIColor whiteColor];
    self.verticalView = [[MBVerticalView alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topNewsInfoClicked:)];
    self.verticalView.userInteractionEnabled = YES;
    [self.verticalView addGestureRecognizer:tap];
    [self addSubview:self.verticalView];
    
    [self.verticalView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(@30);
    }];
}

- (void)setViewWithArray:(NSArray *)array {
    self.array = array;
    [self setUpdownViewData];

}

- (void)setUpdownViewData {
    notice_index=[self.array objectAtIndex:0];

    int idx = rand() % (_array.count);
    [self.verticalView setDataWithModel:_array[idx]];
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
        self.verticalView.alpha = 0.2;
        [self.verticalView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        self.verticalView.alpha = 1;
    } completion:^(BOOL finished){
        [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
    }];
}

- (void)displayNews{
    countInt++;
    //    long num = [rssArray count] >= 3 ? 3:[rssArray count];
    if (countInt >= [self.array count])
        countInt=0;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    
    notice_index=[self.array objectAtIndex:countInt];
    
    [self.verticalView.layer addAnimation:animation forKey:@"animationID"];

    
    int idx = rand() % (_array.count);
    [self.verticalView setDataWithModel:_array[idx]];
}

- (void)topNewsInfoClicked:(id)sender{
    
    NSLog(@"点击上下滚动视图%d", countInt);
}

@end
