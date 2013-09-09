//
//  MainViewController.m
//  WXWeibo
//
//  Created by wei.chen on 13-5-13.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "MainViewController.h"
#import "WXNavigationController.h"
#import "ThemeButton.h"
#import "ThemeImageView.h"
#import "ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化tabbar工具栏
    [self _initTabbarView];
    
    //创建子控制器
    ViewController *viewCtrl = [[ViewController alloc] init];
    WXNavigationController *navigation = [[WXNavigationController alloc] initWithRootViewController:viewCtrl];
    self.viewControllers = [NSArray arrayWithObjects:navigation, nil];
}

//创建自定义tabbar
- (void)_initTabbarView {
    //隐藏tabbar工具栏
    [self.tabBar setHidden:YES];
    
    _tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    ThemeImageView *backgroundImage = [[ThemeImageView alloc] initWithImageName:@"tabbar_background.png"];
    backgroundImage.frame = _tabbarView.bounds;
    [_tabbarView addSubview:backgroundImage];
    [self.view addSubview:_tabbarView];
    
    
    NSArray *backgroud = @[@"tabbar_home.png",@"tabbar_message_center.png",@"tabbar_profile.png",@"tabbar_discover.png",@"tabbar_more.png"];
    NSArray *backgroudHiglight = @[@"tabbar_home_highlighted.png",@"tabbar_message_center_highlighted.png",@"tabbar_profile_highlighted.png",@"tabbar_discover_highlighted.png",@"tabbar_more_highlighted.png"];
    for (int i=0; i<backgroud.count; i++) {
        NSString *backImage = backgroud[i];
        NSString *higlightImage = backgroudHiglight[i];
        ThemeButton *button = [[ThemeButton alloc] initWithImage:backImage
                                                     highlighted:higlightImage];
        button.showsTouchWhenHighlighted = YES;
        float itemWidth = ScreenWidth/5;
        button.frame = CGRectMake((itemWidth-30)/2+(i*itemWidth), (49-30)/2, 30, 30);
        button.tag = i;
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
        
    }
    
}

- (void)selectedTab:(UIButton *)button {
    self.selectedIndex = button.tag;
}


@end
