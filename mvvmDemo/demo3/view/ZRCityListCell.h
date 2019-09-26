//
// Created by 马凯文 on 2019-04-29.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FactoryViewModel.h"

@interface ZRCityListCell : UITableViewCell

@property (nonatomic,strong) FactoryViewModel *viewModel;

- (void)cellDidBindData;


@end
