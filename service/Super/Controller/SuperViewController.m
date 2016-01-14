//
//  SuperViewController.m
//  service
//
//  Created by shangzh on 16/1/6.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "SuperViewController.h"
#import "ReleaseViewController.h"
#import "UIBarButtonItem+Manager.h"
#import "SuperToolViewCell.h"
#import "ShareInfoViewCell.h"

#import "ShareInfoModel.h"
#import "UILabel+Manager.h"
#import "Unitl.h"
#import "Constants.h"

@interface SuperViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIScrollView *menuView;
//当前选中的菜单
@property (nonatomic,strong) UIButton *selectBtn;
//分享数据
@property (nonatomic,copy) NSMutableArray *dataArr;

@property (nonatomic,strong) UITableView *table;

@end

@implementation SuperViewController

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kUIColorFromRGB(0xeeeeee);
    
    [self addBarButton];
    
    [self addMenuView];
    
    [self loadData];
    
    UITableView *tabel = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, kscreenWidth, kscreenHeight-118) style:UITableViewStyleGrouped];
    tabel.dataSource = self;
    tabel.delegate = self;
    tabel.separatorInset = UIEdgeInsetsMake(0, -240, 0, 0);
    [tabel registerClass:[UITableViewCell class] forCellReuseIdentifier:@"supercell"];
    self.table = tabel;
    [self.view addSubview:self.table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [Unitl changeStatusBarisWhite:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_baise"] forBarMetrics:UIBarMetricsDefault];

}

- (void)loadData {
    self.dataArr = [ShareInfoModel loadData];
    [self.table reloadData];
}

/**
 *  添加barbutton
 */
- (void)addBarButton {

    UIBarButtonItem *negativeSpacer = [UIBarButtonItem barSpearcer];
    negativeSpacer.width = -12;
    
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 24) BackImage:[UIImage imageNamed:@"fabu"] target:self action:@selector(fabu)];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
    
    self.navigationItem.titleView = [UILabel initWithTitle:@"达人"];
}

//添加菜单
- (void)addMenuView {
    NSArray *menData = @[@"全部分类",@"足疗按摩",@"美容美甲",@"健身",@"出行",@"其它"];
    CGFloat width = 75;
    
    UIScrollView *scrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 40)];
    scrollMenu.showsHorizontalScrollIndicator = NO;
    // 设置内容大小
    scrollMenu.contentSize = CGSizeMake(menData.count*width, 40);
    // 是否同时运动,lock
    scrollMenu.directionalLockEnabled = YES;
    scrollMenu.backgroundColor = kUIColorFromRGB(0xffffff);
    for (int i = 0; i < menData.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, 40)];
        [btn setTitle:menData[i] forState:UIControlStateNormal];
        if (i == 0) {
            self.selectBtn = btn;
            btn.selected = YES;
        }
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn setTitleColor:kUIColorFromRGB(0x555555) forState:UIControlStateNormal];
        [btn setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"super-man_07"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(changeTyep:) forControlEvents:UIControlEventTouchUpInside];
        [scrollMenu addSubview:btn];
    }

    [self.view addSubview:scrollMenu];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kscreenWidth-32.5, 0, 32.5, 40)];
    [btn setImage:[UIImage imageNamed:@"icon_more_arrow_down"] forState:UIControlStateNormal];
    [btn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

/**
 *  菜单单击事件
 */
- (void)changeTyep:(UIButton *)btn {
    btn.selected = YES;
    self.selectBtn.selected = NO;
    self.selectBtn = btn;
#warning reload Data
    
}

//跳转发布页面
- (void)fabu {
    ReleaseViewController *release = [[ReleaseViewController alloc] init];
    [self.navigationController pushViewController:release animated:YES];
}

/**
 *  cell 背景颜色
 */
- (UIView *)cellBackViewWith:(CGRect)frame {
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    backView.backgroundColor = kUIColorFromRGB(0xffffff);
    return backView;
}

#pragma mark data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareInfoModel *share = self.dataArr[indexPath.section];
    if (indexPath.row == 0) {
        ShareInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shareinfo"];
        if (!cell) {
            cell = [[ShareInfoViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shareinfo"];
        }
        cell.sharInfo = share;
        cell.selectedBackgroundView = [self cellBackViewWith:cell.frame];
        return cell;
    } else {
        SuperToolViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"supertool"];
        if (!cell) {
            cell = [SuperToolViewCell Item];
        }
        cell.shareInfo = share;
        cell.selectedBackgroundView = [self cellBackViewWith:cell.frame];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareInfoModel *share = self.dataArr[indexPath.section];
    if (indexPath.row == 0) {
        return share.cellHeight;
    }
    return 40;
    
}
@end
