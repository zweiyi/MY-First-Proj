//
//  NoteViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "NoteViewController.h"
#import "ZWYTableViewCell5.h"


@interface NoteViewController ()

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *note1Image = [UIImage imageNamed:@"3_normal.png"];
    UIImage *note2Image = [UIImage imageNamed:@"3_pressed.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [note1Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [note2Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    self.navigationItem.title = @"文章";
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height);
    _scrollView.pagingEnabled = YES;
    //遇到边框是否反弹
    _scrollView.bounces = YES;
    _scrollView.bouncesZoom = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.scrollEnabled = YES;
    //是否只能在一个方向上滚动
    _scrollView.directionalLockEnabled = YES;
    _scrollView.delegate = self;

    
    [self.view addSubview:_scrollView];
    
   _dataArray = @[@[@"明月逐人归", @"少年眼中亮起的光", @"以我的最弱击败你的最强", @"晚饭是大碗宽面"], @[@"share小唐", @"share小白", @"share小黑", @"share小红",], @[@"15分钟前", @"16分钟前", @"15分钟前", @"16分钟前"], @[@"非正1.jpg", @"非正2.jpg", @"非正3.jpg", @"非正4.jpg"], @[@"最好的友情", @"你最中意的一张照片", @"叶子说", @"美图社"], @[@"share小兰", @"share小紫", @"share小橙", @"share小粉"],@[@"14分钟前", @"16分钟前", @"18分钟前", @"19分钟前"], @[@"非正5.jpg", @"非正6.jpg", @"非正7.jpg", @"非正8.jpg"], @[@"超级地球", @"吃东西是一件很治愈的事", @"伟大的渺小", @"因为你我对世界充满了期待"], @[@"share小明", @"share小灰", @"share小电", @"小洋"], @[@"14分钟前", @"16分钟前", @"18分钟前", @"19分钟前"], @[@"非正9.jpg", @"非正10.jpg", @"非正11.jpg", @"非正12.jpg"]];
    
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 600)];
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 1, 0, [UIScreen mainScreen].bounds.size.width, 600)];
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, 600)];
    
    _tableView1.tag = 1;
    _tableView2.tag = 2;
    _tableView3.tag = 3;
    
    [_tableView1 registerClass:[ZWYTableViewCell5 class] forCellReuseIdentifier:@"tab1Cell"];
    
    
    [_tableView2 registerClass:[ZWYTableViewCell5 class] forCellReuseIdentifier:@"tab2Cell"];
    
    
    [_tableView3 registerClass:[ZWYTableViewCell5 class] forCellReuseIdentifier:@"tab3Cell"];
    
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    
    [_scrollView addSubview:_tableView1];
    [_scrollView addSubview:_tableView2];
    [_scrollView addSubview:_tableView3];
    
    _array = @[@"精选文章", @"热门推荐", @"全部文章"];
    
    _segment = [[UISegmentedControl alloc] initWithItems:_array];
    _segment.frame = CGRectMake(0, 60, self.view.frame.size.width, 40);
    //设置标题和边框的颜色
    _segment.tintColor = [UIColor whiteColor];
    _segment.momentary = NO;
    //设置初始选中值，默认为没有选中
    _segment.selectedSegmentIndex = 0;
    [_segment setBackgroundImage:[UIImage imageNamed:@"essay_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segment setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
    [_segment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [self.view addSubview:_segment];
    [_segment addTarget:self action:@selector(roll ) forControlEvents:UIControlEventValueChanged];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1) {
        ZWYTableViewCell5 *cell1 = [_tableView1 dequeueReusableCellWithIdentifier:@"tab1Cell" forIndexPath:indexPath];
        
        cell1.nameLabel.text = _dataArray[0][indexPath.section];
        cell1.noteLabel.text = _dataArray[2][indexPath.section];
        cell1.authorLabel.text = _dataArray[1][indexPath.section];
        cell1.leftImageView.image = [UIImage imageNamed:_dataArray[3][indexPath.section]];
        return cell1;
    } else if (tableView.tag == 2) {
        ZWYTableViewCell5 *cell2 = [_tableView2 dequeueReusableCellWithIdentifier:@"tab2Cell" forIndexPath:indexPath];
        cell2.nameLabel.text = _dataArray[4][indexPath.section];
        cell2.noteLabel.text = _dataArray[6][indexPath.section];
        cell2.authorLabel.text = _dataArray[5][indexPath.section];
        cell2.leftImageView.image = [UIImage imageNamed:_dataArray[7][indexPath.section]];
        return cell2;
    } else {
        ZWYTableViewCell5 *cell3 = [_tableView3 dequeueReusableCellWithIdentifier:@"tab3Cell" forIndexPath:indexPath];
        cell3.nameLabel.text = _dataArray[8][indexPath.section];
        cell3.noteLabel.text = _dataArray[10][indexPath.section];
        cell3.authorLabel.text = _dataArray[9][indexPath.section];
        cell3.leftImageView.image = [UIImage imageNamed:_dataArray[11][indexPath.section]];
        return cell3;
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

-(void)roll   {
    switch (_segment.selectedSegmentIndex) {
        case 0:
            [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case 1:
            [_scrollView setContentOffset:CGPointMake(414, 0) animated:YES];
            break;
        case 2:
            [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * 2, 0) animated:YES];
            break;
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(_scrollView.contentOffset.x == 0) {
        _segment.selectedSegmentIndex = 0;
    }
    if (_scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width ) {
        _segment.selectedSegmentIndex = 1;
    }
    if (_scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 2) {
         _segment.selectedSegmentIndex = 2;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
