//
//  AllMessageViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "AllMessageViewController.h"
#import "StudentAllTableViewCell.h"

@interface AllMessageViewController ()

@end

@implementation AllMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景all.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    UIImageView *headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"非正毕业.jpeg"]];
    headImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = headImageView;
    _tableView.backgroundColor = [UIColor clearColor];
    
    [_tableView registerClass:[StudentAllTableViewCell class] forCellReuseIdentifier:@"studentCell"];
    [self.view addSubview:_tableView];
    _tableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0);
    _tableView.tableFooterView = [[UIView alloc] init];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentAllTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    [cell getMessage:_studentAllArray andIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _studentAllArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
