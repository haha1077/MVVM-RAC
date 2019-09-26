//
//  LoginViewModel.h
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/22.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property (nonatomic,copy) NSString *verText;


-(void)verifyBtnEnable;

-(void)sendNotifaction;

@end

NS_ASSUME_NONNULL_END
