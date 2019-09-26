//
//  BaseTableViewCell.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell

- (void)bindWithViewModel:(BaseCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
