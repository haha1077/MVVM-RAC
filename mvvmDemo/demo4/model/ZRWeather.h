//
// Created by 马凯文 on 2019-04-29.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZRWeather : NSObject

+ (instancetype)weatherWithDict:(NSDictionary *)dict;

@property (nonatomic, copy) NSString *weaid;
@property (nonatomic, copy) NSString *days;
@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy) NSString *cityno;
@property (nonatomic, copy) NSString *citynm;
@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *temperature_curr;
@property (nonatomic, copy) NSString *humidity;
@property (nonatomic, copy) NSString *aqi;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *weather_icon;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *winp;

@end