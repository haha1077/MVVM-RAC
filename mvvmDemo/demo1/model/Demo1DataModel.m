//
//  Demo1DataModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/25.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "Demo1DataModel.h"
#import "SingleBindModel.h"

@implementation Demo1DataModel


-(RACSignal *)loadHouseData{
    
    //模拟网络连接
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        //模拟网络延时
        [NSThread sleepForTimeInterval:1];
        //模拟1/4概率网络错误
        NSInteger randomNum = arc4random();
        if(randomNum % 4 == 0){
            NSError *error = [ NSError errorWithDomain:@"网络错误" code:500 userInfo:@{}];
            [subscriber sendError:error];
            return nil;
        }
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Demo1HouseData" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSError *error = nil;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            [subscriber sendError:error];
        } else {
            NSArray *houseData = jsonData[@"data"];
            if (!houseData) {
                [subscriber sendError:[NSError errorWithDomain:@"网络错误" code:500 userInfo:@{}]];
            } else {
                NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
                for(NSDictionary *dic in houseData){
                    SingleBindModel *model = [SingleBindModel new];
                    model.title = dic[@"title"];
                    model.price = dic[@"price"];
                    model.headImgUrl = dic[@"headImgUrl"];
                    model.tag = dic[@"tag"];
                    model.address = dic[@"address"];
                    model.info = dic[@"info"];
                    [arr addObject:model];
                }
                
                if (error) {
                    [subscriber sendError:error];
                } else {
                    [subscriber sendNext:arr];
                    [subscriber sendCompleted];
                }
            }
        }
        
        return [RACDisposable disposableWithBlock:^{
            //这里应该中断网络连接
        }];
   }] subscribeOn:[RACScheduler schedulerWithPriority:DISPATCH_QUEUE_PRIORITY_DEFAULT]];
}

@end
