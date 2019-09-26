//
//  SingleTableViewModel.m
//  mvvmDemo
//
//  Created by LiGuoTing on 2019/4/25.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import "SingleTableViewModel.h"
#import "Demo1DataModel.h"
#import "SingleBindCellModel.h"
#import "SingleBindModel.h"


@interface SingleTableViewModel ()

@property (nonatomic) RACSignal *dataSignal;
@property (nonatomic) RACSignal *errorSignal; // NSError

@property (nonatomic) RACCommand *loadDataCommand;

@end

@implementation SingleTableViewModel


- (instancetype)init
{
    if (self = [super init]) {
        _dataSignal = [[self.loadDataCommand.executionSignals flattenMap:^RACStream *(RACSignal *dataSignal) {
            return [dataSignal map:^id (RACTuple *data) {
                NSArray *scenicArray = data.first;
                NSArray *hotelArray = data.second;
                return [[[[scenicArray rac_sequence] map:^id (SingleBindModel *scenic) {
                    SingleBindCellModel *viewModel = [[SingleBindCellModel alloc] initWithSingleBindModel:scenic];
                   
                    return viewModel;
                }] concat:[[hotelArray rac_sequence] map:^id (SingleBindModel *scenic) {
                    SingleBindCellModel *viewModel = [[SingleBindCellModel alloc] initWithSingleBindModel:scenic];
                    return viewModel;
                }]] array];
            }];
        }] deliverOnMainThread];
        _errorSignal = self.loadDataCommand.errors;
    }
    return self;
}

- (RACCommand *)loadDataCommand
{
    if (!_loadDataCommand) {
        _loadDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            Demo1DataModel *model = [[Demo1DataModel alloc] init];
            RACSignal *houseSignal = [model loadHouseData];
            RACSignal *zrySignal = [model loadHouseData];
            return [houseSignal zipWith:zrySignal];
 
        }];
    }
    return _loadDataCommand;
}

@end
