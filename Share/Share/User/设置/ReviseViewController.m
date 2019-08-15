//
//  ReviseViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ReviseViewController.h"
#import "ReviseTableViewCell.h"

@interface ReviseViewController ()

@end

@implementation ReviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[ReviseTableViewCell class] forCellReuseIdentifier:@"reviseCell"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    _dataArray = @[@[@"旧密码", @"新密码", @"确认密码"], @[@"6-20英文或数字结合", @"6-20英文或数字结合", @"请再次输入确认密码"]];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_button setTitle:@"提交" forState:UIControlStateNormal];
    _button.tintColor = [UIColor whiteColor];
    _button.frame = CGRectMake(150, 320, 100, 30);
    _button.backgroundColor = [UIColor grayColor];
    [_button addTarget:self action:@selector(pressDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReviseTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"reviseCell" forIndexPath:indexPath];
    cell.nameLabel.text = _dataArray[0][indexPath.row];
    cell.noteTextField.placeholder = _dataArray[1][indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)pressDown {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提交成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:sureAlertAction];
    [self presentViewController:alert animated:NO completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
