//
//  ViewController.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/25.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "ZWYTableViewCell.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 414, 600) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //注册
    [_tableView registerClass:[ZWYTableViewCell class] forCellReuseIdentifier:zCell];
    
    _array = [[NSMutableArray alloc] init];
    NSArray *arraySmall = @[@""];
    NSArray *arraySmall1 = @[@"本地音乐",@"最近播放", @"我的电台", @"我的收藏"];
    NSArray *arraySmall2 = @[@"我喜欢的音乐", @"纯音乐"];
    NSArray *arraySmall3 = @[@"神奇的音乐",@"乐队篇：夏日独有的热烈与温柔",@"[日] 前奏+开口 = 入坑"];
    
    
    [_array addObject:arraySmall];
    [_array addObject:arraySmall1];
    [_array addObject:arraySmall2];
    [_array addObject:arraySmall3];
    
    
    UILabel *headLabel = [[UILabel alloc] init];
    headLabel.text = @"我的音乐";
    headLabel.textAlignment = NSTextAlignmentCenter;
    headLabel.frame = CGRectMake(0, 0, 414, 90);
    headLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headLabel];
    
    UIImage *yunImage = [UIImage imageNamed:@"云朵.png"];
    UIImageView *yunImageView = [[UIImageView alloc] init];
    yunImageView.image = yunImage;
    yunImageView.frame = CGRectMake(30, 35, 30, 30);
    [self.view addSubview:yunImageView];
    
    UIImage *lineImage = [UIImage imageNamed:@"三竖线2.0.png"];
    UIButton *linBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [linBtn setImage:lineImage forState:UIControlStateNormal];
    linBtn.frame =CGRectMake(354, 30, 30, 30);
    [linBtn addTarget:self action:@selector(pressLineBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:linBtn];*/
    
    /*for (int i = 0; i < 0; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }*/
}

/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return [[_array objectAtIndex:section] count];
    }
}

//设置分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:zCell];
    if (indexPath.section == 0) {
        
        cell.scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * 2, 100);
        
        cell.scrollView.pagingEnabled = NO;
        NSArray *arraysmall = @[@"私人FM", @"最新电音", @"Sati空间", @"私藏推荐", @"亲子频道"];
        for (int i = 0; i < 5; i++) {
            NSString *str = [NSString stringWithFormat:@"%d.png", i + 1];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
            imageView.frame = CGRectMake(100 * i + 10, 10, 40, 40);
            
            UILabel *label = [[UILabel alloc] init];
            label.text = [arraysmall objectAtIndex:i];
            label.font = [UIFont systemFontOfSize:12];
            label.frame = CGRectMake(100 * i + 10, 70, 80, 10);
            [cell.scrollView addSubview:imageView];
            [cell.scrollView addSubview:label];
        }
        return cell;
        
    } else {
       // ZWYTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:zCell forIndexPath:indexPath];
        
        cell.nameLable.text = [_array objectAtIndex:indexPath.section][indexPath.row];
        
        
        NSArray *arrayDl = @[@"0",@"100",@"0",@"50"];
        if (indexPath.section == 1) {
            cell.detileLable1.text = arrayDl[indexPath.row];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.section == 1) {
            NSArray *imageName = @[@"音符.png",@"播放.png",@"音乐.png",@"收藏.png"];
            cell.imageView.image = [UIImage imageNamed:imageName[indexPath.row]];
        }else if (indexPath.section == 2) {
            NSArray *imageName = @[@"心动.png", @"7.jpg", ];
            cell.imageView.image = [UIImage imageNamed:imageName[indexPath.row]];
        } else {
            NSArray *imageName = @[@"1.jpg", @"8.jpg", @"9.jpg"];
            cell.imageView.image = [UIImage imageNamed: imageName[indexPath.row]];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 120;
    } else {
        return 55;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return @"我创建的歌单";
    } else if(section == 3){
        return @"我收藏的歌单";
    } else {
        return @"";
    }
}

-(void)pressLineBtn {
    NSLog(@"linBtn down");
}*/
@end
