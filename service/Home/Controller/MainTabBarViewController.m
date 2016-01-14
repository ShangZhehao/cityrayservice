//
//  MainTabBarViewController.m
//  platform
//
//  Created by shangzh on 15/9/24.
//  Copyright (c) 2015年 shangzh. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainViewController.h"
#import "HomeViewController.h"
#import "ConnectViewController.h"
#import "SettingViewController.h"
#import "CRTabbar.h"
#import "TabbarModel.h"
#import "UIImage+Manager.h"
#import "NearViewController.h"
#import "SuperViewController.h"

@interface MainTabBarViewController () <CRTabbarDelegate>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setChiledViewController];
    CRTabbar *bar = [[CRTabbar alloc] init];
    bar.frame = self.tabBar.bounds;
    bar.delegate = self;
    bar.items = self.tabBar.items;
    bar.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:bar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 添加控制器
- (void)setChiledViewController {
    //首页
    HomeViewController *home = [[HomeViewController alloc] init];
    MainViewController *homeMain = [[MainViewController alloc] initWithRootViewController:home];
    
    //附近
    NearViewController *near = [[NearViewController alloc] init];
    MainViewController *home2Main = [[MainViewController alloc] initWithRootViewController:near];
    
    //达人
    SuperViewController *superview = [[SuperViewController alloc] init];
    MainViewController *home3Main = [[MainViewController alloc] initWithRootViewController:superview];
    
    //联系人
    ConnectViewController *connect = [[ConnectViewController alloc] init];
    MainViewController *home4Main = [[MainViewController alloc] initWithRootViewController:connect];
    
    //我的
    SettingViewController *home5 = [[SettingViewController alloc] init];
    MainViewController *home5Main = [[MainViewController alloc] initWithRootViewController:home5];
    
    self.viewControllers = [NSArray arrayWithObjects:homeMain,home2Main,home3Main,home4Main,home5Main, nil];
    
}

- (void)tabBar:(UIButton *)btn itemArr:(NSArray *)itemArr {
    self.selectedIndex = btn.tag;
}

-(UINavigationController*) viewControllerWithTitle:(NSString*) title image:(UIImage*)image
{
    UIViewController* viewController = [[UIViewController alloc] init];
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
    viewController.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    return nav;
}

@end
