//
//  Demo3Model.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "Demo3Model.h"

@implementation Demo3Model

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    Demo3Model *city = [[Demo3Model alloc] init];
    city.weaid = [dict valueForKey:@"weaid"];
    city.citynm = [dict valueForKey:@"citynm"];
    city.cityid = [dict valueForKey:@"cityid"];
    city.area_1 = [dict valueForKey:@"area_1"];
    city.area_2 = [dict valueForKey:@"area_2"];
    city.area_3 = [dict valueForKey:@"area_3"];
    return city;
}

@end
