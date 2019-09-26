//
//  mvvmDemoTests.m
//  mvvmDemoTests
//
//  Created by LiGuoTing on 2019/4/24.
//  Copyright © 2019年 LiGuoTing. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Demo2ViewModel.h"
#import "SingleTableViewModel.h"
#import "Demo1DataModel.h"
#import "Demo3ViewModel.h"
#import "ZRWeatherViewModel.h"
#import "NoRACViewModel.h"
#import <OCMock/OCMock.h>
#import "LoginViewModel.h"

@interface mvvmDemoTests : XCTestCase


@property (nonatomic,strong) Demo1DataModel  *vm;

@end

@implementation mvvmDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark - Demo2Test -------
- (void)testVerifyPhone
{
    Demo2ViewModel *viewModel = [[Demo2ViewModel alloc] init];
    
    RACChannel *channel = [[RACChannel alloc] init];
    [viewModel.phoneTerminal subscribe:channel.leadingTerminal];
    [channel.leadingTerminal subscribe:viewModel.phoneTerminal];
    
    [channel.followingTerminal sendNext:@"18612345678"]; // 模拟从文本框输入 18612345678
    
    NSNumber *verifyPhoneResult = [viewModel.verifyPhoneSignal first];
    XCTAssertEqualObjects(verifyPhoneResult, @(YES));
    
    [viewModel setValue:@"13810001000" forKey:@"phone"]; // 模拟ViewModel更新phone值为13810001000
    
    XCTAssertEqualObjects([channel.followingTerminal first], @"13810001000"); // 检验文本框内容是否为13810001000
    
    viewModel.password = @"1234";
    NSNumber *verifyPasswordResult = [viewModel.verifyPasswordSignal first];
    XCTAssertEqualObjects(verifyPasswordResult, @(NO)); // 测试密码校验逻辑，少于8位，失败。
}

- (void)testClearCommand
{
    Demo2ViewModel *viewModel = [[Demo2ViewModel alloc] init];
    
    [viewModel setValue:@"18612345678" forKey:@"phone"];
    XCTAssertEqualObjects([viewModel valueForKey:@"phone"], @"18612345678");
    
    [viewModel setValue:@"passw0rd" forKey:@"password"];
    XCTAssertEqualObjects([viewModel valueForKey:@"password"], @"passw0rd");
    
    [viewModel.clearCommand execute:nil];
    
    XCTAssertEqualObjects([viewModel valueForKey:@"phone"], @"132");
    XCTAssertEqualObjects([viewModel valueForKey:@"password"], @"");
    
}

#pragma mark - Demo1Test -------
- (void)testSingleTableDataModel{
    
    _vm = [[Demo1DataModel alloc] init];
    BOOL success;
    NSError *error;
    
    id result = [_vm.loadHouseData
                 asynchronousFirstOrDefault:nil success:&success error:&error];
 
   NSLog(@"结果 -- %@", result);
}

- (void)testSingleTableViewModel{
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"My Expectation"];
    
        SingleTableViewModel *vm = [[SingleTableViewModel alloc] init];
    
        [vm.dataSignal subscribeNext:^(id x) {
            NSLog(@"======%@",x);
            if(!x){
                return;
            }
            [expectation fulfill];
        }];
       [vm.errorSignal subscribeNext:^(id x) {
         NSLog(@"error======%@",x);
         [expectation fulfill];
       }];
    
      [vm.loadDataCommand execute:nil];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        //测试结束
        NSLog(@"test case over");
    }];
    
}

#pragma mark - Demo3Test -------
-(void)testDemo3Model{
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"My Expectation"];
    
    Demo3ViewModel *vm = [[Demo3ViewModel alloc] init];
    [vm.fetchCityListCommand execute:nil];
    [RACObserve(vm, cityListViewModels) subscribeNext:^(NSArray <Demo3Model *>*x) {
        NSLog(@"======%@",x);
        if(!x){
            return ;
        }
       [expectation fulfill];
    }];
    
    [[vm.clickCityCommand.executionSignals switchToLatest] subscribeNext:^(id x) {
        //点击tableView行的操作相应
        XCTAssertNotNil(x,@"正确");
    }];
    
    [vm.clickCityCommand execute:@"123"];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        //测试结束
        NSLog(@"test case over");
    }];
}

#pragma mark - demo4Test --------

-(void)testDemo4VM{
     XCTestExpectation *expectation = [self expectationWithDescription:@"My Expectation"];
    
    ZRWeatherViewModel *viewModel = [[ZRWeatherViewModel alloc] initWithId:@"123"];
    [ viewModel.fetchDataCommand execute:nil];
    [RACObserve(viewModel, weather) subscribeNext:^(id x) {
        NSLog(@"Demo4======%@",x);
        if (!x) {
            return;
        }
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        //测试结束
        NSLog(@"test case over");
    }];
}

#pragma mark - NoRACdemoTest --------

-(void)testNoRACdemo{
    XCTestExpectation *expectation = [self expectationWithDescription:@"My Expectation"];
    
    NoRACViewModel * model = [NoRACViewModel new];
    [model requestCityListWithSuccessBlock:^(NSArray * _Nonnull cityList) {
        if(!cityList){
            return ;
        }
        [expectation fulfill];
        XCTAssertNotNil(cityList, @"通过");
        
    } withFailedBlock:^(NSError * _Nonnull error) {
         XCTAssertNotNil(error, @"未通过");
    }];
    
    [self waitForExpectationsWithTimeout:30  handler:^(NSError * _Nullable error) {
        
    }];
}

-(void)testLoginDemo{
    
    LoginViewModel *model = [[LoginViewModel alloc] init];
    id mockModel = OCMPartialMock(model);
    
    OCMStub([mockModel verText]).andReturn(@"重置");
    
    [mockModel verifyBtnEnable];
    
    OCMVerify([mockModel sendNotifaction]);
    
    
}
@end
