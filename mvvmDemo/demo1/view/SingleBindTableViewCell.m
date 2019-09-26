//
//  SingleBindTableViewCell.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "SingleBindTableViewCell.h"
#import "SingleBindCellModel.h"
#import <Masonry.h>


#define KColorFromRGB(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SingleBindTableViewCell ()

@property(nonatomic) SingleBindCellModel *viewmodel;

@end


@implementation SingleBindTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    
    return self;
}


- (void)setup
{
    self.headImg = [[UIImageView alloc] init];
    [self.contentView addSubview:self.headImg];
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@120);
        make.height.equalTo(@80);
    }];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = KColorFromRGB(0x444444);
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImg.mas_right).offset(10);
        make.top.equalTo(self.headImg.mas_top);
        make.height.equalTo(@16);
    }];
    
    self.infoLabel = [[UILabel alloc] init];
    self.infoLabel.textAlignment = NSTextAlignmentLeft;
    self.infoLabel.font = [UIFont systemFontOfSize:12];
    self.infoLabel.textColor = KColorFromRGB(0x999999);
    [self.contentView addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImg.mas_right).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.height.equalTo(@12);
    }];
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.font = [UIFont systemFontOfSize:16];
    self.priceLabel.textColor = KColorFromRGB(0xff961e);
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.height.equalTo(@16);
    }];
    
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    self.addressLabel.font = [UIFont systemFontOfSize:12];
    self.addressLabel.textColor = KColorFromRGB(0x999999);
    [self.contentView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImg.mas_right).offset(10);
        make.height.equalTo(@12);
        make.top.equalTo(self.infoLabel.mas_bottom).offset(8);
    }];
    
    self.tagLabel = [[UILabel alloc] init];
    self.tagLabel.textAlignment = NSTextAlignmentLeft;
    self.tagLabel.backgroundColor = KColorFromRGB(0xff961e);
    self.tagLabel.layer.masksToBounds = YES;
    self.tagLabel.layer.cornerRadius = 2.f;
    self.tagLabel.font = [UIFont systemFontOfSize:12];
    self.tagLabel.textColor = KColorFromRGB(0xffffff);
    [self.contentView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImg.mas_right).offset(10);
        make.top.equalTo(self.addressLabel.mas_bottom).offset(8);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
}


-(void)bindWithViewModel:(SingleBindCellModel *)viewModel{

    RAC(_titleLabel, text) = [viewModel.titleSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_priceLabel, attributedText) = [viewModel.priceSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_headImg, image) = [viewModel.headImgSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_infoLabel, text) = [viewModel.infoSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_addressLabel, text) = [viewModel.addressSignal takeUntil:self.rac_prepareForReuseSignal];
    RAC(_tagLabel, text) = [viewModel.tagSignal takeUntil:self.rac_prepareForReuseSignal];
    
    _viewmodel = viewModel;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
