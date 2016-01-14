//
//  NearViewController.m
//  service
//
//  Created by shangzh on 16/1/5.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "NearViewController.h"
#import "UIBarButtonItem+Manager.h"
#import "UIButton+Manager.h"

#import "CRScrollView.h"
#import "BussineInfoViewCell.h"
#import "ServiceItemViewCell.h"
#import "WaiterInfoViewCell.h"
#import "WaiterServiceViewCell.h"

#import "BussineInfoModel.h"
#import "ServiceItemModel.h"
#import "WaiterInfoModel.h"

#include "Unitl.h"
#import "Constants.h"

@interface NearViewController () <UITableViewDataSource,UITableViewDelegate,CRScrollViewDelegate>
//保存点击的uibutton
@property (nonatomic,strong) UIButton *barBtn;

@property (nonatomic,strong) UITableView *table;

@property (nonatomic,strong) NSMutableArray *dataArr;

//标识选择类型YES 商家 NO服务人员
@property (nonatomic,assign) BOOL type;
//推荐达人
@property (nonatomic,strong) NSMutableArray *startPersonArr;

@end

@implementation NearViewController

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (NSMutableArray *)startPersonArr {
    if (_startPersonArr == nil) {
        _startPersonArr = [[NSMutableArray alloc] init];
    }
    return _startPersonArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kUIColorFromRGB(0xeeeeee);
    [self.navigationController.navigationBar setTintColor:kUIColorFromRGB(0xffffff)];
    
    [self addBarButton];
    
    [self addSelectMenu];
    
    [self addTable];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [Unitl changeStatusBarisWhite:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_baise"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"bg_baise"]];
}

/**
 *  negativebar 添加菜单
 */
- (void)addBarButton {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -12;
    
    UIBarButtonItem *left = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 24) BackImage:[UIImage imageNamed:@"map"] target:self action:nil];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,left];
    
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 24) BackImage:[UIImage imageNamed:@"seach"] target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
    
    CGFloat segWidth = 200;

    UIView *segmentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, segWidth, 30)];
    UIButton *busines = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    busines.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    busines.layer.borderWidth = 1;
    [busines setTitle:@"商家" forState:UIControlStateNormal];
    busines.selected = YES;
    [busines setBackgroundColor:kUIColorFromRGB(0xff8b00)];
    [busines setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateNormal];
    [busines setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [busines addTarget:self action:@selector(barBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.barBtn = busines;
    [segmentView addSubview:busines];
    

    UIButton *waiter = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 100, 30)];
    waiter.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    waiter.layer.borderWidth = 1;
    [waiter setTitle:@"服务人员" forState:UIControlStateNormal];
    [waiter setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateNormal];
    [waiter setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [waiter addTarget:self action:@selector(barBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [segmentView addSubview:waiter];
    
    self.type = YES;
    self.navigationItem.titleView = segmentView;
}

- (void)loadData {
    [self.dataArr removeAllObjects];
    if (self.type) {
        self.dataArr = [BussineInfoModel lodaBussineData];
    } else {
        self.dataArr = [WaiterInfoModel lodaBussineData];
    }
   [self.table reloadData];
    
    [self.startPersonArr removeAllObjects];
    NSArray *startPer = @[@"imgV1_",@"imgV2_",@"imgV3_",@"imgV4_",@"imgV5_",@"imgV6_"];
    [self.startPersonArr addObjectsFromArray:startPer];
}

/**
 *  添加筛选菜单
 */
- (void)addSelectMenu {
    UIView *selectMenu = [[UIView alloc] initWithFrame:CGRectMake(0, 2, kscreenWidth, 40)];
    
    UIButton *sort = [self initwithRightImageFrame:CGRectMake(0, 0, 100, 40) imageName:@"choose" title:@"全部分类" titleFont:14 titleColor:kUIColorFromRGB(0x555555) target:self action:nil];
    [selectMenu addSubview:sort];
    
    UIButton *city = [self initwithRightImageFrame:CGRectMake(100, 0, 60, 40) imageName:@"choose" title:@"全城" titleFont:14 titleColor:kUIColorFromRGB(0x555555) target:self action:nil];
    [selectMenu addSubview:city];
    
    UIButton *distance = [self initwithRightImageFrame:CGRectMake(160, 0, 100, 40) imageName:@"choose" title:@"距离优先" titleFont:14 titleColor:kUIColorFromRGB(0x555555) target:self action:nil];
    [selectMenu addSubview:distance];
    
    UIButton *choose = [self initwithRightImageFrame:CGRectMake(260 , 0, 60, 40) imageName:@"choose" title:@"筛选" titleFont:14 titleColor:kUIColorFromRGB(0x555555) target:self action:nil];
    [selectMenu addSubview:choose];
    selectMenu.backgroundColor = kUIColorFromRGB(0xffffff);
    [self.view addSubview:selectMenu];
}

- (UIButton *)initwithRightImageFrame:(CGRect)rect imageName:(NSString *)imageName title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:rect];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFont]];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn.titleLabel sizeToFit];
    CGFloat spect = (rect.size.width-btn.titleLabel.bounds.size.width - btn.imageView.bounds.size.width)/2;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+spect, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.bounds.size.width, 0, btn.imageView.bounds.size.width);

    return btn;
}

/**
 *  添加列表
 */
- (void)addTable {
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, kscreenWidth, kscreenHeight-150) style:UITableViewStyleGrouped];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.backgroundColor = kUIColorFromRGB(0xeeeeee);
    self.table.separatorInset = UIEdgeInsetsMake(0, -240, 0, 0);
    [self.view addSubview:self.table];
}

/**
 *  商家和服务人员之间切换
 */
- (void)barBtnClick:(UIButton *)btn {
    self.type = !self.type;
    btn.selected = YES;
    btn.backgroundColor = kUIColorFromRGB(0xff8b00);
    self.barBtn.selected = NO;
    self.barBtn.backgroundColor = kUIColorFromRGB(0xffffff);
    self.barBtn = btn;
    //重新加载数据
    [self loadData];
    
}


//加载商家的其它产品
- (void)addResidue:(UIButton *)btn {
    int i = (int)btn.tag;
    BussineInfoModel *bussineInfo = self.dataArr[i];
    bussineInfo.isAll = YES;
    [self.table reloadData];
}

#pragma mark data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.type) {
        BussineInfoModel *bussineInfo = self.dataArr[section];
        if (bussineInfo.isAll) {
            return (bussineInfo.productArr.count+1);
        } else {
            return 3;
        }
    } else {
        WaiterInfoModel *waiter = self.dataArr[section];
        if (waiter.isAll) {
            return (waiter.serviceItem.count+1);
        } else {
            return 3;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (self.type) {  //商家
        BussineInfoModel *bussineInfo = self.dataArr[indexPath.section];
        if (indexPath.row == 0) {
            BussineInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bussineInfo"];
            if (!cell) {
                cell = [BussineInfoViewCell Item];
                
            }
            cell.bussineInfo = bussineInfo;
            return cell;
        } else {
            ServiceItemModel *service = bussineInfo.productArr[indexPath.row-1];
            ServiceItemViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bussineproduct"];
            if (!cell) {
                cell = [ServiceItemViewCell Item];
            }
            cell.busineProduct = service;
            return cell;
        }
    } else {  //服务人员
        WaiterInfoModel *waterInfo = self.dataArr[indexPath.section];
        if (indexPath.row == 0) {
            WaiterInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"waiterinfocell"];
                if (!cell) {
                    cell = [[WaiterInfoViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"waiterinfocell"];
                }
                cell.waiterInfo = waterInfo;
                return cell;
        } else {
            ServiceItemModel *service = waterInfo.serviceItem[indexPath.row-1];
                WaiterServiceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"waiterservicecell"];
                if (!cell) {
                    cell = [WaiterServiceViewCell Item];
                }
                cell.serviceItem = service;
                return cell;
        }
       
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 70;
    }
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.type) {
        if (section == 0) {
            return 35;
        } else {
            return 10;
        }
    } else {
        if (section == 0) {
            return 155;
        } else {
            return 10;
        }
    }
   

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *headView = [[UIView alloc] init];
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"shuaxin"] forState:UIControlStateNormal];
        btn.frame = CGRectMake(kscreenWidth-36, 5, 24, 24);
        [headView addSubview:btn];
        
        UILabel *location = [[UILabel alloc] init];
        location.text = @"当前：广东省深圳市南山区深南大道9002华侨城锦绣花园二期";
        location.textColor = kUIColorFromRGB(0xaaaaaa);
        location.font = [UIFont systemFontOfSize:12];
        location.frame = CGRectMake(12, 0, kscreenWidth-48, 35);
        [headView addSubview:location];
        
        if (self.type) {
            headView.frame = CGRectMake(0, 0, kscreenWidth, 35);
        } else {
            UIView *startPerpeo = [[UIView alloc] initWithFrame:CGRectMake(0, 35, kscreenWidth, 110)];
            startPerpeo.backgroundColor = [UIColor whiteColor];
            
            UILabel *title = [[UILabel alloc] init];
            title.text = @"推荐达人";
            title.font = [UIFont systemFontOfSize:16];
            title.textColor = kUIColorFromRGB(0x333333);
            [title sizeToFit];
            title.frame = CGRectMake(12, 20, title.bounds.size.width, title.bounds.size.height);
            [startPerpeo addSubview:title];
            
            UIImageView *vimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"near_ren_07"]];
            vimage.frame = CGRectMake(18+title.bounds.size.width, 20, 15.5, 15.5);
            [startPerpeo addSubview:vimage];
            
            CRScrollView *scoper = [[CRScrollView alloc] initWithFrame:CGRectMake(0, 20+title.bounds.size.height+10, kscreenWidth, 54)];
            scoper.crDelegate = self;
            scoper.leftMargin = 12;
            scoper.maragn = 10;
            scoper.itemWidth = 44;
            scoper.itemHeight = 44;
            scoper.dataArr = self.startPersonArr;
            [scoper setUp];
            [startPerpeo addSubview:scoper];
            
            [headView addSubview:startPerpeo];
            headView.frame = CGRectMake(0, 0, kscreenWidth, 120);
        }
        
        return headView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    BussineInfoModel *bussineInfo = self.dataArr[section];
    if (!bussineInfo.isAll) {
        return 50;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    BussineInfoModel *bussineInfo = self.dataArr[section];
    if (!bussineInfo.isAll) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 50)];
        view.backgroundColor = kUIColorFromRGB(0xffffff);
        UIButton *btn = [[UIButton alloc] initWithFrame:view.frame];
        btn.tag = section;
        [btn setTitleColor:kUIColorFromRGB(0x434343) forState:UIControlStateNormal];
        [btn setTitle:@"其它两个推荐" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateNormal];
        [btn.titleLabel sizeToFit];
        CGFloat spect = (kscreenWidth-btn.titleLabel.bounds.size.width - btn.imageView.bounds.size.width)/2;
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+spect, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, btn.imageView.bounds.size.width);
        [btn addTarget:self action:@selector(addResidue:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
         return view;
    }
    return nil;
   
}

@end
