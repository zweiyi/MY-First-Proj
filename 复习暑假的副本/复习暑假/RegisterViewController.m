//
//  RegisterViewController.m
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/4.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userNametextField = [[UITextField alloc] init];
    _userNametextField.frame = CGRectMake(W * 0.05, H * 0.2, W * 0.6, 40);
    _userNametextField.placeholder = @"请输入用户名....";
    _userNametextField.layer.borderWidth = 2;
    _userNametextField.layer.borderColor = [UIColor blackColor].CGColor;
    _userNametextField.delegate = self;
    [self.view addSubview:_userNametextField];
    
    _passWorldTextField = [[UITextField alloc] init];
    _passWorldTextField.frame = CGRectMake(W *0.05, H * 0.2 + 60, W * 0.6, 40);
    _passWorldTextField.placeholder = @"请输入密码.....";
    _passWorldTextField.secureTextEntry = YES;
    _passWorldTextField.layer.borderWidth = 2;
    _passWorldTextField.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_passWorldTextField];
    _passWorldTextField.delegate = self;
    
    UIButton *backLandButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backLandButton.frame = CGRectMake(W * 0.2, H * 0.4, 100, 40);
    [backLandButton setTitle:@"返回登陆" forState:UIControlStateNormal];
    [backLandButton addTarget:self action:@selector(pressBackLand) forControlEvents:UIControlEventTouchUpInside];
    backLandButton.layer.borderColor = [UIColor blackColor].CGColor;
    backLandButton.layer.borderWidth = 2;
    [self.view addSubview:backLandButton];
    
}

-(void)pressBackLand {
    if ([self.accountDelegate respondsToSelector:@selector(passAccount:withPassWorld:)]) {
        [self.accountDelegate passAccount:_userNametextField.text withPassWorld:_passWorldTextField.text];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_passWorldTextField resignFirstResponder];
    [_userNametextField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
