//
//  Demo1DataModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/25.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Demo1DataModel : NSObject


- (RACSignal *)loadHouseData;

@end

NS_ASSUME_NONNULL_END
