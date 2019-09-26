//
//  FactoryViewModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "FactoryViewModel.h"
#import "Demo3Model.h"

@interface FactoryViewModel()

@property (nonatomic,strong)Demo3Model *city;

@end

@implementation FactoryViewModel

- (instancetype)initWithCity:(Demo3Model *)city {
    if (self = [super init]) {
        self.city = city;
        _cityName = [NSString stringWithFormat:@"%@ %@",city.area_1,city.area_2];
        _weaid = city.weaid;
    }
    return self;
}


@end
