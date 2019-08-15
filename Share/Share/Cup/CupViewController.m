//
//  CupViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "CupViewController.h"
#import "HuodongTableViewCell.h"

@interface CupViewController ()

@end

@implementation CupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *cup1Image = [UIImage imageNamed:@"4_normal.png"];
    UIImage *cup2Image = [UIImage imageNamed:@"4_pressed.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [cup1Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [cup2Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    self.navigationItem.title = @"活动";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[HuodongTableViewCell class] forCellReuseIdentifier:@"huoCell"];
   
    [self.view addSubview:_tableView];
    
    _imageNamearray = @[@"huodong2.jpg",@"huodong1.jpg", @"huodong3.jpg",];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HuodongTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"huoCell" forIndexPath:indexPath];
    cell.photoImageView.image = [UIImage imageNamed:_imageNamearray[indexPath.section]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
