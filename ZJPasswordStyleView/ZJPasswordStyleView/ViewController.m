//
//  ViewController.m
//  ZJPasswordStyleView
//
//  Created by 张君君 on 2019/6/24.
//  Copyright © 2019年 com.zhangjunjun.com. All rights reserved.
//

#import "ViewController.h"
#import "ZJPasswordStyleViewController.h"
#import "ZJUIHeader.h"
#import "Masonry.h"
#import "ZJModel.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZJViewModel *dataModel;

@end

@implementation ViewController

static NSString * const kCellID = @"UITableViewCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付密码框样式列表";
    [self initUI];
}

- (void)initUI {
    self.dataModel = [ZJViewModel new];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataModel numberOfSections];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel numberOfRowInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    [cell.textLabel setText:[self.dataModel rowModelOfIndexPath:indexPath].name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJPasswordStyleViewController *passwordStyleVC = [ZJPasswordStyleViewController new];
    passwordStyleVC.dataModel = [self.dataModel rowModelOfIndexPath:indexPath];
    [self.navigationController pushViewController:passwordStyleVC animated:true];
}


- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 100, ZJWinodwWidth, ZJWinodwHeight - 100) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = 44;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZJWinodwWidth, 0.01)];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
        if (@available(iOS 11.0,*)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
    }
    return _tableView;
}



@end
