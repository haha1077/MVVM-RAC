//
//  SingleTableViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/25.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleTableViewModel : NSObject

@property (nonatomic, readonly) RACSignal *dataSignal;
@property (nonatomic, readonly) RACSignal *errorSignal; // NSError

@property (nonatomic, readonly) RACCommand *loadDataCommand;

@end

NS_ASSUME_NONNULL_END
