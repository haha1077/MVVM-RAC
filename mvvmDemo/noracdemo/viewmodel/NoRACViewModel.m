//
//  NoRACViewModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/22.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "NoRACViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import "Demo3Model.h"
#import "FactoryViewModel.h"

static NSString *cityListUrl = @"http://api.k780.com:88/?app=weather.city&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";

@interface NoRACViewModel ()
@end

@implementation NoRACViewModel


#pragma mark ------- request ---------
//这部分可以放到manager里面
- (void)requestCityListWithSuccessBlock:(void(^)(NSArray *cityList))successBlock withFailedBlock:(void(^)(NSError *error))failedBlock {
 
    [[AFHTTPSessionManager manager] GET:cityListUrl
                             parameters:@{}
                               progress:nil
                                success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                                    BOOL success = [responseObject[@"success"] boolValue];
                                    if (success) {
                                        NSDictionary *value = responseObject[@"result"];
                                        NSArray *keys = value.allKeys;
                                        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:keys.count];
                                        for (NSString *key in keys) {
                                            NSDictionary *dict = value[key];
                                            Demo3Model *city = [[Demo3Model alloc] initWithDictionary:dict];
                                            FactoryViewModel *vm = [[FactoryViewModel alloc] initWithCity:city];
                                            [temp addObject:vm];
                                        }
                                        successBlock(temp);
                                    } else {
                                        NSError *error =  [NSError errorWithDomain:NSURLErrorDomain code:-200 userInfo:@{NSLocalizedDescriptionKey: @"数据异常"}];
                                        failedBlock(error);
                                    }
                                } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                                    failedBlock(error);
                                }];
}

@end
