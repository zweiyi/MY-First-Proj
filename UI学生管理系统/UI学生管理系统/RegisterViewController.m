//
//  RegisterViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "RegisterViewController.h"
#import "ViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"非正背景.jpg"]];
    backImageView.alpha = 0.75;
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _userNameTextField = [[UITextField alloc] init];
    _userNameTextField.placeholder = @"请输入账号";
    _userNameTextField.textColor = [UIColor whiteColor];
    _userNameTextField.tintColor = [UIColor whiteColor];
    _userNameTextField.frame = CGRectMake(77, 150, 260, 40);
    _userNameTextField.layer.masksToBounds = YES;
    _userNameTextField.layer.borderWidth = 2;
    _userNameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _userNameTextField.delegate = self;
    
    UIImage *lineImage = [UIImage imageNamed:@"line.png"];
    
    UIImageView *userImageView = [[UIImageView alloc] init];
    userImageView.image = [UIImage imageNamed:@"账号.png"];
    userImageView.frame = CGRectMake(0, 0, 30, 40);
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
    _passTextField.frame = CGRectMake(77, 230, 260, 40);
    _passTextField.placeholder = @"请输入密码";
    _passTextField.textColor = [UIColor whiteColor];
    _passTextField.tintColor = [UIColor whiteColor];
    _passTextField.secureTextEntry = YES;
    _passTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _passTextField.layer.borderWidth = 2;
    _passTextField.delegate = self;
    
    UIImageView *passLineImageView = [[UIImageView alloc] initWithImage:lineImage];
    passLineImageView.frame = CGRectMake(30, 0, 2, 40);
    UIImageView *passImageView = [[UIImageView alloc] init];
    passImageView.image = [UIImage imageNamed:@"密码.png"];
    passImageView.frame = CGRectMake(0, 0, 30, 40);
    UIView *passView = [[UIView alloc ] init];
    passView.frame = CGRectMake(0, 0, 32, 40);
    [passView addSubview:passImageView];
    [passView addSubview:passLineImageView];
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    _passTextField.leftView = passView;
    
    [self.view addSubview:_passTextField];
    
    _surePassWordTextField = [[UITextField alloc] init];
    _surePassWordTextField.frame = CGRectMake(77, 310, 260, 40);
    _surePassWordTextField.layer.borderWidth = 2;
    _surePassWordTextField.placeholder = @"请再次输入密码";
    _surePassWordTextField.textColor = [UIColor whiteColor];
    _surePassWordTextField.tintColor = [UIColor whiteColor];
    _surePassWordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _surePassWordTextField.secureTextEntry = YES;
    _surePassWordTextField.delegate = self;
    
    UIImageView *surePassLineImageView = [[UIImageView alloc] initWithImage:lineImage];
    surePassLineImageView.frame = CGRectMake(30, 0, 2, 40);
    UIImageView *surePassImageView = [[UIImageView alloc] init];
    surePassImageView.image = [UIImage imageNamed:@"密码.png"];
    surePassImageView.frame = CGRectMake(0, 0, 30, 40);
    UIView *surePassView = [[UIView alloc ] init];
    surePassView.frame = CGRectMake(0, 0, 32, 40);
    [surePassView addSubview:surePassImageView];
    [surePassView addSubview:surePassLineImageView];
    _surePassWordTextField.leftViewMode = UITextFieldViewModeAlways;
    _surePassWordTextField.leftView = surePassView;
    
    [self.view addSubview:_surePassWordTextField];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(100, 390, 70, 30);
    backButton.layer.borderWidth = 2;
    backButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [backButton setTitle:@"返回登陆" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressBackLand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIButton *sureRegisterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sureRegisterButton.frame = CGRectMake(250, 390, 70, 30);
    [sureRegisterButton setTitle:@"确认注册" forState:UIControlStateNormal];
    [sureRegisterButton setTintColor:[UIColor whiteColor]];
    sureRegisterButton.layer.borderColor = [UIColor whiteColor].CGColor;
    sureRegisterButton.layer.borderWidth = 2;
    [sureRegisterButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureRegisterButton];
    
}

-(void)pressRegister {
    
    BOOL isRegister = YES;
    for (AccountMessage *accMess in _accountArray) {
            if ([accMess.accountString isEqualToString:_userNameTextField.text]) {
                isRegister = NO;
                break;
            }
    }
    if (!isRegister) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号已存在" message:@"请重新注册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
            [alert addAction:sureAlertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
    }else {
        if([_passTextField.text isEqualToString:_surePassWordTextField.text] ) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"请返回登录" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
            [alert addAction:sureAlertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            _registerSucceed = YES;
            _accountMess = [[AccountMessage alloc] init];
            _accountMess.accountString = _userNameTextField.text;
            _accountMess.passWordString = _passTextField.text;
            [_accountArray addObject:_accountMess];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"两次密码不一致" message:@"请重新注册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
            [alert addAction:sureAlertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
}

-(void)pressBackLand {
    
    if (_registerSucceed) {
        [self dismissViewControllerAnimated:YES completion:nil];
        if (_registerSucceed) {
            if ([self.accountDelegate respondsToSelector:@selector(passAccountMessage:)]) {
                [self.accountDelegate passAccountMessage:_accountMess];
            }
        }
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_passTextField resignFirstResponder];
    [_userNameTextField resignFirstResponder];
    [_surePassWordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userNameTextField) {
        [_userNameTextField resignFirstResponder];
        [_passTextField becomeFirstResponder];
    } else if (_passTextField == textField) {
        [_passTextField resignFirstResponder];
        [_surePassWordTextField becomeFirstResponder];
    } else {
        [_surePassWordTextField resignFirstResponder];
    }
    return YES;
}

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if (textField == _userNameTextField) {
//        
//    }
//}
@end
