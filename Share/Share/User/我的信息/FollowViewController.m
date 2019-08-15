//
//  FollowViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FollowViewController.h"
#import "FollowTableViewCell.h"

@interface FollowViewController ()

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[FollowTableViewCell class] forCellReuseIdentifier:@"followCell"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_tableView];
    
    _dataArray = @[@[@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌", @"shareLity"],@[ @"guanzhu_img6.png", @"guanzhu_img5.png", @"sixin_img1.png", @"sixin_img2.png", @"sixin_img3.png", @"sixin_img4.png" ]];
    _followImage = [UIImage imageNamed:@"guanzhu_normal.png"];
    _followedImage = [UIImage imageNamed:@"guanzhu_pressed.png"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FollowTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"followCell" forIndexPath:indexPath];
    cell.nameLable.text = _dataArray[0][indexPath.row];
    cell.littleimageView.image = [UIImage imageNamed:_dataArray[1][indexPath.row]];
    [cell.littlebutton setImage:_followImage forState:UIControlStateNormal];
    [cell.littlebutton addTarget:self action:@selector(pressFollow :) forControlEvents:UIControlEventTouchUpInside];
    cell.littlebutton.selected = YES;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(void)pressFollow : (UIButton *) btn {
    if (btn.selected == YES) {
       
        [btn setImage:_followedImage forState:UIControlStateNormal];
        btn.selected = NO;
    } else {
        
        [btn setImage:_followImage forState:UIControlStateNormal];
        btn.selected = YES;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
