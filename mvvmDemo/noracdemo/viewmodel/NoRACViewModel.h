//
//  NoRACViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/22.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoRACViewModel : NSObject


- (void)requestCityListWithSuccessBlock:(void(^)(NSArray *cityList))successBlock withFailedBlock:(void(^)(NSError *error))failedBlock;

@end

NS_ASSUME_NONNULL_END
