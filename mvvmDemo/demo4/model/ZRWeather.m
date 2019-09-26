//
// Created by 马凯文 on 2019-04-29.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import "ZRWeather.h"


@implementation ZRWeather

+ (instancetype)weatherWithDict:(NSDictionary *)dict {
    ZRWeather *w = [[ZRWeather alloc] init];
    w.weaid = [dict valueForKey:@"weaid"];
    w.days = [dict valueForKey:@"days"];
    w.week = [dict valueForKey:@"week"];
    w.cityno = [dict valueForKey:@"cityno"];
    w.citynm = [dict valueForKey:@"citynm"];
    w.temperature = [dict valueForKey:@"temperature"];
    w.temperature_curr = [dict valueForKey:@"temperature_curr"];
    w.humidity = [dict valueForKey:@"humidity"];
    w.weather = [dict valueForKey:@"weather"];
    w.weather_icon = [dict valueForKey:@"weather_icon"];
    w.wind = [dict valueForKey:@"wind"];
    w.winp = [dict valueForKey:@"winp"];
    return w;
}

@end