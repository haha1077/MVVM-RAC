//
//  FactoryViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  Demo3Model;

NS_ASSUME_NONNULL_BEGIN

@interface FactoryViewModel : NSObject

- (instancetype)initWithCity:(Demo3Model *)city;

@property (nonatomic, copy, readonly) NSString *cityName;

@property (nonatomic, copy, readonly) NSString *weaid;


@end

NS_ASSUME_NONNULL_END
