//
// Created by 马凯文 on 2019-04-29.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RACCommand;
@class ZRWeather;


@interface ZRWeatherViewModel : NSObject

- (instancetype)initWithId:(NSString *)weaid;

@property (nonatomic, strong) RACCommand *fetchDataCommand;

@property (nonatomic, strong, readonly) ZRWeather *weather;

@end
