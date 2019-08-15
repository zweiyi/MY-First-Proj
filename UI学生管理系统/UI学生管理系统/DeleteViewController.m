//
//  DeleteViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "DeleteViewController.h"
#import "StudentAllTableViewCell.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景all.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2 - 100) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[StudentAllTableViewCell class] forCellReuseIdentifier:@"deleteCell"];
    
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(77, [UIScreen mainScreen].bounds.size.height / 2 - 100, 260, 40);
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.tintColor = [UIColor whiteColor];
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _nameTextField.delegate = self;
    [self.view addSubview:_nameTextField];
    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    finishButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(finishDelete) forControlEvents:UIControlEventTouchUpInside];
    finishButton.frame = CGRectMake(120, 400, 60, 30);
    [self.view addSubview:finishButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(240, 400, 60, 30);
    [self.view addSubview:backButton];
    
    _deleteStudent = [[Student alloc]init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentAllTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"deleteCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell getMessage:_studentArray andIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _studentArray.count;
}

-(void)finishDelete {
    BOOL ishave = NO;
    for (Student *stu in _studentArray) {
        if ([_nameTextField.text isEqualToString:stu.NameString]) {
            ishave = YES;
            _deleteStudent = stu;
            break;
        }
    }
    if (!ishave) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"该同学不存在" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sureAlertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请确认是否删除该信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        DeleteViewController __weak *weakSelf = self;
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            [weakSelf.studentArray removeObject:weakSelf.deleteStudent];
            [weakSelf.tableView reloadData];
        }];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:sureAlertAction];
        [alertController addAction:cancleAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameTextField resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
