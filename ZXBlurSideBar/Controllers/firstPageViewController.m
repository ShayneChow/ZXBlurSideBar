//
//  firstPageViewController.m
//  StartUpDemo
//
//  Created by ChowShayne on 15/3/9.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "firstPageViewController.h"
#import "SideBarViewController.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height		// 屏幕高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width		// 屏幕宽度


@interface firstPageViewController ()

@property (nonatomic, strong) SideBarViewController *sideBarView;

@end

@implementation firstPageViewController

#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Blog";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航栏的按钮
    UIView *menuButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    UIImageView *menuButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    menuButtonImageView.image = [UIImage imageNamed:@"menu.png"];
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
    menuButton.backgroundColor = [UIColor clearColor];
    [menuButton addTarget:self action:@selector(showHideSidebar) forControlEvents:UIControlEventTouchUpInside];
    [menuButtonView addSubview:menuButtonImageView];
    [menuButtonView addSubview:menuButton];
    UIBarButtonItem *menuButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButtonView];
    self.navigationItem.leftBarButtonItem = menuButtonItem;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    bgImageView.image = [UIImage imageNamed:@"bgimage.png"];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:bgImageView];
    
    // 左侧边栏开始
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [panGesture delaysTouchesBegan];
    [self.view addGestureRecognizer:panGesture];
    
    self.sideBarView = [[SideBarViewController alloc] init];
//    [self.sideBarView setBgRGB:0x000000];
    [self.view addSubview:self.sideBarView.view];
    self.sideBarView.view.frame  = self.view.bounds;
    // 左侧边栏结束
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showHideSidebar{
    NSLog(@"打开侧滑菜单栏。");
    [self.sideBarView showHideSidebar];
}

- (void)panDetected:(UIPanGestureRecognizer*)recoginzer
{
    [self.sideBarView panDetected:recoginzer];
}

@end
