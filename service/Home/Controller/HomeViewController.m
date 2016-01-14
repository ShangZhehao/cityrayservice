//
//  HomeViewController.m
//  service
//
//  Created by shangzh on 15/12/29.
//  Copyright © 2015年 shangzh. All rights reserved.
//

#import "HomeViewController.h"


#import "UIBarButtonItem+Manager.h"
#import "UICollectionView+ImageView.h"

#import "HomeViewCell.h"
#import "MenuModel.h"
#import "HomeViewModel.h"

#import "SearchFile.h"
#import "CollectionViewCell.h"
#import "Unitl.h"
#import "Constants.h"
#import "CRScrollView.h"

@interface HomeViewController()<UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,CRScrollViewDelegate>

@property (nonatomic,strong) UIView *scroll;

@property (nonatomic,strong) UIImageView *imageView;
//菜单view
@property (nonatomic,strong) UIView *menuView;
//今日特价view
@property (nonatomic,strong) UIView *specialView;
//头条view
@property (nonatomic,strong) UIView *headLineView;
//图片菜单
@property (nonatomic,strong) UIView *ImagMenuView;
//数据列表
@property (nonatomic,strong) UITableView *tableDataView;
//菜单arr
@property (nonatomic,strong) NSArray *menuArr;
//今日特价Arr
@property (nonatomic,strong) NSMutableArray *specialArr;

@property (nonatomic,strong) UIPageControl *page;

//表格数据
@property (nonatomic,strong) NSMutableArray *cellDataArr;

@end

@implementation HomeViewController

- (NSArray *)menuArr {
    if (_menuArr == nil) {
        _menuArr = [[NSArray alloc] init];
    }
    return _menuArr;
}

- (NSMutableArray *)specialArr {
    if (_specialArr == nil) {
        _specialArr = [[NSMutableArray alloc] init];
    }
    return _specialArr;
}

- (NSMutableArray *)cellDataArr {
    if (_cellDataArr == nil) {
        _cellDataArr = [[NSMutableArray alloc] init];
    }
    return _cellDataArr;
}

/**
 *  加载菜单
 */
- (void)loadMenuData {
    self.menuArr = [MenuModel lodaMenuData];
}

/**
 *  加载今日特价数据
 */
- (void)loadSpeciaData {
    [self.specialArr addObject:@"img11"];
    [self.specialArr addObject:@"img12"];
    [self.specialArr addObject:@"img13"];
    [self.specialArr addObject:@"img11"];
    [self.specialArr addObject:@"img12"];
    [self.specialArr addObject:@"img13"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroll = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 620)];
    self.scroll.backgroundColor = kUIColorFromRGB(0xeeeeee);
    [self loadMenuData];
    
    [self loadSpeciaData];
    
    [self addBarItem];
    
    [self addImage];

    [self addMenuItem];

    [self addSpecialMenu];

    [self addHeadLine];

    [self addImageMenu];
    
    [self addTitleView];
    
    [self addTableView];
    
    [self loadCellData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [Unitl changeStatusBarisWhite:YES];
    
    [self.navigationController.navigationBar setBarTintColor:kUIColorFromRGB(0xff8b00)];
}

/**
 * 加载主页显示的数据
 */
- (void)loadCellData {
    self.cellDataArr = [[[HomeViewModel alloc] init] loadData];
}

/**
 *  添加barItem
 */
- (void)addBarItem {

    UIBarButtonItem *leftnegativeSpacer = [UIBarButtonItem barSpearcer];
    leftnegativeSpacer.width = -12;
    
    //左侧按钮
    UIBarButtonItem *left = [UIBarButtonItem barbuttonItemWithLeftTitle:@"深圳" titleFont:16 rightImage:[UIImage imageNamed:@"xuanzhe"] target:self action:nil];
    self.navigationItem.leftBarButtonItems = @[leftnegativeSpacer,left];
    
    //右侧按钮
    UIBarButtonItem *rightNegativeSpacer = [UIBarButtonItem barSpearcer];
    rightNegativeSpacer.width = -10;
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 21) BackImage:[UIImage imageNamed:@"saoyisao"] target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[rightNegativeSpacer,right];
    
  
    UIButton *btn = (UIButton *)left.customView;
    
    SearchFile *search = [[SearchFile alloc] initWithFrame:CGRectMake(10, 0, (kscreenWidth - btn.bounds.size.width - 72), 36) Icon:@"suosou"];
    search.background = [UIImage imageNamed:@"sousuo_bg"];
    search.delegate = self;
    search.placeholder = @"搜索商家,品类。。。";
    search.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索商家,品类。。。" attributes:@{NSForegroundColorAttributeName:kUIColorFromRGB(0xffffff),NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    self.navigationItem.titleView =search;
    
}

/**
 *  添加图片
 */
- (void)addImage {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 80)];
    self.imageView.image = [UIImage imageNamed:@"home_banner"];
    [self.scroll addSubview:self.imageView];
}

/**
 *  添加菜单
 */
- (void)addMenuItem {
    CGFloat menViewHeight = 160;
    self.menuView = [[UIView alloc] initWithFrame:CGRectMake(0, self.imageView.bounds.size.height, kscreenWidth, menViewHeight)];
    self.menuView.backgroundColor = kUIColorFromRGB(0xffffff);
    //菜单
    UICollectionView *menuItem =[UICollectionView initWithideten:@"menu" itemSize:CGSizeMake(kscreenWidth, menViewHeight) collectionY:(10) collectionWidth:kscreenWidth collectionHeight:menViewHeight spance:0 Inset:0];
    menuItem.delegate = self;
    menuItem.dataSource = self;
    menuItem.pagingEnabled = YES; //分页
    menuItem.bounces = NO;
    menuItem.backgroundColor = kUIColorFromRGB(0xffffff);
    [self.menuView addSubview:menuItem];
    
    [self.scroll addSubview:self.menuView];
    
    [self addPageWith:0];

}

/**
 *   初始化pageController
 */
- (void)addPageWith:(int)num {
    UIPageControl *page = [[UIPageControl alloc] init];
    page.center = CGPointMake(kscreenWidth * 0.5,self.menuView.bounds.size.height-10);
    page.pageIndicatorTintColor = [UIColor blackColor];
    page.currentPageIndicatorTintColor = kUIColorFromRGB(0xff8b00);
    [self.view bringSubviewToFront:page];
    page.numberOfPages = 2;
    page.currentPage = num;
    [self.menuView addSubview:page];
    self.page = page;
}

//今日特价
- (void)addSpecialMenu {
    self.specialView = [[UIView alloc] initWithFrame:CGRectMake(0, self.imageView.bounds.size.height+self.menuView.bounds.size.height+1, kscreenWidth, 190)];
    self.specialView.backgroundColor = kUIColorFromRGB(0xffffff);
    
    CGFloat btnWidh = 24;
    UILabel *specialLable = [[UILabel alloc] init];
    specialLable.text = @"今日特价";
    specialLable.textColor = kUIColorFromRGB(0x333333);
    specialLable.font = [UIFont systemFontOfSize:16];
    [specialLable sizeToFit];
    specialLable.frame = CGRectMake(12, 16, specialLable.bounds.size.width, btnWidh);
    [self.specialView addSubview:specialLable];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"setting_more"];
    imageView.frame = CGRectMake(kscreenWidth-24-5, 16, 24, 24);
    [self.specialView addSubview:imageView];
    
    
    UIButton *second = [[UIButton alloc] initWithFrame:CGRectMake(imageView.frame.origin.x-25, 16, btnWidh, btnWidh)];
    [second setTitle:@"03" forState:UIControlStateNormal];
    [second.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [second setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [second setBackgroundImage:[UIImage imageNamed:@"sudu"] forState:UIControlStateNormal];
    [self.specialView addSubview:second];
    
    UILabel *sec = [[UILabel alloc] init];
    sec.text = @":";
    sec.font = [UIFont systemFontOfSize:12];
    [sec sizeToFit];
    sec.frame = CGRectMake(second.frame.origin.x-5, 16, btnWidh, btnWidh);
    [self.specialView addSubview:sec];
    
    UIButton *minute = [[UIButton alloc] initWithFrame:CGRectMake(sec.frame.origin.x-25, 16, btnWidh, btnWidh)];
    [minute setTitle:@"03" forState:UIControlStateNormal];
    [minute.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [minute setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [minute setBackgroundImage:[UIImage imageNamed:@"sudu"] forState:UIControlStateNormal];
    [self.specialView addSubview:minute];
    
    UILabel *min = [[UILabel alloc] init];
    min.text = @":";
    min.font = [UIFont systemFontOfSize:12];
    [min sizeToFit];
    min.frame = CGRectMake(minute.frame.origin.x-5, 16, btnWidh, btnWidh);
    [self.specialView addSubview:min];
    
    UIButton *houre = [[UIButton alloc] initWithFrame:CGRectMake(min.frame.origin.x-25, 16, btnWidh, btnWidh)];
    [houre setTitle:@"03" forState:UIControlStateNormal];
    [houre.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [houre setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [houre setBackgroundImage:[UIImage imageNamed:@"sudu"] forState:UIControlStateNormal];
    [self.specialView addSubview:houre];
    
    UILabel *timeTitle = [[UILabel alloc] init];
    timeTitle.text = @"距离结束";
    timeTitle.font = [UIFont systemFontOfSize:12];
    timeTitle.textColor = kUIColorFromRGB(0x555555);
    [timeTitle sizeToFit];
    timeTitle.frame = CGRectMake(houre.frame.origin.x-10-timeTitle.bounds.size.width, 16, timeTitle.bounds.size.width, btnWidh);
    [self.specialView addSubview:timeTitle];
    
    //距离结束的跳
    UIButton *speciaBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 16, kscreenWidth, btnWidh)];
    [speciaBtn addTarget:self action:@selector(searchSpecial) forControlEvents:UIControlEventTouchUpInside];
   
    [self.specialView addSubview:speciaBtn];
    

    CGFloat btnImageHeight = 120;
    CRScrollView *speciaScroll = [[CRScrollView alloc] initWithFrame:CGRectMake(0, 50, kscreenWidth, btnImageHeight)];
    speciaScroll.crDelegate = self;
    speciaScroll.leftMargin = 20;
    speciaScroll.maragn = 10;
    speciaScroll.itemWidth = 85;
    speciaScroll.itemHeight = 120;
    speciaScroll.dataArr = self.specialArr;
    [speciaScroll setUp];
    [self.specialView addSubview:speciaScroll];
    
    [self.scroll addSubview:self.specialView];
}

- (void)addHeadLine {
    self.headLineView = [[UIView alloc] initWithFrame:CGRectMake(12, self.imageView.bounds.size.height+self.menuView.bounds.size.height+self.specialView.bounds.size.height+11, kscreenWidth-24, 40)];
    self.headLineView.backgroundColor = kUIColorFromRGB(0xffffff);
    UILabel *title = [[UILabel alloc] init];
    title.text = @"服服头条";
    title.font = [UIFont systemFontOfSize:12];
    title.textColor = kUIColorFromRGB(0x333333);
    [title sizeToFit];
    title.frame = CGRectMake(12, (40-title.bounds.size.height)/2, title.bounds.size.width, title.bounds.size.height);
    [self.headLineView addSubview:title];
    
    UILabel *new = [[UILabel alloc] init];
    new.textColor = kUIColorFromRGB(0xaaaaaa);
    new.font = [UIFont systemFontOfSize:12];
    new.text = @"显示服服社交，活动排前的活动或新闻";
    [new sizeToFit];
    new.frame = CGRectMake(title.frame.origin.x+title.bounds.size.width + 10, title.frame.origin.y,kscreenWidth-title.bounds.size.width-22 , new.bounds.size.height);
    [self.headLineView addSubview:new];
    
    [self.scroll addSubview:self.headLineView];

}


/**
 *  图片菜单
 */
- (void)addImageMenu {
    CGFloat imageMenuViewHeight = 90;
    CGFloat leftImageHeight = 30;
    self.ImagMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, self.imageView.bounds.size.height+self.menuView.bounds.size.height+self.specialView.bounds.size.height+self.headLineView.bounds.size.height+21, kscreenWidth, imageMenuViewHeight)];
    self.ImagMenuView.backgroundColor = kUIColorFromRGB(0xffffff);
    
    //左侧图片
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, (kscreenWidth-15)/2, imageMenuViewHeight - 10)];
    leftBtn.backgroundColor = kUIColorFromRGB(0xf8f8f8);
    
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake((kscreenWidth-15)/2-(leftImageHeight+10), (imageMenuViewHeight-leftImageHeight)/2-5, leftImageHeight, leftImageHeight)];
    leftImage.image = [UIImage imageNamed:@"img_01"];
    [leftBtn addSubview:leftImage];
    
    UILabel *leftLabelOne = [[UILabel alloc] init];
    leftLabelOne.text = @"好礼多多 (新用户)";
    leftLabelOne.font = [UIFont systemFontOfSize:12];
    [leftLabelOne sizeToFit];
    leftLabelOne.frame = CGRectMake(10, (leftBtn.bounds.size.height)/2 - leftLabelOne.bounds.size.height, leftLabelOne.bounds.size.width, leftLabelOne.bounds.size.height);
    [leftBtn addSubview:leftLabelOne];
    
    UILabel *leftLabeltwo = [[UILabel alloc] init];
    leftLabeltwo.text = @"出行无忧替你分忧";
    leftLabeltwo.textColor = kUIColorFromRGB(0xaaaaaa);
    leftLabeltwo.font = [UIFont systemFontOfSize:11];
    [leftLabeltwo sizeToFit];
    leftLabeltwo.frame = CGRectMake(10, (leftBtn.bounds.size.height)/2 + 5, leftLabeltwo.bounds.size.width, leftLabeltwo.bounds.size.height);
    [leftBtn addSubview:leftLabeltwo];
    
    [self.ImagMenuView addSubview:leftBtn];
    
    //右侧上面
    UIButton *rightTopBtn = [[UIButton alloc] initWithFrame:CGRectMake(leftBtn.bounds.size.width+10, 5, (kscreenWidth-15)/2, (imageMenuViewHeight-15)/2)];
    rightTopBtn.backgroundColor = kUIColorFromRGB(0xf8f8f8);
    
    UIImageView *rightTopImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_02"]];
    rightTopImage.frame = CGRectMake(rightTopBtn.bounds.size.width-50, 5, 40, 30);
    [rightTopBtn addSubview:rightTopImage];
    
    UILabel *rightLabelOne = [[UILabel alloc] init];
    rightLabelOne.text = @"满200减100";
    rightLabelOne.font = [UIFont systemFontOfSize:11];
    [rightLabelOne sizeToFit];
    rightLabelOne.frame = CGRectMake(10, 5, rightLabelOne.bounds.size.width, rightLabelOne.bounds.size.height);
    [rightTopBtn addSubview:rightLabelOne];
    
    UILabel *rightTopLabeltwo = [[UILabel alloc] init];
    rightTopLabeltwo.text = @"大手笔来了";
    rightTopLabeltwo.textColor = kUIColorFromRGB(0xaaaaaa);
    rightTopLabeltwo.font = [UIFont systemFontOfSize:11];
    [rightTopLabeltwo sizeToFit];
    rightTopLabeltwo.frame = CGRectMake(10, rightLabelOne.bounds.size.height + 10, leftLabeltwo.bounds.size.width, leftLabeltwo.bounds.size.height);
    [rightTopBtn addSubview:rightTopLabeltwo];
    
    [self.ImagMenuView addSubview:rightTopBtn];
    
    
    //右侧下面
    UIButton *rigthBotBtn = [[UIButton alloc] initWithFrame:CGRectMake(leftBtn.bounds.size.width+10, rightTopBtn.bounds.size.height + 10 , (kscreenWidth-15)/2, (imageMenuViewHeight-15)/2)];
    rigthBotBtn.backgroundColor = kUIColorFromRGB(0xf8f8f8);
    [self.ImagMenuView addSubview:rigthBotBtn];
    
    UIImageView *rightBotImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_03"]];
    rightBotImage.frame = CGRectMake(rigthBotBtn.bounds.size.width-50, 5, 40, 30);
    [rigthBotBtn addSubview:rightBotImage];
    
    UILabel *rightBotLabelOne = [[UILabel alloc] init];
    rightBotLabelOne.text = @"周四折上折";
    rightBotLabelOne.font = [UIFont systemFontOfSize:11];
    [rightBotLabelOne sizeToFit];
    rightBotLabelOne.frame = CGRectMake(10, 5, rightBotLabelOne.bounds.size.width, rightBotLabelOne.bounds.size.height);
    [rigthBotBtn addSubview:rightBotLabelOne];
    
    UILabel *rightBotLabeltwo = [[UILabel alloc] init];
    rightBotLabeltwo.text = @"家政服务领先为您";
    rightBotLabeltwo.textColor = kUIColorFromRGB(0xaaaaaa);
    rightBotLabeltwo.font = [UIFont systemFontOfSize:11];
    [rightBotLabeltwo sizeToFit];
    rightBotLabeltwo.frame = CGRectMake(10, rightBotLabeltwo.bounds.size.height + 10, rightBotLabeltwo.bounds.size.width, rightBotLabeltwo.bounds.size.height);
    [rigthBotBtn addSubview:rightBotLabeltwo];
    
    [self.scroll addSubview:self.ImagMenuView];
}

/**
 *  table的title
 */
- (void)addTitleView {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, self.imageView.bounds.size.height+self.menuView.bounds.size.height+self.specialView.bounds.size.height+self.headLineView.bounds.size.height+21+self.ImagMenuView.bounds.size.height+1, kscreenWidth, 40)];
    headView.backgroundColor = kUIColorFromRGB(0xffffff);
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"服服推荐"];
    label.textColor = kUIColorFromRGB(0x333333);
    label.font = [UIFont systemFontOfSize:16];
    [label sizeToFit];
    label.frame = CGRectMake(12, 16, label.bounds.size.width, label.bounds.size.height);
    [headView addSubview:label];
    [self.scroll addSubview:headView];
}

/**
 *  添加table
 */
- (void)addTableView {
    self.tableDataView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, kscreenHeight)];
    self.tableDataView.dataSource = self;
    self.tableDataView.delegate = self;
    self.tableDataView.separatorInset = UIEdgeInsetsMake(0, -240, 0, 0);
    self.tableDataView.tableHeaderView = self.scroll;
    [self.view addSubview:self.tableDataView];
    
}


#pragma mark function
/**
 *  选择城市
 */
- (void)choseCity {
#warning
}

/**
 *  扫二维码
 */
- (void)scan{
#warning
}
/**
 *  特价商品跳
 */
- (void)searchSpecial {
#warning
}

#pragma mark search deletate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.placeholder = @"";
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.placeholder = @"搜索商家,品类。。。";
}

#pragma mark UICollectionView数据源
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.menuArr.count > 8) {
        return (self.menuArr.count/8 + 1);
    }
    return (self.menuArr.count/8);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menu" forIndexPath:indexPath];
    cell.menuArr = [self.menuArr subarrayWithRange:NSMakeRange(0, 8)];
    if (self.page != nil) {
        [self.page removeFromSuperview];
        [self addPageWith:(int)indexPath.row];
    }
    return cell;
}

#pragma mark UITableView 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewModel *model = self.cellDataArr[indexPath.row];
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homecell"];
    if (cell == nil) {
        cell = [HomeViewCell Item];
    }
    cell.homeModel = model;
    UIView *backView = [[UIView alloc] initWithFrame:cell.frame];
    backView.backgroundColor = kUIColorFromRGB(0xffffff);
    cell.selectedBackgroundView = backView;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 104;
}
@end
