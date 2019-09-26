//
//  SingleBindTableViewCell.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleBindTableViewCell : BaseTableViewCell

@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *infoLabel;
@property (nonatomic,strong) UILabel *tagLabel;
@property (nonatomic,strong) UILabel *addressLabel;

@end

NS_ASSUME_NONNULL_END
