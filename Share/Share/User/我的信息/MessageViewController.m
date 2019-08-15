//
//  MessageViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "MessageViewController.h"
#import "UserTableViewCell3.h"
#import "FollowViewController.h"
#import "SixinViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [_tableView registerClass:[UserTableViewCell3 class] forCellReuseIdentifier:@"meCell"];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    _dataArray = @[@[@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知"], @[@"7", @"9", @"5", @"4", @"1"]];
    _buttonImage = [UIImage imageNamed:@"img3.png"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell3 *cell = [_tableView dequeueReusableCellWithIdentifier:@"meCell" forIndexPath:indexPath];
    cell.nameLable.text = _dataArray[0][indexPath.row];
    [cell.littlebutton setImage:_buttonImage forState:UIControlStateNormal];
    cell.littlebutton.tag = indexPath.row;
    [cell.littlebutton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.littlebutton.tag = 100+indexPath.row;
    cell.rightLabel.text = _dataArray[1][indexPath.row];
    cell.rightLabel.textColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    if (indexPath.row == 2) {
        bBarButtonItem.title = @"新关注的";
        FollowViewController *followViewController = [[FollowViewController alloc] init];
        [self.navigationController pushViewController:followViewController animated:NO];
    }
    
    if (indexPath.row == 3) {
        bBarButtonItem.title = @"私信";
        SixinViewController *sixinViewController = [[SixinViewController alloc] init];
        [self.navigationController pushViewController:sixinViewController animated:NO];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

-(void)pressButton: (UIButton *)btn{
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    if (btn.tag  == 102) {
        bBarButtonItem.title = @"新关注的";
        FollowViewController *followViewController = [[FollowViewController alloc] init];
        [self.navigationController pushViewController:followViewController animated:NO];
    }
    if (btn.tag == 103) {
        bBarButtonItem.title = @"私信";
        SixinViewController *sixinViewController = [[SixinViewController alloc] init];
        [self.navigationController pushViewController:sixinViewController animated:NO];
    }
}
@end
