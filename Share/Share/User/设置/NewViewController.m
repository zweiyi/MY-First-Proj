//
//  NewViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "NewViewController.h"
#import "SetTableViewCell.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"newsCell"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _dataArray = @[@"接受新消息通知", @"通知显示栏", @"声音", @"振动", @"关注更新"];
    
    _image1 = [UIImage imageNamed:@"my_button_normal.png"];
    _image2 = [UIImage imageNamed:@"my_button_pressed.png"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SetTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    cell.nameLable.text = _dataArray[indexPath.row];
    
    [cell.littlebutton setImage:_image1 forState:UIControlStateNormal];
//    cell.littlebutton.selected = YES;
    [cell.littlebutton addTarget:self action:@selector(pressDown :) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(void)pressDown : (UIButton *)btn {
    if (btn.selected == YES) {
        [btn setImage:_image2 forState:UIControlStateNormal];
        btn.selected = NO;
    } else {
        [btn setImage:_image1 forState:UIControlStateNormal];
        btn.selected = YES;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
