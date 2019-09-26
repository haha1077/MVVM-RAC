//
//  Demo3Model.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Demo3Model : NSObject


@property (nonatomic, copy) NSString *weaid;

@property (nonatomic, copy) NSString *citynm;

@property (nonatomic, copy) NSString *cityid;

@property (nonatomic, copy) NSString *area_1;

@property (nonatomic, copy) NSString *area_2;

@property (nonatomic, copy) NSString *area_3;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
