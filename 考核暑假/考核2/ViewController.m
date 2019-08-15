//
//  ViewController.m
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FiveViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    UIButton *LandButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    LandButton.frame = CGRectMake(130, 350, 70, 40);
    [LandButton setTitle:@"登陆" forState:UIControlStateNormal];
    [LandButton addTarget:self action:@selector(pressLand) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:LandButton];
    
    _passTextField.delegate = self;
    _accountTextField.delegate = self;
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(200, 350, 70, 40);
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
}

-(void)pressLand {
    NSString *userName = @"iOSnb";
    NSString *pass = @"123456789";
    if (([_accountTextField.text isEqualToString:userName] && [_passTextField.text isEqualToString:pass]) || ([_accountTextField.text isEqualToString:_accountString] && [_passTextField.text isEqualToString:_passString] ) ){
        FirstViewController *firstViewController = [[FirstViewController alloc] init];
        SecondViewController *secondViewController = [[SecondViewController alloc] init];
        ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
        ForthViewController *forthViewController = [[ForthViewController alloc] init];
        FiveViewController *fifthViewController = [[FiveViewController alloc]  init];
        
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:secondViewController];
        UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
        UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:forthViewController];
        UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:fifthViewController];
        
        nav1.title = @"视图1";
        nav2.title = @"视图2";
        nav3.title = @"视图3";
        nav4.title = @"视图4";
        nav5.title = @"视图5";
       
        nav1.navigationBar.tintColor = [UIColor blackColor];
        
        NSArray *array = @[nav1, nav2, nav3, nav4, nav5];
        
        
        UITabBarController *tabBaracontroller = [[UITabBarController alloc] init];
        tabBaracontroller.viewControllers = array;
        
        self.view.window.rootViewController = tabBaracontroller;
    }
}

-(void)pressRegister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.registerDelegate = self;
    [self presentViewController:registerViewController animated:YES completion:nil];
}

- (void)pass:(NSString *)str1 andPass:(NSString *)str2 {
    _accountString = str1;
    _passString = str2;
    _accountTextField.text = str1;
    _passTextField.text = str2;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accountTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
}

@end
