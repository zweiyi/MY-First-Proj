//
//  ViewC3.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewC3.h"
#import "ZWYTableViewCell.h"
#import "ViewC6.h"

static NSString *zCell = @"ZWYCell";

@interface ViewC3 () /*{
    NSMutableDictionary *_dic;//创建一个字典进行判断收缩还是展开
    NSArray *_sectionArr;//分组的名字
    NSArray *_sectionIArr;//图像
}*/


@end

@implementation ViewC3


- (void)viewDidLoad {
    
    self.title = @"我的音乐";
    UIImage *image = [UIImage imageNamed:@"我的.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil tag:101];
    tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed:@"a3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 414, 600) style:UITableViewStylePlain];
   // self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //注册
    [_tableView registerClass:[ZWYTableViewCell class] forCellReuseIdentifier:zCell];
    
    /*_dic = [NSMutableDictionary dictionary];
    _sectionArr = @[@"", @"", @"我创建的歌单", @"我收藏的歌单"];
    _sectionIArr = @[@"", @"", @"展开.png", @"收缩.png"];*/
    _array = [[NSMutableArray alloc] init];
    NSArray *arraySmall = @[@""];
    NSArray *arraySmall1 = @[@"本地音乐",@"最近播放", @"我的电台", @"我的收藏"];
    NSArray *arraySmall2 = @[@"我喜欢的音乐", @"纯音乐"];
    NSArray *arraySmall3 = @[@"神奇的音乐",@"乐队篇：夏日独有的热烈与温柔",@"[日] 前奏+开口 = 入坑"];
    
    
    [_array addObject:arraySmall];
    [_array addObject:arraySmall1];
    [_array addObject:arraySmall2];
    [_array addObject:arraySmall3];
    
    
    UIImage *yunImage = [UIImage imageNamed:@"云朵.png"];
    UIBarButtonItem *yunBtnItem = [[UIBarButtonItem alloc] initWithImage:yunImage style:UIBarButtonItemStylePlain target:self action:@selector(pressBtnItem)];
    self.navigationItem.leftBarButtonItem = yunBtnItem;
    
    UIImage *lineImage = [UIImage imageNamed:@"三竖线2.0.png"];
    UIBarButtonItem *linBtnItem = [[UIBarButtonItem alloc] initWithImage:lineImage style:UIBarButtonItemStylePlain target:self action:@selector(pressBtnItem)];
   self.navigationItem.rightBarButtonItem = linBtnItem;
    
}


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

/*- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2 || section == 3) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, view.frame.size.height)];
        titleLab.userInteractionEnabled = true;
        titleLab.text = _sectionArr[section];
        [view addSubview:titleLab];
        UIImageView *imageVi = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_sectionIArr[section]]];
        imageVi.frame = CGRectMake(0, 0, 15, 15);
        [view addSubview:imageVi];
        
        //创建一个button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setImage: [UIImage imageNamed: @"展开.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"收缩.png"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(action_btn:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(0, 0, 15, 15);
        [view addSubview:btn];
        
        return view;
        
    } else {
        return nil;
    }
}

-(void)action_btn : (UIButton *) btn {
    NSString *str = [NSString stringWithFormat:@"%ld", btn.tag - 300];
    if ([_dic[str] integerValue] == 0) {
        [_dic setObject:@"1" forKey:str];
    } else {
        [_dic setObject:@"0" forKey:str];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:[str integerValue]] withRowAnimation:UITableViewRowAnimationFade];
}*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    ZWYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:zCell forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    
    /*cell.selectedBackgroundView = [[UIView alloc] init];
    cell.multipleSelectionBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.multipleSelectionBackgroundView.backgroundColor = [UIColor clearColor];*/
    
    if (indexPath.section == 0) {
        
        cell.scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * 1.2, 100);
        
        cell.scrollView.pagingEnabled = NO;
        NSArray *arraysmall = @[@"私人FM", @"最新电音", @"Sati空间", @"私藏推荐", @"亲子频道"];
        
        for (int i = 0; i < 5; i++) {
            NSString *str = [NSString stringWithFormat:@"%d.png", i + 1];
        
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
            [cell.arrarImageView addObject:imageView];
            imageView.frame = CGRectMake(100 * i + 10, 10, 40, 40);
            [cell.scrollView addSubview:cell.arrarImageView[i]];
            UILabel *label = [[UILabel alloc] init];
            label.text = [arraysmall objectAtIndex:i];
            label.font = [UIFont systemFontOfSize:12];
            label.frame = CGRectMake(100 * i + 10, 70, 80, 10);
            [cell.arrarLabel addObject:label];
            [cell.scrollView addSubview:cell.arrarLabel[i]];
        }
        
        
    } else {
       
     
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
            
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
            
            
            NSArray *imageName = @[@"心动.png", @"7.jpg", ];
            cell.imageView.image = [UIImage imageNamed:imageName[indexPath.row]];
        } else {
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
            NSArray *imageName = @[@"1.jpg", @"8.jpg", @"9.jpg"];
            cell.imageView.image = [UIImage imageNamed: imageName[indexPath.row]];
        }
       
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 100;
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


-(void)pressBtnItem {
    ViewC6 *vc = [[ViewC6 alloc] init];
    
    [self.navigationController pushViewController:vc animated:NO];
    
}


- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
