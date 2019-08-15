//
//  FindResultViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FindResultViewController.h"
#import "StudentAllTableViewCell.h"

@interface FindResultViewController ()

@end

@implementation FindResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景all.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2 - 100) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[StudentAllTableViewCell class] forCellReuseIdentifier:@"findCell"];
    
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    UIImageView *headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"非正12.jpg"]];
    headImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:headImageView];
//    _tableView.tableHeaderView = headImageView;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(200, [UIScreen mainScreen].bounds.size.height - 200, 60, 30);
    [self.view addSubview:backButton];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentAllTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"findCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell getMessage:_studentFindArray andIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _studentFindArray.count;
}

-(void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
