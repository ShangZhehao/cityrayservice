//
//  ReleaseViewController.m
//  service
//
//  Created by shangzh on 16/1/8.
//  Copyright © 2016年 shangzh. All rights reserved.
//

#import "ReleaseViewController.h"

#import "UIBarButtonItem+Manager.h"
#import "UILabel+Manager.h"
#import "UIScrollView+Manager.h"

#import "CellGroup.h"
#import "CellItem.h"
#import "ViewCell.h"
#import "SettingViewCell.h"
#import "ArrowCellView.h"

#import "Constants.h"

@interface ReleaseViewController () <UITextViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong) NSMutableArray *dataArr;
//保存分类图片
@property (nonatomic,strong) NSArray *sortArr;
//保存要分享的图片
@property (nonatomic,strong) NSMutableArray *shareImage;

@property (nonatomic,strong) UIScrollView *shareScor;
//发表内容
@property (nonatomic,copy) NSString *shareContent;

@end

@implementation ReleaseViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (NSArray *)sortArr {
    if (_sortArr == nil) {
        _sortArr = @[@"zu",@"jianshen",@"jiazheng",@"lifa",@"meirong"];
    }
    return _sortArr;
}

- (NSMutableArray *)shareImage {
    if (_shareImage == nil) {
        _shareImage = [[NSMutableArray alloc] init];
    }
    return _shareImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = kUIColorFromRGB(0xeeeeee);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.titleView = [UILabel initWithTitle:@"发表达文"];
    
    [self addBarButton];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
    
    if (self.dataArr.count > 0) {
        [self.dataArr removeObjectAtIndex:0];
        [self addFirstGroup];
    } else {
        [self addFirstGroup];
        
        [self addSecondGroup];
        
        [self addThreeGroup];
    }

    [self.tableView reloadData];

}

/**
 *  第一组
 */
- (void)addFirstGroup {
    CellGroup *group = [[CellGroup alloc] init];
    ViewCell *viewCell = [[ViewCell alloc] init];
    viewCell.height = 215;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, viewCell.height)];
    UITextView *filed = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 135)];
    if (self.shareContent.length > 0) {
        filed.text = self.shareContent;
        filed.textColor = kUIColorFromRGB(0x434343);
    } else {
        filed.text = @"分享点什么吧...";
        filed.textColor = kUIColorFromRGB(0x999999);
        
    }
    filed.tintColor = kUIColorFromRGB(0xff8b00);
    filed.font = [UIFont systemFontOfSize:16];
    filed.tintColor = kUIColorFromRGB(0xff8b00);
    filed.delegate = self;
    [view addSubview:filed];
    
    int shareImageCount = (int)self.shareImage.count;
    
    self.shareScor = [UIScrollView initWithFrame:CGRectMake(0, 135, kscreenWidth, 80) contentSize:CGSizeMake(shareImageCount*80+12+180+kscreenWidth, 80)];
    if (shareImageCount > 0) {
        for (int i = 0; i < shareImageCount; i++) {
            UIButton *btnOne = [[UIButton alloc] initWithFrame:CGRectMake(i*80+12, 0, 70, 70)];
            [btnOne setBackgroundImage:self.shareImage[i] forState:UIControlStateNormal];
            btnOne.backgroundColor = [UIColor redColor];
            [self.shareScor addSubview:btnOne];
        }
    }
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(shareImageCount*80+12, 0, 70, 70)];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"super_tianjia"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.shareScor addSubview:addBtn];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new"]];
    imageView.frame = CGRectMake(shareImageCount*80+80+12, 10, 41, 15.5);
    [self.shareScor addSubview:imageView];
    
    UILabel *sharLabel = [[UILabel alloc] init];
    sharLabel.text = @"添加照片，视频";
    sharLabel.textColor = kUIColorFromRGB(0x999999);
    sharLabel.font = [UIFont systemFontOfSize:16];
    [sharLabel sizeToFit];
    sharLabel.frame = CGRectMake(shareImageCount*80+80+12, imageView.bounds.size.height+20, sharLabel.bounds.size.width, sharLabel.bounds.size.height);
    [self.shareScor addSubview:sharLabel];
    [view addSubview:self.shareScor];
    
    viewCell.cellView = view;
    

    ViewCell *view2 = [[ViewCell alloc] init];
    ArrowCellView *arrow= [[ArrowCellView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 44)];
    arrow.title = @"显示地点";
    arrow.titleFont = 16;
    arrow.titleColor = kUIColorFromRGB(0x434343);
    arrow.titleLeftMaragn = 12;
    
    arrow.detailString = @"";
    arrow.detailFont= 12;
    arrow.detailColor = kUIColorFromRGB(0x999999);
    arrow.detailRightMaragn = 0;
    
    arrow.arrowImageName = @"enter";
    arrow.imageRightMaragn = 4;
    [arrow setUp];
    view2.cellView = arrow;
    view2.height = 44;
    
    group.cellGroup = @[viewCell,view2];
    [self.dataArr insertObject:group atIndex:0];
}

/**
 *  第二组
 */
- (void)addSecondGroup {
    CellGroup *group2 = [[CellGroup alloc] init];
    ViewCell *view = [[ViewCell alloc] init];
    ArrowCellView *arrow= [[ArrowCellView alloc] initWithFrame:CGRectMake(0, 0, kscreenWidth, 44)];
    arrow.title = @"谁能看见";
    arrow.titleFont = 16;
    arrow.titleColor = kUIColorFromRGB(0x434343);
    arrow.titleLeftMaragn = 12;
    
    arrow.detailString = @"所有人可见";
    arrow.detailFont= 16;
    arrow.detailColor = kUIColorFromRGB(0x999999);
    arrow.detailRightMaragn = 0;
    
    arrow.arrowImageName = @"enter";
    arrow.imageRightMaragn = 4;
    [arrow setUp];
    view.cellView = arrow;
    view.height = 44;
    
    
    group2.cellGroup = @[view];
    [self.dataArr addObject:group2];

}

- (void)addThreeGroup {
    CellGroup *group3 = [[CellGroup alloc] init];
    ViewCell *viewCell3 = [[ViewCell alloc] init];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = kUIColorFromRGB(0xffffff);
    
    UILabel *cellTitle = [[UILabel alloc] init];
    cellTitle.text = @"分类发表";
    cellTitle.textColor = kUIColorFromRGB(0x434343);
    cellTitle.font = [UIFont systemFontOfSize:16];
    [cellTitle sizeToFit];
    cellTitle.frame = CGRectMake(12, 16, cellTitle.bounds.size.width, cellTitle.bounds.size.height);
    [view3 addSubview:cellTitle];
    
    
    int imgCount = (int)self.sortArr.count;
    UIScrollView *sorceImage = [UIScrollView initWithFrame:CGRectMake(0, cellTitle.bounds.size.height+32, kscreenWidth, 70) contentSize:CGSizeMake((imgCount*66+20), 50)];
    for (int i = 0; i < imgCount; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20+(66*i), 0, 50, 50)];
        [btn setBackgroundColor:kUIColorFromRGB(0xeeeeee)];
        [btn setImage:[UIImage imageNamed:self.sortArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",self.sortArr[i]]] forState:UIControlStateSelected];
        btn.layer.cornerRadius = 25;
        [btn addTarget:self action:@selector(selectSort:) forControlEvents:UIControlEventTouchUpInside];
        [sorceImage addSubview:btn];
    }
    [view3 addSubview:sorceImage];
    view3.frame = CGRectMake(0, 0, kscreenWidth, cellTitle.bounds.size.height + 102);
    viewCell3.cellView = view3;
    viewCell3.height = cellTitle.bounds.size.height+102;
    group3.cellGroup = @[viewCell3];
    [self.dataArr addObject:group3];
}

/**
 *  添加barItem
 */
- (void)addBarButton {
    UIBarButtonItem *negativeSpacer = [UIBarButtonItem barSpearcer];
    negativeSpacer.width = -12;
    
    UIBarButtonItem *right = [UIBarButtonItem barbuttonItemWithTitle:@"发表" titleFont:14 target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,right];
    
    UIBarButtonItem *left = [UIBarButtonItem barbuttonItemWithTitle:@"取消" titleFont:14 target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,left];


}

/**
 *  取消
 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

/**
 *  选择分类
 */
- (void)selectSort:(UIButton *)btn {
    if (btn.selected) {
        btn.selected = NO;
        for (UIView *view in btn.subviews) {
            if (view.tag == 5) {
                [view removeFromSuperview];
            }
        }
    }else {
        btn.selected = YES;
        UIImageView *check = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_gouxuan"]];
        check.tag = 5;
        check.frame = CGRectMake(btn.frame.size.width-14, btn.frame.size.height-14, 14, 14);
        [btn addSubview:check];
    }
}

/**
 *  添加图片
 */
- (void)addPhoto {
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
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
    CellItem *cellItem = group.cellGroup[indexPath.row];
    SettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fabucell"];
    if (!cell) {
        cell = [[SettingViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"fabucell"];
    }
    UIView *selectView = [[UIView alloc] initWithFrame:cell.frame];
    selectView.backgroundColor = kUIColorFromRGB(0xffffff);
    cell.selectedBackgroundView = selectView;
    cell.cellItem = cellItem;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return  0.01;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellGroup *group = self.dataArr[indexPath.section];
    CellItem *item = group.cellGroup[indexPath.row];
    return item.height;
}

#pragma mark textfile delegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    textView.text = nil;
    [textView setFont:[UIFont systemFontOfSize:14]];
    [textView setTextColor:kUIColorFromRGB(0x333333)];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.shareContent = textView.text;
    [self resignFirstResponder];
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    if (buttonIndex == 0) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    } else if (buttonIndex == 1) {
        // 从相册中选取
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self.shareImage addObject:info[@"UIImagePickerControllerOriginalImage"]];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self loadData];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
