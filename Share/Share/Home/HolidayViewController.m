//
//  HolidayViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "HolidayViewController.h"
#import "ZWYTableViewCell2.h"

static NSString *zcell = @"ZWYCell";

@interface HolidayViewController ()

@end

@implementation HolidayViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    self.navigationItem.title = @"SHARE";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [_tableView registerClass:[ZWYTableViewCell2 class] forCellReuseIdentifier:zcell];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWYTableViewCell2 *cell = [_tableView dequeueReusableCellWithIdentifier:zcell forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.touxiangImageView.image = [UIImage imageNamed:@"sixin_img1.png"];
        cell.nameLabel.text = @"假日";
        cell.authorLabel.text = @"share小白";
        cell.timeLabel.text = @"15分钟前";
//        cell.likeLabel.text = @"102";
        cell.eyeLabel.text = @"26";
        cell.shareLabel.text = @"20";
        [cell.likeButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        cell.eyeImageView.image = [UIImage imageNamed:@"button_guanzhu.png"];
        cell.shareImageView.image = [UIImage imageNamed:@"button_share.png"];
    } else if (indexPath.section == 1) {
        cell.noteLabel.text = @"多希望列车能把我带到有你的城市。";
        UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img1.png"]];
        [cell.imageViewArray addObject:imageView1];
        imageView1.frame = CGRectMake(10, 30, 390, 200);
        
        [cell.contentView addSubview:cell.imageViewArray[0]];
        UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img2.png"]];
        [cell.imageViewArray addObject:imageView2];
        imageView2.frame = CGRectMake(10, 240, 390, 200);
        [cell.contentView addSubview:cell.imageViewArray[1]];
        
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img3.png"]];
        [cell.imageViewArray addObject:imageView3];
        imageView3.frame = CGRectMake(80, 450, 254, 280);
        [cell.contentView addSubview:cell.imageViewArray[2]];
        
        UIImageView *imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img4.png"]];
        [cell.imageViewArray addObject:imageView4];
        imageView4.frame = CGRectMake(10, 740, 390, 250);
        [cell.contentView addSubview:cell.imageViewArray[3]];
        
        UIImageView *imageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img5.png"]];
        [cell.imageViewArray addObject:imageView5];
        imageView5.frame = CGRectMake(80, 1000, 254, 280);
        [cell.contentView addSubview:cell.imageViewArray[4]];
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 1340;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


@end
