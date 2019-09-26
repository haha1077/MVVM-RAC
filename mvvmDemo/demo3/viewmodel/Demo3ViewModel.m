//
//  Demo3ViewModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "Demo3ViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import "Demo3Model.h"
#import "FactoryViewModel.h"


static NSString *cityListUrl = @"http://api.k780.com:88/?app=weather.city&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";

@interface Demo3ViewModel ()

@property (nonatomic, strong ) NSArray<FactoryViewModel *> *cityListViewModels;

@property (nonatomic, strong) NSError *cityListError;

@end

@implementation Demo3ViewModel

- (RACCommand *)fetchCityListCommand{
    
    if(!_fetchCityListCommand){
        
        _fetchCityListCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
           
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                RACSubject *sub = [self requestCityList];
                RACSubject *newSub = [sub map:^id(id value) {
                    NSMutableArray *temp = [NSMutableArray array];
                    for (Demo3Model *city in value) {
                        FactoryViewModel *vm = [[FactoryViewModel alloc] initWithCity:city];
                        [temp addObject:vm];
                    }
                    return temp;
                }];
                [newSub subscribeNext:^(id x) {
                    self.cityListViewModels = x;
                }];
                [sub subscribeError:^(NSError *error) {
                   self.cityListError = error;
                }];
                return nil;
            }];
             
        }];
    }
    return _fetchCityListCommand;
}

- (RACCommand *)clickCityCommand
{
    if (!_clickCityCommand) {
        _clickCityCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [subscriber sendNext:input];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _clickCityCommand;
}


#pragma mark ------- request ---------
//这部分可以放到manager里面
- (RACSubject *)requestCityList {
    RACSubject *subject = [RACSubject subject];
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
                                            [temp addObject:city];
                                        }
                                        [subject sendNext:[temp copy]];
                                    } else {
                                        [subject sendError:[NSError errorWithDomain:NSURLErrorDomain code:-200 userInfo:@{NSLocalizedDescriptionKey: @"数据异常"}]];
                                    }
                                } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                                    [subject sendError:error];
                                }];
    return subject;
}
@end
