//
//  SideBarViewController.m
//  ZXBlurSideBar
//
//  Created by ChowShayne on 15/5/25.
//  Copyright (c) 2015年 微加科技. All rights reserved.
//

#import "SideBarViewController.h"
#import "MenuDetailViewController.h"

@interface SideBarViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *menuTableView;

@end

@implementation SideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.menuTableView = [[UITableView alloc] initWithFrame:self.contentView.bounds];
    [self.menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.menuTableView.backgroundColor = [UIColor clearColor];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    [self.contentView addSubview:self.menuTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *sidebarMenuCellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sidebarMenuCellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sidebarMenuCellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"侧滑菜单%ld", (long)indexPath.row+1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MenuDetailViewController *viewController = nil;
    id next = [self nextResponder];
    while(![next isKindOfClass:[MenuDetailViewController class]])//这里跳不出来。。。
    {
        next = [next nextResponder];
    }
    if ([next isKindOfClass:[MenuDetailViewController class]])
    {
        viewController = (MenuDetailViewController *)next;
    }
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:viewController animated:YES];
            viewController.view.backgroundColor = [UIColor blueColor];
            break;
        case 1:
            [self.navigationController pushViewController:viewController animated:YES];
            viewController.view.backgroundColor = [UIColor redColor];
            break;
        case 2:
            [self.navigationController pushViewController:viewController animated:YES];
            viewController.view.backgroundColor = [UIColor greenColor];
            break;
        default:
            break;
    }
    
    [self showHideSidebar];
    
}

@end
