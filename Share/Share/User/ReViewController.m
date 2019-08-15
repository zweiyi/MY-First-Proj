//
//  ReViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ReViewController.h"
#import "ZWYTableViewCell4.h"
#import "ZWYTableViewCell5.h"
#import "ZWYTableViewCell1.h"


@interface ReViewController ()

@end

@implementation ReViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[ZWYTableViewCell1 class] forCellReuseIdentifier:@"reCell1"];
    [_tableView registerClass:[ZWYTableViewCell4 class] forCellReuseIdentifier:@"reCell4"];
    [_tableView registerClass:[ZWYTableViewCell5 class] forCellReuseIdentifier:@"reCell5"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    _dataArray = @[@[@"匆匆那年", @"国外画册欣赏", @"collection扁平设计", @"字体故事", @"版本整理术：高效解决多风格要求"], @[@"share小白", @"share小王", @"share小吕", @"share小律", @"share小五"], @[@"原创-摄影-联系习作10分钟前", @"平面设计-图册设计16分钟前", @"平面设计-海报设计17分钟前", @"设计文章-经验-设计45分钟前", @"版本设计-版本整理45分钟前"], @[@"list_img1", @"list_img2.png", @"list_img3.png", @"note_img3.png", @"list_img4.png"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 3) {
        ZWYTableViewCell1 *cell = [_tableView dequeueReusableCellWithIdentifier:@"reCell1" forIndexPath:indexPath];
        
        cell.nameLabel.text = _dataArray[0][indexPath.section];
        cell.noteLabel.text = _dataArray[2][indexPath.section];
        cell.authorLabel.text = _dataArray[1][indexPath.section];
        cell.leftImageView.image = [UIImage imageNamed:_dataArray[3][indexPath.section]];
//        cell.likeLabel.text = @"103";
        return cell;
    } else if (indexPath.section == 1 || indexPath.section == 2) {
        ZWYTableViewCell4 *cell = [_tableView dequeueReusableCellWithIdentifier:@"reCell4" forIndexPath:indexPath];
        cell.nameLabel.text = _dataArray[0][indexPath.section];
        cell.noteLabel.text = _dataArray[2][indexPath.section];
        cell.authorLabel.text = _dataArray[1][indexPath.section];
        cell.leftImageView.image = [UIImage imageNamed:_dataArray[3][indexPath.section]];
//        cell.likeLabel.text = @"45";
        return cell;
    } else {
        ZWYTableViewCell5 *cell = [_tableView dequeueReusableCellWithIdentifier:@"reCell5" forIndexPath:indexPath];
        cell.nameLabel.text = _dataArray[0][indexPath.section];
        cell.noteLabel.text = _dataArray[2][indexPath.section];
        cell.authorLabel.text = _dataArray[1][indexPath.section];
        cell.leftImageView.image = [UIImage imageNamed:_dataArray[3][indexPath.section]];
//        cell.likeLabel.text = @"56";
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"";
    } else {
        return @" ";
    }
}

@end
