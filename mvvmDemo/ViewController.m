//
//  ViewController.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "ViewController.h"
#import "SinglebindTableViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "NoARCViewController.h"
#import "LoginViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTable];
    
    
}

-(void)creatTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, self.view.bounds.size.height-90) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    if(indexPath.row == 0){
        cell.textLabel.text = @"DEMO 1";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"DEMO 2";
    }else if(indexPath.row == 2){
        cell.textLabel.text = @"DEMO 3";
    }else if(indexPath.row == 3){
        cell.textLabel.text = @"NoRAC DEMO";
    }else{
        cell.textLabel.text = @"Login DEMO";
    }
    
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if(indexPath.row == 0)
    {
        SinglebindTableViewController *vc = [SinglebindTableViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 1){
        Demo2ViewController *vc = [Demo2ViewController new];
        [self.navigationController pushViewController:vc animated:YES];  
    }else if(indexPath.row == 2){
        Demo3ViewController *vc = [Demo3ViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 3){
        NoARCViewController *vc = [NoARCViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        LoginViewController *vc = [LoginViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
     
}

@end
