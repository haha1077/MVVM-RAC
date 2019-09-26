//
//  SingleBindCellModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "SingleBindCellModel.h"
#import "SingleBindModel.h"

@interface SingleBindCellModel ()

@property (nonatomic,strong) SingleBindModel *singleBindModel;

@end

@implementation SingleBindCellModel


-(instancetype)initWithSingleBindModel:(SingleBindModel *)singleBindModel{
    if (self = [super init]) {
        _singleBindModel = singleBindModel;
        [self bindSignals];
    }
    return self;
}
//
-(void)bindSignals{

    RACSignal *singleBindModelSignal = [RACSignal return:self.singleBindModel];

    self.titleSignal = [singleBindModelSignal map:^id(SingleBindModel *model) {
        return model.title;
    }];

    self.headImgSignal = [singleBindModelSignal map:^id(SingleBindModel *model) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.headImgUrl]];
        return [UIImage imageWithData:data];
    }];

    self.priceSignal = [singleBindModelSignal map:^id(SingleBindModel *model) {
        NSString *priceString = [NSString stringWithFormat:@"￥%@/月", model.price];
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:priceString
                                                                                            attributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
        [attributeString setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],
                                         NSForegroundColorAttributeName : [UIColor blueColor]}
                                 range:NSMakeRange([priceString length] - 1, 1)];
        return [attributeString copy];
    }];

    self.infoSignal = [singleBindModelSignal map:^id(SingleBindModel *model) {
        return model.info;
    }];

    self.tagSignal = [singleBindModelSignal map:^id(SingleBindModel *model) {
        return  model.tag;
    }];

    self.addressSignal = [singleBindModelSignal map:^id(SingleBindModel *model) {
        return model.address;
    }];
}

@end
