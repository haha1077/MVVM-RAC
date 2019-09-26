//
// Created by 马凯文 on 2019-04-30.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ZRWeatherViewModel;


@interface ZRWeatherView : UIView
- (void)bindViewModel:(ZRWeatherViewModel *)model;
@end