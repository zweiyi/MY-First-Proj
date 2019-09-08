//
//  MmoentsViewController.m
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "MmoentsViewController.h"
#import "MomentsTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface MmoentsViewController ()

@end

@implementation MmoentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MomentsTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = @[@"陌上花开", @"鳞潜羽翔", @"你好", @"花店不开了，花继续开"];
    
    UIView *headView = [[UIView alloc] init];
    headView.frame = CGRectMake(0, 0, 414, 300);
    headView.backgroundColor = [UIColor blackColor];
    
    _tableView.tableHeaderView = headView;
    _tableView.sectionHeaderHeight = 10;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MomentsTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.photoImageView.image = [UIImage imageNamed:@"非正4.jpg"];
    cell.nameLabel.text =_dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
@end
