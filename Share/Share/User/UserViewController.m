//
//  UserViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "UserViewController.h"
#import "UserTableViewCell.h"
#import "UserTableViewCell2.h"
#import "UpViewController.h"
#import "MessageViewController.h"
#import "ReViewController.h"
#import "SetViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *user1Image = [UIImage imageNamed:@"5_normal.png"];
    UIImage *user2Image = [UIImage imageNamed:@"5_pressed.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [user1Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [user2Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    self.navigationItem.title = @"个人信息";
    //self.navigationItem.backBarButtonItem.title = @"nihao";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:@"userCell1"];
    [_tableView registerClass:[UserTableViewCell2 class] forCellReuseIdentifier:@"userCell2"];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _dataArray = @[@[@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出"], @[@"img2.png", @"img4.png", @"button_zan.png", @"img5.png", @"img6.png", @"img7.png"]];
    _buttonImage = [UIImage imageNamed:@"img3.png"];
    
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UserTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"userCell1" forIndexPath:indexPath];
        cell.nameLabel.text = @"share小白";
        cell.workLabel.text = @"数媒/设计爱好者";
        cell.noteLabel.text = @"开心了就笑，不开心了就过会儿再笑";
        cell.headImageView.image = [UIImage imageNamed:@"sixin_img1.png"];
        return cell;
    } else {
        UserTableViewCell2 *cell = [_tableView dequeueReusableCellWithIdentifier:@"userCell2" forIndexPath:indexPath];
        cell.nameLable.text = _dataArray[0][indexPath.row];
        cell.littleimageView.image = [UIImage imageNamed:_dataArray[1][indexPath.row]];
        [cell.littlebutton setImage:_buttonImage forState:UIControlStateNormal];
        [cell.littlebutton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.littlebutton.tag = indexPath.row;
        
        return cell;
        
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 130;
    } else {
        return 60;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return @" ";
    } else {
        return @"";
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    if (indexPath.row == 0 && indexPath.section == 1) {
        bBarButtonItem.title = @"我上传的";
        UpViewController *upViewController = [[UpViewController alloc] init];
        [self.navigationController pushViewController:upViewController animated:NO];
    } else if (indexPath.row == 1) {
        bBarButtonItem.title = @"我的信息";
        MessageViewController *meViewController = [[MessageViewController alloc] init];
        [self.navigationController pushViewController:meViewController animated:NO];
    } else if (indexPath.row == 2) {
        bBarButtonItem.title = @"我推荐的";
        ReViewController *reViewController = [[ReViewController alloc] init];
        [self.navigationController pushViewController:reViewController animated:NO];
    } else if (indexPath.row == 4) {
         bBarButtonItem.title = @"设置";
        SetViewController *setViewController = [[SetViewController alloc] init];
        [self.navigationController pushViewController:setViewController animated:NO];
    } else {
        ;
    }
}

-(void)pressButton:(UIButton *)btn {
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    if (btn.tag == 0) {
        bBarButtonItem.title = @"我上传的";
        UpViewController *upViewController = [[UpViewController alloc] init];
        [self.navigationController pushViewController:upViewController animated:NO];
    } else if (btn.tag == 1) {
        bBarButtonItem.title = @"我的信息";
        MessageViewController *meViewController = [[MessageViewController alloc] init];
        [self.navigationController pushViewController:meViewController animated:NO];
    } else if (btn.tag == 2) {
        bBarButtonItem.title = @"我推荐的";
        ReViewController *reViewController = [[ReViewController alloc] init];
        [self.navigationController pushViewController:reViewController animated:NO];
    } else if (btn.tag == 4) {
        bBarButtonItem.title = @"设置";
        SetViewController *setViewController = [[SetViewController alloc] init];
        [self.navigationController pushViewController:setViewController animated:NO];
    } else {
        ;
    }
}
- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
}
@end
