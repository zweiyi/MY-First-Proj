//
//  RegisterViewController.m
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
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
    _accountTextField = [[UITextField alloc] init];
    _accountTextField.frame = CGRectMake(100, 200, 200, 40);
    _accountTextField.placeholder = @"请输入账号";
    _accountTextField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_accountTextField];
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.frame = CGRectMake(100, 280, 200, 40);
    _passTextField.secureTextEntry = YES;
    _passTextField.placeholder = @"请输入密码";
    _passTextField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_passTextField];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(150, 350, 70, 40);
    [registerButton setTitle:@"返回登陆" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(backToLand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void )backToLand {
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([self.registerDelegate respondsToSelector:@selector(pass:andPass:)]) {
        [self.registerDelegate pass:_accountTextField.text andPass:_passTextField.text];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accountTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
}
@end
