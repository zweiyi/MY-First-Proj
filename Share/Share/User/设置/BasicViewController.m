//
//  BasicViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "BasicViewController.h"
#import "BasicTouTableViewCell.h"
#import "BasicMessTableViewCell.h"
#import "BasicSexTableViewCell.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [_tableView registerClass:[BasicTouTableViewCell class] forCellReuseIdentifier:@"touBCell"];
    [_tableView registerClass:[BasicMessTableViewCell class] forCellReuseIdentifier:@"messBCell"];
    [_tableView registerClass:[BasicSexTableViewCell class] forCellReuseIdentifier:@"sexBCell"];
    //[_tableView registerClass:[BasicMessTableViewCell class] forCellReuseIdentifier:@"messB1Cell"];
    
    
    _dataArray = @[@[@"", @"昵称",@"签名", @"", @"邮箱"], @[@"", @"share小白",@"开心了就笑，不开心了就过会再笑",@"", @"186######3@qq.com"]];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        BasicTouTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"touBCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 3) {
        BasicSexTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"sexBCell" forIndexPath:indexPath];
        
        return cell;
        
    } else {
        BasicMessTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"messBCell" forIndexPath:indexPath];
            cell.nameLabel.text = _dataArray[0][indexPath.row];
            cell.noteLabel.text = _dataArray[1][indexPath.row];
       
        return cell;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 ) {
        return 90;
    } else {
        return 60;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
