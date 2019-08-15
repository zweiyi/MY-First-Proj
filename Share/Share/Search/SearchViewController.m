//
//  SearchViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SearchViewController.h"
#import "HomeViewController.h"
#import "SearchViewController1.h"
#import "UploadViewController1.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *search1Image = [UIImage imageNamed:@"2_normal.png"];
    UIImage *search2Image = [UIImage imageNamed:@"2_pressed.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = [search1Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [search2Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    
    self.navigationItem.title = @"搜索";
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 384, 50)];
    _searchTextField.placeholder = @"搜索用户名作品分类文章";
    UIImageView *searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"放大镜.png"]];
    searchImageView.frame = CGRectMake(0, 0, 30, 30);
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    _searchTextField.leftView = searchImageView;
    _searchTextField.layer.cornerRadius = 5;
    _searchTextField.layer.borderWidth = 2;
    _searchTextField.layer.borderColor = [UIColor grayColor].CGColor;
    
    _searchTextField.delegate = self;
    [self.view addSubview:_searchTextField];
    
    /*UIImage *blackImage = [UIImage imageNamed:@"back_img.png"];
    UIBarButtonItem *blackButtonItem = [[UIBarButtonItem alloc] initWithImage:blackImage style:UIBarButtonItemStyleDone target:self action:@selector(pressBlack)];
    self.navigationItem.leftBarButtonItem = blackButtonItem;*/
    
    UIImage *uploadImage = [UIImage imageNamed:@"上传.png"];
    UIBarButtonItem *uploadBarButtonItem = [[UIBarButtonItem alloc] initWithImage:uploadImage style:UIBarButtonItemStylePlain target:self action:@selector(pressUpLoad)];
    uploadBarButtonItem.tintColor = [UIColor whiteColor];
    
//    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
//    [bBarButtonItem setImage:[UIImage imageNamed:@"back_img.png"]];
//    bBarButtonItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.backBarButtonItem = bBarButtonItem;
    
    self.navigationItem.rightBarButtonItem = uploadBarButtonItem;
    NSArray *array = @[@"分类", @"推荐", @"时间"];
    
    for (int i = 0; i < 3; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, i * 120 + 140, 70, 20)];
        view.backgroundColor = [UIColor colorWithRed:0.16 green:0.6 blue:0.8 alpha:1.0 ];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"标题.png"]];
        imageView.frame = CGRectMake(0, 0, 20, 20);
        UILabel *label = [[UILabel alloc] init];
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        label.frame = CGRectMake(25, 0, 40, 20);
        UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_line.png"]];
        lineImageView.frame = CGRectMake(10, i * 120 + 160, 384, 1);

        [view addSubview:imageView];
        [view addSubview:label];
        
        [self.view addSubview:view];
        [self.view addSubview:lineImageView];
    }
    
    NSArray *buttontextArray = @[@[@"平面设计", @"网页设计", @"UI/icon", @"绘画/手绘"], @[@"虚拟与设计", @"影视", @"摄影", @"其他"], @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"], @[@"30分钟前", @"1小时前", @"1月前", @"1年前"]];
   
    for (int i =  0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        NSString *str = buttontextArray[0][i];
        [btn setTitle: str forState:UIControlStateNormal];
        btn.tintColor = [UIColor blackColor];
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        btn.frame = CGRectMake(10 + 100 * i , 180, 80, 30);
        [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    for (int i =  0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        NSString *str = buttontextArray[1][i];
        [btn setTitle: str forState:UIControlStateNormal];
        btn.tintColor = [UIColor blackColor];
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        btn.frame = CGRectMake(10 + 100 * i , 220, 80, 30);
        [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    for (int i =  0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        NSString *str = buttontextArray[2][i];
        [btn setTitle: str forState:UIControlStateNormal];
        btn.tintColor = [UIColor blackColor];
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        btn.frame = CGRectMake(10 + 100 * i, 300, 80, 30);
        [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    for (int i =  0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        NSString *str = buttontextArray[3][i];
        [btn setTitle: str forState:UIControlStateNormal];
        btn.tintColor = [UIColor blackColor];
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        btn.frame = CGRectMake(10 + 100 * i , 420, 80, 30);
        [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)pressSelect : (UIButton *)btn {
    btn.tintColor = [UIColor whiteColor];
    btn.backgroundColor = [UIColor colorWithRed:0.16 green:0.6 blue:0.8 alpha:1.0 ];
    [btn addTarget:self action:@selector(pressUnSelect :) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressUnSelect : (UIButton *)btn {
    btn.tintColor = [UIColor blackColor];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressBlack {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    
    [self.navigationController pushViewController:homeViewController animated:NO];
}

-(void)pressUpLoad {
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    bBarButtonItem.title = @"上传";
    
    UploadViewController1 *uploadViewController1 = [[UploadViewController1 alloc] init];
    
    [self.navigationController pushViewController: uploadViewController1 animated:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_searchTextField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *str1 = @"大白";
    NSString *str2 = _searchTextField.text;
    if ([str1 isEqualToString:str2] ) {
        [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
        
        SearchViewController1 *searchViewController1 = [[SearchViewController1 alloc] init];
        [self.navigationController pushViewController:searchViewController1 animated:NO];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
}

@end
