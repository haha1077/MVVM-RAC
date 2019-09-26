//
//  ZRWeatherViewController.m
//  ZRMode4iOS
//
//  Created by 马凯文 on 2019/4/29.
//  Copyright © 2019 马凯文. All rights reserved.
//

#import "ZRWeatherViewController.h"
#import "ZRWeatherView.h"
#import "ZRWeatherViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ZRWeatherViewController ()
@property(nonatomic, strong) UILabel *loadingView;
@property(nonatomic, strong) ZRWeatherView *weatherView;
@property(nonatomic, strong) ZRWeatherViewModel *viewModel;
@end

@implementation ZRWeatherViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviews];
    
}

-(void)setWeaid:(NSString *)weaid{
    _weaid = weaid;
    
    [self bindViewModel];
}


- (void)addSubviews {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"加载中";
    label.frame = self.view.bounds;
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    self.loadingView = label;
}

- (void)bindViewModel {
    ZRWeatherViewModel *viewModel = [[ZRWeatherViewModel alloc] initWithId:self.weaid];
    _viewModel = viewModel;
    [self.viewModel.fetchDataCommand execute:nil];
    [RACObserve(self.viewModel, weather) subscribeNext:^(id x) {
        if (!x) {
            return;
        }
        [self.loadingView removeFromSuperview];
        [self loadWeatherViewIfNeeded];
    }];
}
- (void)loadWeatherViewIfNeeded {
    if (!self.weatherView) {
        self.weatherView = [[ZRWeatherView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.weatherView];
    }
    [self.weatherView bindViewModel:self.viewModel];

}

@end
