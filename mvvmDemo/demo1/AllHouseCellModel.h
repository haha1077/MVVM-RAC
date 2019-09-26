//
//  SingleCellViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "BasecellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllHouseCellModel : BasecellViewModel

@property (nonatomic) RACSignal *headImgSignal;//img
@property (nonatomic) RACSignal *titleSignal;//NSString
@property (nonatomic) RACSignal *priceSignal;//NSAttributeText
@property (nonatomic) RACSignal *infoSignal;//NSString
@property (nonatomic) RACSignal *tagSignal;//tag
@property (nonatomic) RACSignal *addressSignal;//NSString

@end

NS_ASSUME_NONNULL_END
