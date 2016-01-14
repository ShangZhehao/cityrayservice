//
//  ConnectViewController.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ConnectViewController.h"
#import "ChatViewController.h"
#import <EaseMobSDKFull/EaseMob.h>

#import "MessageViewCell.h"

#import "Unitl.h"
#import "Constants.h"

#import "XMNChatController.h"

@interface ConnectViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UIButton *selectBtn;

@property (nonatomic,strong) UITableView *table;

@property (nonatomic,strong) NSMutableArray *connectArr;

@end

@implementation ConnectViewController

- (NSMutableArray *)connectArr {
    if (_connectArr == nil) {
        _connectArr = [[NSMutableArray alloc] init];
    }
    return _connectArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kUIColorFromRGB(0xeeeeee);
    
    [self loadConnectData];
    
    [self addHeaderBtn];
    
    [self addSearch];
    
    if (!self.table) {
        [self.table removeFromSuperview];
    }
    [self addMessageTable];
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

- (void)addHeaderBtn {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 40)];
    
    UIButton *message = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    message.tag = 1;
    [message setTitle:@"消息" forState:UIControlStateNormal];
    [message setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateNormal];
    [message setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [message setBackgroundColor:kUIColorFromRGB(0xff8b00)];
    message.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    message.selected = YES;
    self.selectBtn = message;
    message.layer.borderWidth = 1;
    [message addTarget:self action:@selector(changeChiledController:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:message];
    
    UIButton *connecter = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 80, 30)];
    connecter.tag = 2;
    [connecter setTitle:@"联系人" forState:UIControlStateNormal];
    [connecter setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateNormal];
    [connecter setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [connecter setBackgroundColor:kUIColorFromRGB(0xffffff)];
    connecter.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    connecter.layer.borderWidth = 0.5;
    [connecter addTarget:self action:@selector(changeChiledController:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:connecter];
    
    UIButton *trends = [[UIButton alloc] initWithFrame:CGRectMake(130, 0, 50, 30)];
    trends.tag = 3;
    [trends setTitle:@"动态" forState:UIControlStateNormal];
    [trends setTitleColor:kUIColorFromRGB(0xff8b00) forState:UIControlStateNormal];
    [trends setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [trends setBackgroundColor:kUIColorFromRGB(0xffffff)];
    trends.layer.borderColor = kUIColorFromRGB(0xff8b00).CGColor;
    trends.layer.borderWidth = 1;
    [trends addTarget:self action:@selector(changeChiledController:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:trends];
    
    self.navigationItem.titleView = view;
    
}

/**
 *  添加搜索框
 */
- (void)addSearch {
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(12, 10, kscreenWidth - 24, 36)];
    text.placeholder = @"按姓名、时间、关键词搜索";
    text.backgroundColor = kUIColorFromRGB(0xffffff);
    text.font = [UIFont systemFontOfSize:12];
    text.textColor = kUIColorFromRGB(0xaaaaaa);
    [self.view addSubview:text];
}


- (void)changeChiledController:(UIButton *)btn {
    self.selectBtn.selected = NO;
    self.selectBtn.backgroundColor = kUIColorFromRGB(0xffffff);
    btn.selected = YES;
    btn.backgroundColor = kUIColorFromRGB(0xff8b00);
    self.selectBtn = btn;
    [self.table reloadData];
}

/**
 *  获取联系人
 */
- (void)loadConnectData {
    [[EaseMob sharedInstance].chatManager asyncFetchBuddyListWithCompletion:^(NSArray *buddyList, EMError *error) {
        if (!error) {
            NSLog(@"获取成功 -- %@",buddyList);
            [self.connectArr addObjectsFromArray:buddyList];
            [self.table reloadData];
        }
    } onQueue:nil];
}

/**
 *  消息列表
 */
- (void)addMessageTable {
    UITableView *messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 56, kscreenWidth, kscreenHeight-154)];
    messageTable.dataSource = self;
    messageTable.delegate = self;
    messageTable.separatorInset = UIEdgeInsetsMake(0, -240, 0, 0);
    self.table = messageTable;
    [self.view addSubview:self.table];
}

/**
 *  联系人列表
 */
- (void)addConnectTable {
    UITableView *connect = [[UITableView alloc] initWithFrame:CGRectMake(0, 56, kscreenWidth, kscreenHeight-154)];
    connect.dataSource = self;
    connect.delegate = self;
    connect.separatorInset = UIEdgeInsetsMake(0, -240, 0, 0);
    self.table = connect;
    [self.view addSubview:self.table];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"tag====%lu",self.selectBtn.tag);
    if (self.selectBtn.tag == 1) {
        return 10;
    } else if (self.selectBtn.tag == 2) {
//        return self.connectArr.count;
        return 3;
    } else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (self.selectBtn.tag == 1) {
        MessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messagecell"];
        if (!cell) {
            cell = [MessageViewCell Item];
        }
        return cell;
    } else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"connectlist"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"connectlist"];
        }
        EMBuddy *user = self.connectArr[indexPath.row];
        cell.textLabel.text = user.username;
        cell.textLabel.text = @"12345";
        return cell;
    }
   
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XMNChatController *message = [[XMNChatController alloc] init];
    [self.navigationController pushViewController:message animated:YES];
    message.title = @"张三";
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
@end
