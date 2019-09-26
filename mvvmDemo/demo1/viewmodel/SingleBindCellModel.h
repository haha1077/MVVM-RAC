//
//  SingleBindCellModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@class SingleBindModel;

NS_ASSUME_NONNULL_BEGIN

@interface SingleBindCellModel : NSObject

@property (nonatomic) RACSignal *headImgSignal;//img
@property (nonatomic) RACSignal *titleSignal;//NSString
@property (nonatomic) RACSignal *priceSignal;//NSAttributeText
@property (nonatomic) RACSignal *infoSignal;//NSString
@property (nonatomic) RACSignal *tagSignal;//tag
@property (nonatomic) RACSignal *addressSignal;//NSString

- (instancetype)initWithSingleBindModel:(SingleBindModel *)singleBindModel;

@end

NS_ASSUME_NONNULL_END
