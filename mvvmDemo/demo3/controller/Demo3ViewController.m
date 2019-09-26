//
//  Demo3ViewController.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/5.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "Demo3ViewController.h"
#import "Demo3ViewModel.h"
#import "Demo3Model.h"
#import "ZRCityListCell.h"
#import "ZRWeatherViewController.h"


@interface Demo3ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) Demo3ViewModel *viewModel;

@property (nonatomic,strong) UITableView *tableview;

@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableview];
    [self bindViewmodel];
}

-(void)initTableview{
    
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    [self.tableview registerClass:[ZRCityListCell class] forCellReuseIdentifier:@"cellid"];
}




-(void)bindViewmodel{
    
    Demo3ViewModel *viewModel = [Demo3ViewModel new];
    _viewModel = viewModel;
    
    [viewModel.fetchCityListCommand execute:nil];
    
    [[viewModel.clickCityCommand.executionSignals switchToLatest] subscribeNext:^(id x) {
        //点击tableView行的操作相应
        ZRWeatherViewController *vc = [ZRWeatherViewController new];
        vc.weaid = self.viewModel.cityListViewModels[[x integerValue]].weaid;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    [RACObserve(viewModel, cityListViewModels) subscribeNext:^(NSArray <Demo3Model *>*x) {
        
        [self.tableview reloadData];
        
    }];
    
}

#pragma mark - tableViewdelegate --------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.viewModel.cityListViewModels.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     ZRCityListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.viewModel = self.viewModel.cityListViewModels[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
     [self.viewModel.clickCityCommand execute:@(indexPath.row)];
}
@end
