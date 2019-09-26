//
//  Demo2ViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/25.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Demo2ViewModel : NSObject

@property (nonatomic) RACChannelTerminal *phoneTerminal;
@property (nonatomic) NSString *password;
@property (nonatomic) RACSignal *verifyPhoneSignal;
@property (nonatomic) RACSignal *verifyPasswordSignal;
@property (nonatomic) RACSignal *outputSignal;
@property (nonatomic) RACCommand *clearCommand;
@end

NS_ASSUME_NONNULL_END
