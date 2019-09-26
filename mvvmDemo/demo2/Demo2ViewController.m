//
//  Demo2ViewController.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/25.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "Demo2ViewController.h"
#import "Demo2ViewModel.h"

@interface Demo2ViewController ()

@property (nonatomic) Demo2ViewModel *viewModel;

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
    [self bind];
}
-(void)createView{
    UITextField * text1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, 230, 30)];
    text1.borderStyle = UITextBorderStyleRoundedRect;
    text1.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:text1];
    self.phoneTextField = text1;
    
    UITextField * text2 = [[UITextField alloc]initWithFrame:CGRectMake(20, 160, 230, 30)];
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:text2];
    self.passwordTextField = text2;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40 , 30)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    self.outputLabel = label;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(300, 120, 70, 70);
    [btn setTitle:@"清空" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor].CGColor forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor].CGColor forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:btn];
    self.clearButton = btn;
    
    
}

-(void)bind{
    _viewModel = [[Demo2ViewModel alloc] init];
    RACChannelTerminal *phoneTerminal = [_phoneTextField rac_newTextChannel];
    [_viewModel.phoneTerminal subscribe:phoneTerminal];
    [phoneTerminal subscribe:_viewModel.phoneTerminal];
    
    RACChannelTerminal *passwordTerminal = [_passwordTextField rac_newTextChannel];
    RACChannelTerminal *viewModelPasswordTerminal = RACChannelTo(_viewModel, password);
    [viewModelPasswordTerminal subscribe:passwordTerminal];
    [passwordTerminal subscribe:viewModelPasswordTerminal];
    
    RAC(_outputLabel, text) = _viewModel.outputSignal;
    _clearButton.rac_command = _viewModel.clearCommand;
    
    UIColor *(^mapValidateToColor)(NSNumber *) = ^(NSNumber *pass) {
        return [pass boolValue] ? [UIColor blackColor] : [UIColor redColor];
    };
    
    RAC(_passwordTextField, textColor) = [[_viewModel.verifyPasswordSignal distinctUntilChanged]map:mapValidateToColor];
    
    RAC(_phoneTextField, textColor) = [[_viewModel.verifyPhoneSignal distinctUntilChanged]map:mapValidateToColor];
}
@end
