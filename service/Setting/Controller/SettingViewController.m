//
//  SettingViewController.m
//  service
//
//  Created by shangzh on 16/1/4.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "SettingViewController.h"
#import "BussineHomeViewController.h"

#import "SettingViewCell.h"
#import "CellGroup.h"
#import "CellItem.h"
#import "ViewCell.h"
#import "ArrowCellView.h"
#import "UIBarButtonItem+Manager.h"
#import "UILabel+Manager.h"
#import "Unitl.h"
#import "Constants.h"

@interface SettingViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation SettingViewController

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_baise"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"bg_baise"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Unitl changeStatusBarisWhite:NO];
    [self.navigationController.navigationBar setBarTintColor:kUIColorFromRGB(0xffffff)];
    self.tableView.backgroundColor = kUIColorFromRGB(0xeeeeee);
    
    [self addBarButton];
    
    self.tableView.separatorColor = kUIColorFromRGB(0xf3f3f3);
    
    [self.tableView registerClass:[SettingViewCell class] forCellReuseIdentifier:@"settingcell"];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addBarButton {
    self.navigationItem.titleView = [UILabel initWithTitle:@"我的"];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -12;
    
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 24) BackImage:[UIImage imageNamed:@"set"] target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];

}

- (void)loadData {
    CellGroup *group = [[CellGroup alloc] init];
    group.cellGroup = [ViewCell addUserInfo];
    [self.dataArr addObject:group];
    
    CellGroup *group2 = [[CellGroup alloc] init];
    group2.cellGroup = [ViewCell addOrderInfo];
    [self.dataArr addObject:group2];
    
    CellGroup *group3 = [[CellGroup alloc] init];
    group3.cellGroup = [ViewCell addAssetsInfo];
    [self.dataArr addObject:group3];
    
    CellGroup *group4 = [[CellGroup alloc] init];
    group4.cellGroup = [self addBusiness];
    [self.dataArr addObject:group4];
    
    CellGroup *group5 = [[CellGroup alloc] init];
    ViewCell *view = [[ViewCell alloc] init];

    ArrowCellView *arrow= [[ArrowCellView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 44)];
    arrow.title = @"帮助与反馈";
    arrow.titleFont = 14;
    arrow.titleColor = kUIColorFromRGB(0x333333);
    arrow.titleLeftMaragn = 12;
    
    arrow.arrowImageName = @"help";
    arrow.imageRightMaragn = 8;
    [arrow setUp];
    view.cellView = arrow;
    view.height = 44;
    group5.cellGroup = @[view];
    
    [self.dataArr addObject:group5];
    
    
    CellGroup *group6 = [[CellGroup alloc] init];

    ViewCell *view2 = [[ViewCell alloc] init];
    ArrowCellView *arrow2= [[ArrowCellView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 44)];
    arrow2.title = @"商家入驻开店";
    arrow2.titleFont = 14;
    arrow2.titleColor = kUIColorFromRGB(0x333333);
    arrow2.titleLeftMaragn = 12;
    
    arrow2.arrowImageName = @"setting_more";
    arrow2.imageRightMaragn = 7;
    [arrow2 setUp];
    view2.cellView = arrow2;
    view2.height = 44;
    group6.cellGroup = @[view2];

    [self.dataArr addObject:group6];
    
    [self.tableView reloadData];
}

- (NSArray *)addBusiness {
    
    ViewCell *cell = [[ViewCell alloc] init];
    UIView *bussiness = [[UIView alloc] initWithFrame:CGRectMake(12, 0, kscreenWidth-24, 40)];
    bussiness.backgroundColor = kUIColorFromRGB(0xffffff);
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth-24, 40)];
    [btn setTitle:@"我是商家" forState:UIControlStateNormal];
    [btn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn addTarget:self action:@selector(bussineHome) forControlEvents:UIControlEventTouchUpInside];
    [bussiness addSubview:btn];
    
    cell.height = 40;
    cell.cellView = bussiness;
    cell.color =  kUIColorFromRGB(0xeeeeee);
    NSArray *arr = @[cell];
    return arr;
    
}

- (void)bussineHome {
    BussineHomeViewController *bussineHome = [[BussineHomeViewController alloc] init];
    [self.navigationController pushViewController:bussineHome animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CellGroup *group = self.dataArr[section];
    return group.cellGroup.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellGroup *group = self.dataArr[indexPath.section];
    CellItem *itme = group.cellGroup[indexPath.row];
    
    SettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingcell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[SettingViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingcell"];
    }
    if (itme.color) {
        cell.backgroundColor = itme.color;
    }
    cell.cellItem = itme;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellGroup *group = self.dataArr[indexPath.section];
    CellItem *item = group.cellGroup[indexPath.row];
    return item.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

@end
