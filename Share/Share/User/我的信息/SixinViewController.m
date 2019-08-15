//
//  SixinViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SixinViewController.h"
#import "SxinTableViewCell.h"
#import "TalkViewController.h"

@interface SixinViewController ()

@end

@implementation SixinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [_tableView registerClass:[SxinTableViewCell class] forCellReuseIdentifier:@"sixinCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_tableView];
    
    _dataArray = @[@[@"share小格", @"share小兰", @"share小明", @"share小雪"], @[@"你的作品我很喜欢!!!", @"谢谢，已关注你", @"为你点赞", @"你好可以问问你是怎么拍的吗?"],@[@"11-03 19:30", @"11-09 23:02", @"11-10 5:08", @"11-11 19:45"], @[@"guanzhu_img6.png", @"guanzhu_img5.png", @"sixin_img1.png", @"sixin_img2.png"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SxinTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"sixinCell" forIndexPath:indexPath];
    cell.nameLabel.text = _dataArray[0][indexPath.row];
    cell.noteLabel.text = _dataArray[1][indexPath.row];
    cell.timeLabel.text = _dataArray[2][indexPath.row];
    cell.littleimageView.image = [UIImage imageNamed:_dataArray[3][indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    if (indexPath.row == 3) {
        
        
        
        UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
        bBarButtonItem.tintColor = [UIColor whiteColor];
        self.navigationItem.backBarButtonItem = bBarButtonItem;
        [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
        TalkViewController *talkViewController = [[TalkViewController alloc] init];
        
        [self.navigationController pushViewController:talkViewController animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
}


@end
