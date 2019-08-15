//
//  TheThirdViewController.m
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "TheThirdViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"

@interface TheThirdViewController ()

@end

@implementation TheThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"朋友圈";
    UIImage *photoImage = [UIImage imageNamed:@"照片.png"];
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] init];
    [barButtonItem1 setImage:photoImage];
    self.navigationItem.rightBarButtonItem =barButtonItem1;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"Firstcell"];
    [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"Secondcell"];
    
    UIView *headView = [[UIView alloc] init];
    headView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"非正3.jpg"]];
    backImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 260);
    UIImageView *touImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1.png"]];
    touImageView.frame = CGRectMake(344, 230, 50, 50);
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"阡陌";
    nameLabel.frame = CGRectMake(300, 250, 40, 20);
    [headView addSubview:backImageView];
    [headView addSubview:touImageView];
    [headView addSubview:nameLabel];
    
    _tableView.tableHeaderView = headView;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.sectionFooterHeight = 0;
    _tableView.sectionHeaderHeight = 0;
    _tableView.tableFooterView = [[UIView alloc] init];
//    self.edgesForExtendedLayout = NO;
    _dataArray = @[@[@"Dylan",@"Thep", @"Emma", @"Tay", @"ZYL", @"GBY", @"sasha", @"HBB", @"XRW", @"TYH"], @[@"黔驴技穷", @"春风得意马蹄疾，一日看尽长安花", @"人生自古谁无死，留取丹心照汗青", @"桃花潭水深千尺，不及汪伦送我情", @"桃花依旧笑春风", @"莫使金樽空对月", @"大弦嘈嘈如急雨，小弦切切如私语", @"马嵬坡下泥土中，不见玉颜空死处",@"今已亭亭如盖",@"千树万树梨花开",], @[@"陕西西安",@"北京", @"苏州.博纳国际影城（丽风店）", @"杭州", @"天津",@"武汉", @"深圳", @"杭州.浙江大学", @"上海", @"日本.大阪"], @[@"昨天",@"前天", @"3天前", @"4天前", @"5天前",@"6天前", @"7天前", @"11天前", @"12天前", @"13天前"]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section % 2 == 0) {
        FirstTableViewCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:@"Firstcell" forIndexPath:indexPath];
        
        cell1.nameLabel.text = _dataArray[0][indexPath.section];
        
        cell1.touImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"非正%ld.jpg", (long)indexPath.section + 1]];
        
        cell1.noteLabel.text = _dataArray[1][indexPath.section];
        cell1.largeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"非正%ld.jpg", (long)indexPath.section + 1]];
        cell1.addLabel.text = _dataArray[2][indexPath.section];
        cell1.timeLabel.text = _dataArray[3][indexPath.section];
        return cell1;
    } else {
        SecondTableViewCell *cell2 = [_tableView dequeueReusableCellWithIdentifier:@"Secondcell" forIndexPath:indexPath];
        cell2.nameLabel.text = _dataArray[0][indexPath.section];
        
        cell2.touImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"非正%ld.jpg", (long)indexPath.section + 1]];
        
        cell2.noteLabel.text = _dataArray[1][indexPath.section];
        cell2.addLabel.text = _dataArray[2][indexPath.section];
        cell2.timeLabel.text = _dataArray[3][indexPath.section];
        cell2.leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"非正%ld.jpg", (long)indexPath.section + 1]];
        cell2.rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"非正%ld.jpg", (long)indexPath.section + 1]];
        
        return cell2;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2 == 0) {
        return 250;
    } else {
        return 210;
    }
}


@end
