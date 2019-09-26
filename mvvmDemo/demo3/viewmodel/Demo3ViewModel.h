//
//  Demo3ViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Demo3Model.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@class FactoryViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface Demo3ViewModel : NSObject

@property (nonatomic, strong , readonly) NSArray<FactoryViewModel *> *cityListViewModels;

@property (nonatomic, strong, readonly) NSError *cityListError;

@property (nonatomic, strong) RACCommand *fetchCityListCommand;

@property (nonatomic, strong) RACCommand *clickCityCommand;

@end

NS_ASSUME_NONNULL_END
