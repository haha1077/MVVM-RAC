//
//  SinglebindTableViewController.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "SinglebindTableViewController.h"
#import "BasecellViewModel.h"
#import "SingleBindTableViewCell.h"
#import "Demo1DataModel.h"
#import "SingleBindModel.h"
#import "SingleTableViewModel.h"

@interface SinglebindTableViewController ()

@property (nonatomic,strong)SingleTableViewModel *vmodel;
@property (nonatomic) NSArray *cellViewModelArray;

@end

@implementation SinglebindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _vmodel = [[SingleTableViewModel alloc] init];

    [self.tableView registerClass:[SingleBindTableViewCell class] forCellReuseIdentifier:@"SingleBindTableViewCell"];
    self.refreshControl.rac_command = _vmodel.loadDataCommand;
     [self.refreshControl beginRefreshing];

    [self rac_liftSelector:@selector(refreshTableView:) withSignals:_vmodel.dataSignal, nil];
    [self rac_liftSelector:@selector(showError:) withSignals:_vmodel.errorSignal, nil];
    [_vmodel.loadDataCommand execute:nil];
  
}

- (void)showError:(NSError *)error
{
    [self.refreshControl endRefreshing];
    self.cellViewModelArray = nil;
    [self.tableView reloadData];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
    }]];
    
    [self presentViewController:alertController animated:YES completion:^{
    }];
}

- (void)refreshTableView:(NSArray *)cellViewModelArray
{
    self.cellViewModelArray = cellViewModelArray;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return _cellViewModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseCellViewModel *cellViewModel = _cellViewModelArray[indexPath.row];
    NSString *cellClassName = @"SingleBindTableViewCell";
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClassName];
    
    [cell bindWithViewModel:cellViewModel];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   return  100;
    
}
 
@end
