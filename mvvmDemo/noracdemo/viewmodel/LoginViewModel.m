//
//  LoginViewModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/22.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

-(void)verifyBtnEnable{
    
    if([self.verText isEqualToString:@"重置"]){
        
        [self sendNotifaction];
    }
    
}

-(void)sendNotifaction{
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"inputTextValueChangedNotification" object:nil userInfo:@{@"inputText": @"通知"}];
    
}


@end
