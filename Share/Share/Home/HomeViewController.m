//
//  HomeViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "HomeViewController.h"
#import "ZWYTableViewCell1.h"
#import "HolidayViewController.h"
#import "ZWYTableViewCell3.h"
#import "ZWYTableViewCell4.h"
#import "ZWYTableViewCell5.h"


@interface HomeViewController ()



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:[UIImage imageNamed:@"actionbar.png"] forBarMetrics:UIBarMetricsDefault];
    */
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *home1Image = [UIImage imageNamed:@"56.png"];
    UIImage *home2Image = [UIImage imageNamed:@"1_pressed.png"];
    
    self.navigationItem.title = @"SHARE";
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [home1Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [home2Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-55) style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[ZWYTableViewCell1 class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[ZWYTableViewCell3 class] forCellReuseIdentifier:@"cell3"];
    [_tableView registerClass:[ZWYTableViewCell4 class] forCellReuseIdentifier:@"cell4"];
    [_tableView registerClass:[ZWYTableViewCell5 class] forCellReuseIdentifier:@"cell5"];
    
    _dataNameArry = @[@"", @"假日", @"国外画册欣赏", @"collection扁平设计", @"板式整理术：高校解决多风格要求"];
    _dataNoteArry = @[@"", @"原创-插画-联系习作15分钟前", @"平面设计-画册设计16分钟前", @"平面设计-海报设计17分钟前", @"平面设计-海报整理18分钟前"];
    _dataAuthorArry = @[@"", @"share小白", @"share小王", @"share小吕", @"share小王"];
    
    _imageArry = @[@"", @"list_img1.png", @"list_img2.png", @"list_img3.png", @"list_img4.png"];
    
    _num = 102;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        
        ZWYTableViewCell3 *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
//        NSLog(@"%ld %p", indexPath.row, cell);
//        NSLog(@"--%f",cell.scrollview.contentOffset.x);
        return cell;
        
    } else if (indexPath.section == 1) {
        
        ZWYTableViewCell1 *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.leftImageView.image =[UIImage imageNamed:_imageArry[indexPath.section]];
        cell.nameLabel.text = _dataNameArry[indexPath.section];
        cell.authorLabel.text = _dataAuthorArry[indexPath.section];
        cell.noteLabel.text = _dataNoteArry[indexPath.section];
        cell.nameLabel.numberOfLines = 0;
        cell.noteLabel.numberOfLines = 0;
        
        
        return cell;
    
    } else if (indexPath.section == 3 || indexPath.section == 2) {
        
        ZWYTableViewCell4 *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
        
//        cell.likeLabel.text = @"102";
        cell.leftImageView.image =[UIImage imageNamed:_imageArry[indexPath.section]];
        cell.nameLabel.text = _dataNameArry[indexPath.section];
        cell.authorLabel.text = _dataAuthorArry[indexPath.section];
        cell.noteLabel.text = _dataNoteArry[indexPath.section];
        cell.nameLabel.numberOfLines = 0;
        cell.noteLabel.numberOfLines = 0;
        
        
        return cell;
    } else {
            ZWYTableViewCell5 *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell5" forIndexPath:indexPath];
            
//            cell.likeLabel.text = [NSString stringWithFormat:@"%.0f",_num ];
            cell.leftImageView.image =[UIImage imageNamed:_imageArry[indexPath.section]];
            cell.nameLabel.text = _dataNameArry[indexPath.section];
            cell.authorLabel.text = _dataAuthorArry[indexPath.section];
            cell.noteLabel.text = _dataNoteArry[indexPath.section];
            cell.nameLabel.numberOfLines = 0;
            cell.noteLabel.numberOfLines = 0;
            
       
            return cell;
    }
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 210;
    } else {
        return 150;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    HolidayViewController *holidayViewController = [[HolidayViewController alloc] init];
    
    [self.navigationController pushViewController:holidayViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 15;
}


- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.tableView) {
        CGFloat offsetY = _tableView.contentOffset.y;
        [self setNavigationBarColorWithOffsetY:offsetY];
//    }
}

// 界面滑动时导航栏随偏移量 实时变化
- (void)setNavigationBarColorWithOffsetY:(CGFloat)offsetY {
    UIImageView *backView = self.navigationController.navigationBar.subviews[0];
    if (offsetY <= 0) {
        backView.alpha = 1;
    }
    if (offsetY > 0 && offsetY < 100) {
        backView.alpha = 1 - offsetY/100 ;
    }
    if (offsetY >= 100 ) {
        backView.alpha = 0;
    }
}


@end
