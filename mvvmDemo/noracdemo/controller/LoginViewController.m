//
//  LoginViewController.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/22.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIButton *clearButton;
@property (nonatomic,strong) UILabel *outputLabel;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    UITextField * text1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, 230, 30)];
    text1.borderStyle = UITextBorderStyleRoundedRect;
    text1.delegate = self;
    text1.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:text1];
    self.phoneTextField = text1;
    
    UITextField * text2 = [[UITextField alloc]initWithFrame:CGRectMake(20, 160, 230, 30)];
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.font = [UIFont systemFontOfSize:18];
    text2.delegate = self;
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
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:btn];
    self.clearButton = btn;
}


#pragma mark - textfielddelegate -----
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"%@",textField.text);
    
    
    return YES;
}


 

@end
