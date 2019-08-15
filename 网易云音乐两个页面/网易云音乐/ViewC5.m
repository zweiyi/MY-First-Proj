//
//  ViewC5.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewC5.h"
#import "ZWYTableViewCell2.h"
#import "ViewC6.h"

static NSString *zCell = @"ZWYCell";

@interface ViewC5 ()

@end

@implementation ViewC5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"我的黑.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"账号" image:nil tag:101];
    tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed:@"a5.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 82, [UIScreen mainScreen].bounds.size.width, 600) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //注册
    [_tableView registerClass:[ZWYTableViewCell2 class] forCellReuseIdentifier:zCell];
    
    _array1 = @[@"口袋铃声",@"我的订单"];
    _array2 = @[@"设置",@"夜间模式",@"定时关闭",@"音乐闹钟"];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    UIImage *lineImage = [UIImage imageNamed:@"三竖线2.0.png"];
    UIBarButtonItem *linBtnItem = [[UIBarButtonItem alloc] initWithImage:lineImage style:UIBarButtonItemStylePlain target:self action:@selector(pressBtnItem)];
    self.navigationItem.leftBarButtonItem = linBtnItem;
    
    
    UIImage *image2 = [UIImage imageNamed:@"扫描.png"];
    UIBarButtonItem *image2BI = [[UIBarButtonItem alloc] initWithImage:image2 style:UIBarButtonItemStylePlain target:self action:@selector(pressBtnItem)];
    self.navigationItem.rightBarButtonItem = image2BI;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if (section == 0 || section == 1 || section == 2) {
        return 1;
    } else if (section == 3){
        return 2;
    } else {
        return 4;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZWYTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:zCell forIndexPath:indexPath];
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.multipleSelectionBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.multipleSelectionBackgroundView.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 0) {
        
        UIImage *touImage = [UIImage imageNamed:@"tou.jpg"];
        cell.touImageView.image = touImage;
        cell.nameLabel.text = @"一个账号";
        
        cell.degreeLabel.text = @"Lv.6";
        cell.degreeLabel.layer.cornerRadius = 8;
        cell.layer.masksToBounds = YES;
        cell.degreeLabel.layer.backgroundColor = [UIColor grayColor].CGColor;
        
        cell.degreeLabel.textAlignment = NSTextAlignmentCenter;
       
        UIButton *btn = [[UIButton alloc] init];
        UIImage *image = [UIImage imageNamed:@"签到1.png"];
        [btn setImage:image forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(355, 35, 40, 40);
        [cell.arraySwitch addObject:btn];
        [cell.contentView addSubview:cell.arraySwitch[0]];
    
        
    } else if (indexPath.section == 1) {
        
        NSArray *numArray = @[@" 60", @" 71", @" 27"];
        NSArray *textArray = @[@" 动态", @" 关注", @" 粉丝", @"编辑资料"];
        
        for (int i = 0; i < 4; i++) {
            if (i < 3) {
                UILabel *label = [[UILabel alloc] init];
                label.text = numArray[i];
                label.frame = CGRectMake(110 * i + 20, 20, 40, 40);
                label.textAlignment = NSTextAlignmentCenter;
                [cell.arraylabel addObject:label];
                [cell.iv addSubview:cell.arraylabel[i]];
            } else {
                cell.editView.image = [UIImage imageNamed:@"编辑.png"];
            }
            
            UILabel *label = [[UILabel alloc] init];
            label.text = textArray[i];
            if (i == 4) {
                label.frame = CGRectMake(100 * i, 60, 90, 20);
            } else {
                label.frame = CGRectMake(110 * i + 20, 60, 90, 20);
            }
            [cell.arrayL addObject:label];
            [cell.iv addSubview:cell.arrayL[i]];
        }
        
    } else if (indexPath.section == 2){
        
        NSArray *imageName = @[@"信封 .png", @"商城.png",@"演出.png",@"换肤.png"];
        NSArray *array = @[@"消息", @"商城", @"演出", @"个性换肤"];
        for (int i = 0; i < 4; i++) {
            
            UIImage *image = [UIImage imageNamed:imageName[i]];
            UIImageView *iV = [[UIImageView alloc] init];
            iV.image = image;
            iV.frame = CGRectMake(110 * i + 20, 16, 40, 40);
            [cell.arrayIV addObject:iV];
            [cell.iv addSubview:cell.arrayIV[i]];
            
            UILabel *label = [[UILabel alloc] init];
            label.text = array[i];
            if (i == 3) {
                label.frame = CGRectMake(110 * i, 60, 90, 20);
            } else {
                label.frame = CGRectMake(110 * i + 20, 60, 90, 20);
            }
            
            label.font = [UIFont systemFontOfSize:18];
            [cell.arrayL addObject:label];
            [cell.iv addSubview:cell.arrayL[i]];
            
        }
        
        
    } else if (indexPath.section == 3){
    
        NSArray *imageN = @[@"铃铛.png",@"订单.png"];
            
        cell.imageV.image = [UIImage imageNamed:imageN[indexPath.row]];
        cell.nameLabel.text = _array1[indexPath.row];
    } else {
        NSArray *imageN = @[@"设置.png",@"夜间模式.png",@"定时 .png",@"闹钟.png"];
        
        cell.imageV.image = [UIImage imageNamed:imageN[indexPath.row]];
        cell.nameLabel.text = _array2[indexPath.row];
        if (indexPath.row == 1) {
            UISwitch *nightSwitch = [[UISwitch alloc] init];
            [nightSwitch setOn:NO animated:YES];
            nightSwitch.frame = CGRectMake(330, 10, 20, 20);
            [cell.arraySwitch addObject:nightSwitch];
            [cell.contentView addSubview:cell.arraySwitch[0]];
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3 ||indexPath.section == 4 ) {
        return 55;
    } else {
        return 100;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 0;
    } else {
        return 20;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 20;
    }
   
}

-(void)pressDown :(UIButton *) btn {
    UIImage *image = [UIImage imageNamed:@"签到.png"];
    [btn setImage:image forState:UIControlStateNormal];

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return @"";
    } else {
        return @" ";
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
