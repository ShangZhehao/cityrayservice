//
//  MessageViewController.m
//  service
//
//  Created by shangzh on 16/1/11.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatViewCell.h"
#import "ChatModel.h"
#import "UIBarButtonItem+Manager.h"
#import "XMChatBar.h"

#import "Constants.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) UITableView *table;
//消息输入栏
@property (nonatomic,strong) XMChatBar *menuView;
//消息输入文本框
@property (nonatomic,strong) UITextField *text;
//隐藏buttn
@property (nonatomic,strong) UIButton *coverBtn;

//更多菜单view
@property (nonatomic,strong) UIView *moreView;

@end

@implementation ChatViewController

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kUIColorFromRGB(0xeeeeee);
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, kscreenHeight-114)];
    table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    table.backgroundColor = kUIColorFromRGB(0xffffff);
    table.delegate = self;
    table.dataSource = self;
    self.table = table;
    [self.view addSubview:self.table];
    
    [self loadBarButton];
    
    [self loadChatMessageData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadBarButton {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -12;
    
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 24) BackImage:[UIImage imageNamed:@"icon_personal_profile"] target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[right,negativeSpacer];
}


- (void)loadChatMessageData {
    [self.dataArr addObjectsFromArray:[ChatModel loadMessageData]];
    [self.table reloadData];
}

#pragma mark data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatModel *model = self.dataArr[indexPath.row];
    ChatViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatcell"];
    if (!cell) {
        cell = [[ChatViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"chatcell"];
    }
    cell.chate = model;
    cell.backgroundColor = kUIColorFromRGB(0xeeeeee);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatModel *model = self.dataArr[indexPath.row];
    return model.cellHeight;
}

#pragma mark uitextfiled delegate


@end
