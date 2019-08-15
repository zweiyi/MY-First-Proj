//
//  ViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置背景图
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"伦.jpg"]];
    backgroundImageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    _userNameTextField = [[UITextField alloc] init];
    _userNameTextField.frame = CGRectMake(77, 200, 260, 40);
    //设置光标颜色
    _userNameTextField.tintColor = [UIColor whiteColor];
    _userNameTextField.textColor = [UIColor whiteColor];
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.layer.borderWidth = 2;
    _userNameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _userNameTextField.delegate = self;
    
    UIImage *lineImage = [UIImage imageNamed:@"line.png"];
    
    UIImageView *userImageView = [[UIImageView alloc] init];
    userImageView.image = [UIImage imageNamed:@"账号.png"];
    userImageView.frame = CGRectMake(0, 10, 30, 25);
    UIImageView *lineUserImageView = [[UIImageView alloc] initWithImage:lineImage];
    lineUserImageView.frame = CGRectMake(30, 0, 2, 40);
    UIView *userView = [[UIView alloc] init];
    userView.frame = CGRectMake(0, 0, 32, 40);
    
    [userView addSubview:userImageView];
    [userView addSubview:lineUserImageView];
    
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _userNameTextField.leftView = userView;
    
    [self.view addSubview:_userNameTextField];
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.frame = CGRectMake(77, 270, 260, 40);
    _passTextField.placeholder = @"请输入密码";
    _passTextField.secureTextEntry = YES;
    _passTextField.textColor = [UIColor whiteColor];
    _passTextField.tintColor = [UIColor whiteColor];
    _passTextField.layer.borderWidth = 2;
    _passTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _passTextField.delegate = self;
    
    UIImageView *passLineImageView = [[UIImageView alloc] initWithImage:lineImage];
    passLineImageView.frame = CGRectMake(30, 0, 2, 40);
    UIImageView *passImageView = [[UIImageView alloc] init];
    passImageView.image = [UIImage imageNamed:@"密码.png"];
    passImageView.frame = CGRectMake(0, 10, 30, 25);
    UIView *passView = [[UIView alloc ] init];
    passView.frame = CGRectMake(0, 0, 32, 40);
    [passView addSubview:passImageView];
    [passView addSubview:passLineImageView];
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    _passTextField.leftView = passView;
    
    [self.view addSubview:_passTextField];
    
    UIButton *landButton = [[UIButton alloc] init];
    [landButton setTitle:@"登陆" forState:UIControlStateNormal];
    [landButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [landButton addTarget:self action:@selector(pressLand) forControlEvents:UIControlEventTouchUpInside];
    landButton.layer.borderWidth = 2;
    landButton.layer.borderColor = [UIColor whiteColor].CGColor;
    landButton.frame = CGRectMake(80, 380, 70, 30);
    [self.view addSubview:landButton];
    
    UIButton *registerButton = [[UIButton alloc] init];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    registerButton.layer.borderWidth = 2;
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.frame = CGRectMake(260, 380, 70, 30);
    [self.view addSubview:registerButton];
    
    AccountMessage *accountMessage = [[AccountMessage alloc] init];
    accountMessage.accountString = @"111";
    accountMessage.passWordString = @"222";
    
    _accountArray = [[NSMutableArray alloc] init];
    
    [_accountArray addObject:accountMessage];

}

-(void)pressLand {
    BOOL isLand = NO;
    AccountMessage *accountM;
    for (accountM in _accountArray) {
        if ([accountM.accountString isEqualToString:_userNameTextField.text] && [accountM.passWordString isEqualToString:_passTextField.text]) {
            isLand = YES;
            break;
        }
    }
    if (isLand) {
       
        MainViewController *mainViewController = [[MainViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainViewController];
//        nav.navigationBarHidden = YES;
//        nav.navigationBar.backgroundColor = [UIColor clearColor];
        
        [self presentViewController:nav animated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码输入错误" message:@"请重新登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
        [alert addAction:sureAlertAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)pressRegister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.accountArray = _accountArray;
    registerViewController.accountDelegate = self;
    [self presentViewController:registerViewController animated:YES completion:nil];
    
}

- (void)passAccountMessage:(AccountMessage *)account {
    _userNameTextField.text = account.accountString;
    _passTextField.text = account.passWordString;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userNameTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userNameTextField) {
        [_userNameTextField resignFirstResponder];
        [_passTextField becomeFirstResponder];
    } else {
        [_passTextField resignFirstResponder];
    }
    return YES;
}
@end
