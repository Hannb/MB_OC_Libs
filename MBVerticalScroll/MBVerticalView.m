//
//  MBVerticalView.m
//  NoMoneyMe
//
//  Created by Bing Ma on 5/24/17.
//  Copyright © 2017 CQ (Hannb). All rights reserved.
//

#import "MBVerticalView.h"
#import "UIImageView+WebCache.h"

@interface MBVerticalView()

@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *countLabel;
@property (strong, nonatomic) UILabel *descLabel;

@end

@implementation MBVerticalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}

- (void)p_setupViews {
    
    self.headImageView = [[UIImageView alloc] init];
//    self.headImageView.backgroundColor = [UIColor redColor];
    self.headImageView.image = [UIImage imageNamed:@"ad_notic_icon"];
//    self.headImageView.layer.cornerRadius = 20;
//    self.headImageView.clipsToBounds = YES;
    [self addSubview:self.headImageView];
    
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.font = [UIFont systemFontOfSize:12];
    self.descLabel.textColor = [UIColor lightGrayColor];
//    self.descLabel.adjustsFontSizeToFitWidth = YES;
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[@"长沙的上班族 <font color='#ff0000'>黄先生</font> 今日借款 <font color='#ff0000'>3000元</font> " dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.descLabel.attributedText = attrStr;
    [self addSubview:self.descLabel];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(8);
        make.top.equalTo(self).offset(8);
        make.width.height.mas_equalTo(15);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self).offset(10);//(self.mas_centerY);
        
    }];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        
    }];
    
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self.headImageView.mas_right).offset(8);
        make.right.equalTo(self.mas_right).offset(8);
//        make.right.equalTo(lbl.mas_left).offset(-8);
        
    }];

}

- (void)setDataWithModel:(PLHomeAdsModel *)model {
//    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"me_default_pl"]];
//    self.titleLabel.text = model.title;
//    self.countLabel.text = [NSString stringWithFormat:@"今日已有%d人申请", model.apply_loans];
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[model.success_case dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.descLabel.attributedText = attrStr;
}


@end
