//
//  BussineHomeViewController.m
//  service
//
//  Created by shangzh on 16/1/8.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "BussineHomeViewController.h"

#import "UILabel+Manager.h"
#import "UIBarButtonItem+Manager.h"
#import "UIButton+Manager.h"

#import "BussineHeadViewCell.h"
#import "CellGroup.h"
#import "CellItem.h"
#import "ViewCell.h"
#import "SettingViewCell.h"

#import "BussineHomeModel.h"
#import "Constants.h"

@interface BussineHomeViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) BussineHomeModel *bussineModel;

@end

@implementation BussineHomeViewController

- (instancetype)init {
    return  [self initWithStyle:UITableViewStyleGrouped];
}

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
    
    [self loadBussineData];
    
    [self loadCellData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addBarButton {
    self.navigationItem.titleView = [UILabel initWithTitle:@"商家中心"];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -12;
    //右侧按钮
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 21) BackImage:[UIImage imageNamed:@"icon_clock"] target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
}

/**
 *  加载商家数据
 */
- (void)loadBussineData {
    self.bussineModel = [BussineHomeModel lodaBussineData];
}

/**
 *  加载表格数据
 */
- (void)loadCellData {
    CellGroup *group = [[CellGroup alloc] init];
    ViewCell *view = [[ViewCell alloc] init];
    view.cellView = [self firstCellView];
    view.height = 62;
    group.cellGroup = @[@"",view];
    [self.dataArr addObject:group];
    
    
    CellGroup *groupTwo = [[CellGroup alloc] init];
    ViewCell *viewTwo = [[ViewCell alloc] init];
    viewTwo.cellView = [self secondCellView];
    viewTwo.height = 108;
    groupTwo.cellGroup = @[viewTwo];
    [self.dataArr addObject:groupTwo];
    
    CellGroup *groupThree = [[CellGroup alloc] init];
    ViewCell *viewThree = [[ViewCell alloc] init];
    viewThree.cellView = [self threeCellView];
    viewThree.height = 216;
    groupThree.cellGroup = @[viewThree];
    [self.dataArr addObject:groupThree];
    
}

/**
 *  添加第一行cell
 */
- (UIView *)firstCellView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 62)];
    CGFloat titleWidth = kscreenWidth/3;
    //成交额
    UILabel *countTitle = [[UILabel alloc] init] ;
    countTitle.text = @"今日成交总额";
    countTitle.textAlignment = NSTextAlignmentCenter;
    countTitle.font = [UIFont systemFontOfSize:12];
    countTitle.textColor = kUIColorFromRGB(0x999999);
    [countTitle sizeToFit];
    countTitle.frame = CGRectMake(0, 15, titleWidth, countTitle.bounds.size.height);
    [view addSubview:countTitle];
    
    UILabel *countNumber = [[UILabel alloc] init] ;
   
    countNumber.text = [NSString stringWithFormat:@"¥ %@", self.bussineModel.countNumber];
    countNumber.textAlignment = NSTextAlignmentCenter;
    countNumber.font = [UIFont systemFontOfSize:12];
    countNumber.textColor = kUIColorFromRGB(0x999999);
    [countNumber sizeToFit];
    countNumber.frame = CGRectMake(0, 25+countTitle.bounds.size.height, titleWidth, countNumber.bounds.size.height);
    [view addSubview:countNumber];
    
    //访客
    UILabel *visitorTitle = [[UILabel alloc] init] ;
    visitorTitle.text = @"今日访客流量";
    visitorTitle.textAlignment = NSTextAlignmentCenter;
    visitorTitle.font = [UIFont systemFontOfSize:12];
    visitorTitle.textColor = kUIColorFromRGB(0x999999);
    [visitorTitle sizeToFit];
    visitorTitle.frame = CGRectMake(titleWidth, 15, titleWidth, visitorTitle.bounds.size.height);
    [view addSubview:visitorTitle];
    
    UILabel *visitorNumber = [[UILabel alloc] init] ;
    visitorNumber.text =  self.bussineModel.visitorNumber;
    visitorNumber.textAlignment = NSTextAlignmentCenter;
    visitorNumber.font = [UIFont systemFontOfSize:12];
    visitorNumber.textColor = kUIColorFromRGB(0x999999);
    [visitorNumber sizeToFit];
    visitorNumber.frame = CGRectMake(titleWidth, 25+visitorNumber.bounds.size.height, titleWidth, visitorNumber.bounds.size.height);
    [view addSubview:visitorNumber];
    
    //订单
    UILabel *orderTitle = [[UILabel alloc] init] ;
    orderTitle.text = @"今日订单";
    orderTitle.textAlignment = NSTextAlignmentCenter;
    orderTitle.font = [UIFont systemFontOfSize:12];
    orderTitle.textColor = kUIColorFromRGB(0x999999);
    [orderTitle sizeToFit];
    orderTitle.frame = CGRectMake(titleWidth * 2, 15, titleWidth, orderTitle.bounds.size.height);
    [view addSubview:orderTitle];
    
    UILabel *orderNumber = [[UILabel alloc] init] ;
    orderNumber.text =  self.bussineModel.ordeerNumber;
    orderNumber.textAlignment = NSTextAlignmentCenter;
    orderNumber.font = [UIFont systemFontOfSize:12];
    orderNumber.textColor = kUIColorFromRGB(0x999999);
    [orderNumber sizeToFit];
    orderNumber.frame = CGRectMake(titleWidth * 2, 25+orderNumber.bounds.size.height, titleWidth, orderNumber.bounds.size.height);
    [view addSubview:orderNumber];
    return view;
}

/**
 *  添加第二行cell
 */
- (UIView *)secondCellView {
    CGFloat btnWidth = kscreenWidth/3;
    CGFloat btnHeight = 108;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, btnHeight)];
    UIButton *firseMenu = [UIButton initwithFrame:CGRectMake(0, 15, btnWidth, btnHeight) imageName:@"icon_product_management" titleMarage:12 title:@"产品管理" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:firseMenu];
    
    UIButton *secondMenu = [UIButton initwithFrame:CGRectMake(btnWidth, 15, btnWidth, btnHeight) imageName:@"icon_service_project_management" titleMarage:12 title:@"项目管理" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:secondMenu];
    
    UIButton *threeMenu = [UIButton initwithFrame:CGRectMake(btnWidth * 2, 15, btnWidth, btnHeight) imageName:@"icon_order_management" titleMarage:12 title:@"订单管理" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:threeMenu];
    
    return view;
}

/**
 *  添加第三行cell
 */
- (UIView *)threeCellView {
    CGFloat heigth = 201;
    CGFloat btnWidth = kscreenWidth/3;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, heigth)];
    
    UIButton *sing = [UIButton initwithFrame:CGRectMake(0, 15, btnWidth, heigth/2) imageName:@"icon_attendance" titleMarage:12 title:@"考勤签到" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:sing];
    
    UIButton *vacation = [UIButton initwithFrame:CGRectMake(btnWidth, 15, btnWidth, heigth/2) imageName:@"icon_vacation_management" titleMarage:12 title:@"休假管理" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:vacation];
    
    UIButton *compensation = [UIButton initwithFrame:CGRectMake(btnWidth * 2, 15, btnWidth, heigth/2) imageName:@"icon_compensation_center" titleMarage:12 title:@"薪酬中心" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:compensation];
    
    UIButton *employee = [UIButton initwithFrame:CGRectMake(0, heigth/2+30, btnWidth, heigth/2) imageName:@"icon_employee_management" titleMarage:12 title:@"雇员管理" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:employee];
    
    UIButton *position = [UIButton initwithFrame:CGRectMake(btnWidth, heigth/2+30, btnWidth, heigth/2) imageName:@"icon_position_management" titleMarage:12 title:@"职位管理" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:position];
    
    UIButton *talent = [UIButton initwithFrame:CGRectMake(btnWidth * 2, heigth/2+30, btnWidth, heigth/2) imageName:@"icon_talent_recruitment" titleMarage:12 title:@"人才招聘" titleFont:12 titleColor:kUIColorFromRGB(0x434343) target:self action:nil];
    [view addSubview:talent];
    
    return view;
}

#pragma mark table data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CellGroup *group = self.dataArr[section];
    return group.cellGroup.count;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellGroup *grouop = self.dataArr[indexPath.section];
    CellItem *item = grouop.cellGroup[indexPath.row];
    if (indexPath.section == 0 && indexPath.row == 0) {
        BussineHeadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bussinehead"];
        if (!cell) {
            cell = [BussineHeadViewCell Item];
        }
        cell.bussineModel= self.bussineModel;
        return cell;
    } else {
        SettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bussinemanager"];
        if (!cell) {
            cell = [[SettingViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bussinemanager"];
        }
        cell.cellItem = item;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 90;
    }
    CellGroup *group = self.dataArr[indexPath.section];
    CellItem *item = group.cellGroup[indexPath.row];
    return item.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return  0.01;
    }
    return 10;
}

@end
