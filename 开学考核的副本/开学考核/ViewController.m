//
//  ViewController.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    UIButton *landButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    landButton.frame = CGRectMake(100, 220, 100, 40);
    [landButton setTitle:@"land" forState:UIControlStateNormal];
    [landButton addTarget:self action:@selector(pressLand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landButton];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(100, 280, 100, 40);
    [registerButton setTitle:@"register" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _accountArray = [NSMutableArray array];
    _passArray = [NSMutableArray array];
    
    [_accountArray addObject:@"iOSnb123"];
    [_passArray addObject:@"123456789"];
    
}

- (void)pressLand {
    int i = 0;
    for(i = 0; i < _accountArray.count; i++) {
        if ([_accountArray[i] isEqualToString:_userNameTextField.text] && [_passArray[i] isEqualToString:_passwordTextField.text]) {
            FirstViewController *firstViewController = [[FirstViewController alloc] init];
            SecondViewController *secondViewController = [[SecondViewController alloc] init];
            ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
            ForthViewController *forthViewController = [[ForthViewController alloc] init];
            FifthViewController *fifthViewController = [[FifthViewController alloc] init];
            
            UINavigationController *fistNav = [[UINavigationController alloc] initWithRootViewController:firstViewController];
            UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondViewController];
            UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
            UINavigationController *forthNav = [[UINavigationController alloc] initWithRootViewController:forthViewController];
            UINavigationController *fifthNav = [[UINavigationController alloc] initWithRootViewController:fifthViewController];
            
            fistNav.title = @"视图1";
            secondNav.title = @"视图2";
            thirdNav.title = @"视图3";
            forthNav.title = @"视图4";
            fifthNav.title = @"视图5";
            
            NSArray *array = @[fistNav, secondNav, thirdNav, forthNav, fifthNav];
            
            UITabBarController *tabBarController = [[UITabBarController alloc] init];
            tabBarController.viewControllers = array;
            self.view.window.rootViewController = tabBarController;
        }
    }
    if (i == _accountArray.count) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"账号或密码不正确" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:NO completion:nil];
    }
}

- (void)pressRegister {
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    registerController.registerDelegate = self;
    [self presentViewController:registerController animated:NO completion:nil];
}

- (void)passuserName:(NSString *)userName andPassword:(NSString *)password {
    _userNameTextField.text = userName;
    _passwordTextField.text = password;
    [_accountArray addObject:userName];
    [_passArray addObject:password];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
