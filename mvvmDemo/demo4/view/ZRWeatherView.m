//
// Created by 马凯文 on 2019-04-30.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import "ZRWeatherView.h"
#import "ZRWeatherViewModel.h"
#import "ZRWeather.h"

@interface ZRWeatherView ()
@property(nonatomic, strong) UILabel *cityLabel;
@property(nonatomic, strong) UIImageView *tempImageView;
@property(nonatomic, strong) UILabel *windLabel;
@property(nonatomic, strong) UILabel *tempLabel;
@end

@implementation ZRWeatherView
- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self initView];
}

- (void)initView {
    
    UILabel *cityLabel = [[UILabel alloc] init];
    [self addSubview:cityLabel];
    self.cityLabel = cityLabel;

    UILabel *windLabel = [[UILabel alloc] init];
    [self addSubview:windLabel];
    self.windLabel = windLabel;

    UILabel *tempLabel = [[UILabel alloc] init];
    [self addSubview:tempLabel];
    self.tempLabel = tempLabel;

    UIImageView *tempImageView = [[UIImageView alloc] init];
    [self addSubview:tempImageView];
    self.tempImageView = tempImageView;
}

- (void)bindViewModel:(ZRWeatherViewModel *)viewModel {
    self.cityLabel.text = viewModel.weather.citynm;
    self.windLabel.text = viewModel.weather.wind;
    self.tempLabel.text = viewModel.weather.temperature;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:viewModel.weather.weather_icon]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tempImageView.image = [UIImage imageWithData:data];
            [self.tempImageView sizeToFit];
        });
    });
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.cityLabel sizeToFit];
    [self.windLabel sizeToFit];
    [self.tempLabel sizeToFit];
    [self.tempImageView sizeToFit];
    {
        CGRect temp = self.cityLabel.frame;
        temp.origin.y = 100;
        self.cityLabel.frame = temp;
    }
    {
        CGRect temp = self.windLabel.frame;
        temp.origin.y = self.cityLabel.frame.origin.y + self.cityLabel.frame.size.height;
        self.windLabel.frame = temp;
    }
    {
        CGRect temp = self.tempLabel.frame;
        temp.origin.y = self.windLabel.frame.origin.y + self.windLabel.frame.size.height;
        self.tempLabel.frame = temp;
    }
    {
        CGRect temp = self.tempImageView.frame;
        temp.origin.y = self.tempLabel.frame.origin.y + self.tempLabel.frame.size.height;
        self.tempImageView.frame = temp;
    }
}


@end