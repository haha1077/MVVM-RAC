//
//  NoARCViewController.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/5/22.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "NoARCViewController.h"
#import "NoRACViewModel.h"
#import "ZRCityListCell.h"
#import "ZRWeatherViewController.h"
#import "FactoryViewModel.h"

@interface NoARCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NoRACViewModel *viewModel;

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSArray *cityListArray;

@end

@implementation NoARCViewController

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
    
    NoRACViewModel *viewModel = [NoRACViewModel new];
    _viewModel = viewModel;
    
    [viewModel requestCityListWithSuccessBlock:^(NSArray * _Nonnull cityList) {
        
        self.cityListArray = cityList;
        [self.tableview reloadData];
        
    } withFailedBlock:^(NSError * _Nonnull error) {
        
    }];
 
}
#pragma mark - tableViewdelegate --------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cityListArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRCityListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.viewModel = self.cityListArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //点击tableView行的操作相应
    ZRWeatherViewController *vc = [ZRWeatherViewController new];
    FactoryViewModel *vm = self.cityListArray[indexPath.row];
    vc.weaid = vm.weaid;
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
