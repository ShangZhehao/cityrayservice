//
//  MainViewController.m
//  platform
//
//  Created by shangzh on 15/9/24.
//  Copyright (c) 2015年 shangzh. All rights reserved.
//

#import "MainViewController.h"
#import "UIBarButtonItem+Manager.h"

#import "Constants.h"

@interface MainViewController () <UINavigationControllerDelegate>

@property (nonatomic,strong) id navDelegate;

@end

@implementation MainViewController

- (void)viewDidLoad {
    UINavigationBar *naviga = [UINavigationBar appearanceWhenContainedIn:[self class], nil];

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    dict[NSForegroundColorAttributeName] = kUIColorFromRGB(0x333333);
    [naviga setTitleTextAttributes:dict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:YES];
    if (self.viewControllers.count != 1) {  //非根控制器
        UIBarButtonItem *left = [UIBarButtonItem barbuttonItemWithFrame:CGRectMake(0, 0, 24, 24) BackImage:[UIImage imageNamed:@"icon_back"] target:self action:@selector(back)];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -12;
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,left];
        viewController.tabBarController.tabBar.hidden = YES;
    }
}

//导航控制器跳转完成
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //如果是跳转到根控制器
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = _navDelegate;
    } else {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)back {
    [self popViewControllerAnimated:YES];
    if (self.viewControllers.count == 1) {  //根控制器
        self.tabBarController.tabBar.hidden = NO;
    }
}

@end
