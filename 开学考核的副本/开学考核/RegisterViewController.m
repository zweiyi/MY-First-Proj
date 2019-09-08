//
//  RegisterViewController.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _userNameTextField  = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 200, 40)];
    _userNameTextField.placeholder = @"请输入账号";
    _userNameTextField.layer.borderWidth = 2;
    _userNameTextField.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_userNameTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 160, 200, 40)];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.layer.borderWidth = 2;
    _passwordTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _passwordTextField.secureTextEntry = YES;
    [self.view addSubview:_passwordTextField];
    
    UIButton *backlandButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backlandButton.frame = CGRectMake(100, 220, 100, 40);
    [backlandButton setTitle:@"BackToLand" forState:UIControlStateNormal];
    [backlandButton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backlandButton];
}

- (void)pressback {
    if ([self.registerDelegate respondsToSelector:@selector(passuserName:andPassword: )]) {
        [self.registerDelegate  passuserName:_userNameTextField.text andPassword:_passwordTextField.text];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
