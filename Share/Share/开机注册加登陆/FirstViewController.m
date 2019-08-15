//
//  FirstViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FirstViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "NoteViewController.h"
#import "CupViewController.h"
#import "UserViewController.h"
#import "HolidayViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //背景图
    UIImage *kaijiImage = [UIImage imageNamed:@"kaiji1.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:kaijiImage];
    
    
    //logo
    UIImage *kaijilogoImage = [UIImage imageNamed:@"login_logo.png"];
    UIImageView *kaijilogoImageView = [[UIImageView alloc] init];
    kaijilogoImageView.image = kaijilogoImage;
    kaijilogoImageView.frame = CGRectMake(150, 90, 110, 110);
    [self.view addSubview:kaijilogoImageView];
    
    UILabel *shareLabel = [[UILabel alloc] init];
    shareLabel.text = @"SHARE";
    shareLabel.textColor = [UIColor whiteColor];
    shareLabel.font = [UIFont systemFontOfSize:42];
    shareLabel.frame = CGRectMake(145, 200, 145, 40);
    [self.view addSubview:shareLabel];
    
    
    UIImage *userImage = [UIImage imageNamed:@"user_img.png"];
    UIImage *lineImage = [UIImage imageNamed:@"line.png"];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    UIView *user_leftView = [[UIView alloc] init];
    user_leftView.frame = CGRectMake(0, 0, 55, 55);
    userImageView.frame = CGRectMake(10, 10, 30, 30);
    lineImageView.frame = CGRectMake(40, 10, 1, 30);
    [user_leftView addSubview:userImageView];
    [user_leftView addSubview:lineImageView];
    
    _userTextField = [[UITextField alloc] init];
    _userTextField.frame = CGRectMake(40, 300, 330, 50);
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userTextField.placeholder = @"请输入用户名...";
    _userTextField.keyboardType = UIKeyboardTypeDefault;
    //总是显示左侧视图
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    _userTextField.leftView = user_leftView;
    
    _userTextField.delegate = self;
    
    [self.view addSubview:_userTextField];
    
    
    UIImage *passImage = [UIImage imageNamed:@"pass_img.png"];
    UIImage *line2Image = [UIImage imageNamed:@"line.png"];
    UIImageView *line2ImageView = [[UIImageView alloc] initWithImage:line2Image];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    UIView *pass_leftView = [[UIView alloc] init];
    passImageView.frame = CGRectMake(10, 10, 30, 30);
    line2ImageView.frame = CGRectMake(40, 10, 1, 30);
    pass_leftView.frame = CGRectMake(0, 0, 55, 55);
    [pass_leftView addSubview:passImageView];
    [pass_leftView addSubview:line2ImageView];
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.frame = CGRectMake(40, 360, 330, 50);
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.placeholder = @"请输入密码...";
    _passTextField.keyboardType = UIKeyboardTypeDefault;
    _passTextField.secureTextEntry = YES;
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    _passTextField.leftView = pass_leftView;
    
    _passTextField.delegate = self;
    
    [self.view addSubview:_passTextField];
    
    _loadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loadButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loadButton addTarget:self action:@selector(pressLoad) forControlEvents:UIControlEventTouchUpInside];
    _loadButton.frame = CGRectMake(85, 440, 100, 40);
    _loadButton.layer.masksToBounds = YES;
    _loadButton.layer.cornerRadius = 5;
    _loadButton.layer.borderWidth = 2;
    _loadButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _loadButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_loadButton setTintColor:[UIColor whiteColor]];
    [self.view addSubview:_loadButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(pressregister) forControlEvents:UIControlEventTouchUpInside];
    _registerButton.frame = CGRectMake(215, 440, 100, 40);
    _registerButton.layer.masksToBounds = YES;
    _registerButton.layer.cornerRadius = 5;
    _registerButton.layer.borderWidth = 2;
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_registerButton setTintColor:[UIColor whiteColor]];
    _registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:_registerButton];
    
    UIButton *checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkButton setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    checkButton.frame = CGRectMake(40, 500, 20, 20);
    checkButton.tag = 100;
    checkButton.selected = YES;
    checkButton.backgroundColor = [UIColor clearColor];
    [checkButton addTarget:self action:@selector(pressCheck:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:checkButton];
    
    UILabel *checkLabel = [[UILabel alloc] initWithFrame:CGRectMake(63, 500, 80, 20)];
    checkLabel.text = @"自动登录";
    checkLabel.textColor = [UIColor blackColor];
    [self.view addSubview:checkLabel];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _userArray = [[NSMutableArray alloc] init];
    _passArray = [[NSMutableArray alloc] init];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_passTextField resignFirstResponder];
    [_userTextField resignFirstResponder];
    
}

-(void)pressLoad {
    NSString *strPass = _passTextField.text;
    
    if ([strPass isEqualToString:_passStr]) {
        UIWindow *window = self.view.window;
        
        HomeViewController *homeViewController = [[HomeViewController alloc] init];
        SearchViewController *searchViewController = [[SearchViewController alloc] init];
        NoteViewController *noteViewController = [[NoteViewController alloc] init];
        CupViewController *cupViewController = [[CupViewController alloc] init];
        UserViewController *userVIewController = [[UserViewController alloc] init];
    
        UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        UINavigationController *noteNavigationController = [[UINavigationController alloc] initWithRootViewController:noteViewController];
        UINavigationController *cupNavigationController = [[UINavigationController alloc] initWithRootViewController:cupViewController];
        UINavigationController *userNavigationController = [[UINavigationController alloc] initWithRootViewController:userVIewController];
    
    
        homeNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        searchNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        noteNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        cupNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
        userNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    
        [homeNavigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],  NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [searchNavigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22], NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [noteNavigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22], NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [cupNavigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22], NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [userNavigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22], NSForegroundColorAttributeName:[UIColor whiteColor]}];

        homeViewController.view.backgroundColor = [UIColor whiteColor];
        searchViewController.view.backgroundColor = [UIColor whiteColor];
        noteViewController.view.backgroundColor = [UIColor whiteColor];
        cupViewController.view.backgroundColor = [UIColor whiteColor];
        userVIewController.view.backgroundColor = [UIColor whiteColor];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        
        
        NSArray *arryViewController = [NSArray arrayWithObjects:homeNavigationController, searchNavigationController, noteNavigationController, cupNavigationController, userNavigationController,nil];
        
        tabBarController.viewControllers = arryViewController;
    
        tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
        window.rootViewController = tabBarController;
    
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或者密码输入错误" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void)pressregister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    
    //将用户名出入下一个页面中的用户名的位置
    registerViewController.str = _userTextField.text;
    
    //回调方法将输入框中的数据 传输过来
    [registerViewController returnText:^(NSString *showStr) {
        self->_passStr = showStr;
    }];
    [self presentViewController:registerViewController animated:YES completion:nil];
    
}

-(void)pressCheck : (UIButton *) checkButton {
    if (checkButton.selected == YES) {
        UIImage *checkedImage = [UIImage imageNamed:@"checkbox_checked.png"];
        [checkButton setImage:checkedImage forState:UIControlStateNormal];
        checkButton.selected = NO;
    } else {
        UIImage *checkImage = [UIImage imageNamed:@"checkbox_unchecked.png"];
        [checkButton setImage:checkImage forState:UIControlStateNormal];
        checkButton.selected = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userTextField) {
        [_passTextField becomeFirstResponder];
    } else {
        [_passTextField resignFirstResponder];
    }
    
    return YES;
}

-(void)keyboardWillShow : (NSNotification *)notify {
    CGFloat kbHeight = [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    CGFloat offset = kbHeight - 100;
    
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

-(void)keyboardWillHide: (NSNotification *)notify {
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
@end

