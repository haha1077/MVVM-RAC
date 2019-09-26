//
// Created by 马凯文 on 2019-04-29.
// Copyright (c) 2019 马凯文. All rights reserved.
//

#import <ReactiveCocoa/RACCommand.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ZRWeatherViewModel.h"
#import "ZRWeather.h"
#import <AFNetworking/AFNetworking.h>


static NSString *weatherUrl = @"http://api.k780.com:88/?app=weather.today&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";

@interface ZRWeatherViewModel()
@property (nonatomic, copy) NSString *weaid;
@property (nonatomic, strong) ZRWeather *weather;
@end

@implementation ZRWeatherViewModel

- (instancetype)initWithId:(NSString *)weaid {
    if (self = [super init]) {
        _weaid = [weaid copy];
    }
    return self;
}

- (RACCommand *)fetchDataCommand {
    if (!_fetchDataCommand) {
        @weakify(self)
        _fetchDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self)
            return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
                RACSubject *subject = [self requestWeatherWithId:self.weaid];
                [subject subscribeNext:^(id x) {
                    self.weather = x;
                }];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _fetchDataCommand;
}



- (RACSubject *)requestWeatherWithId:(NSString *)weaid {
    RACSubject *subject = [RACSubject subject];
    [[AFHTTPSessionManager manager] GET:weatherUrl
                             parameters:@{
                                          @"weaid": weaid ?: @""
                                          }
                               progress:nil
                                success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                                    BOOL success = [responseObject[@"success"] boolValue];
                                    if (success) {
                                        NSDictionary *value = responseObject[@"result"];
                                        ZRWeather *weather = [ZRWeather weatherWithDict:value];
                                        [subject sendNext:weather];
                                    } else {
                                        [subject sendError:[NSError errorWithDomain:NSURLErrorDomain code:-200 userInfo:@{NSLocalizedDescriptionKey: @"数据异常"}]];
                                    }
                                } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                                    [subject sendError:error];
                                }];
    return subject;
}
@end
