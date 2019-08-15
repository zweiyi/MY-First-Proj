//
//  SetViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableViewCell.h"
#import "BasicViewController.h"
#import "ReviseViewController.h"
#import "NewViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 380) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"setCell"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    _dataArray = @[@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SetTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"setCell" forIndexPath:indexPath];
    cell.nameLable.text = _dataArray[indexPath.row];
    [cell.littlebutton setImage:[UIImage imageNamed:@"img3.png"] forState:UIControlStateNormal];
    [cell.littlebutton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.littlebutton.tag = 100 + indexPath.row;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    if (indexPath.row == 0) {
        bBarButtonItem.title = @"基本资料";
        BasicViewController *basicViewController = [[BasicViewController alloc] init];
        [self.navigationController pushViewController:basicViewController animated:NO];
    }
    if (indexPath.row == 1) {
        bBarButtonItem.title = @"修改密码";
        ReviseViewController *reviseViewController = [[ReviseViewController alloc] init];
        [self.navigationController pushViewController:reviseViewController animated:NO];
    }
    if (indexPath.row == 2) {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提交成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//        [self presentViewController:alert animated:NO completion:nil];
        bBarButtonItem.title = @"消息设置";
        NewViewController *reviseViewController = [[NewViewController alloc] init];
        [self.navigationController pushViewController:reviseViewController animated:NO];
    } if (indexPath.row == 4) {
        [self showAlert];
    }
}

-(void)showAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"缓存已清除" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:NO completion:nil];
    [self performSelector:@selector(disAlert:) withObject:alert afterDelay:3];
}

-(void)disAlert : (UIAlertController *) alert {
    [alert dismissViewControllerAnimated:YES completion:nil];
   
}

-(void)pressButton: (UIButton *)btn {
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    if (btn.tag == 100) {
        bBarButtonItem.title = @"基本资料";
        BasicViewController *basicViewController = [[BasicViewController alloc] init];
        [self.navigationController pushViewController:basicViewController animated:NO];
    }
    if (btn.tag == 101) {
        bBarButtonItem.title = @"修改密码";
        ReviseViewController *reviseViewController = [[ReviseViewController alloc] init];
        [self.navigationController pushViewController:reviseViewController animated:NO];
    }
    if (btn.tag == 102) {
        //        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提交成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        //        [self presentViewController:alert animated:NO completion:nil];
        bBarButtonItem.title = @"消息设置";
        NewViewController *reviseViewController = [[NewViewController alloc] init];
        [self.navigationController pushViewController:reviseViewController animated:NO];
    }
    if (btn.tag == 104) {
        [self showAlert];
    }
}
@end
