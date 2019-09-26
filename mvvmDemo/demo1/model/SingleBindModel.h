//
//  SingleBindModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleBindModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *headImgUrl;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *info;
@property (nonatomic,copy) NSString *tag;
@property (nonatomic,copy) NSString *address;

@end

NS_ASSUME_NONNULL_END
