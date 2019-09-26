//
// Created by 马凯文 on 2019-04-29.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import "ZRCityListCell.h"
#import "FactoryViewModel.h"
 


@implementation ZRCityListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self cellDidLoad];
    }
    return self;
}

- (void)cellDidLoad {

    //...
}

-(void)setViewModel:(FactoryViewModel *)viewModel{
    
    _viewModel = viewModel;
    self.textLabel.text = [NSString stringWithFormat:@"%@",self.viewModel.cityName];
}



 
@end
