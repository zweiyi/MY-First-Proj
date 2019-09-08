//
//  ViewController.m
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/4.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

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
    
    _passWordTextField = [[UITextField alloc] init];
    _passWordTextField.frame = CGRectMake(W *0.05, H * 0.2 + 60, W * 0.6, 40);
    _passWordTextField.placeholder = @"请输入密码.....";
    _passWordTextField.secureTextEntry = YES;
    _passWordTextField.layer.borderWidth = 2;
    _passWordTextField.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_passWordTextField];
    _passWordTextField.delegate = self;
    
    UIButton *landButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [landButton setTitle:@"登陆" forState:UIControlStateNormal];
    [landButton addTarget:self action:@selector(pressLand) forControlEvents:UIControlEventTouchUpInside];
    landButton.frame = CGRectMake(W * 0.2, H * 0.4, 60, 60);
    landButton.layer.borderColor = [UIColor blackColor].CGColor;
    landButton.layer.borderWidth = 2;
    [self.view addSubview:landButton];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(W * 0.6, H * 0.4, 60, 60);
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    registerButton.layer.borderWidth = 2;
    registerButton.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:registerButton];
    
    _accountArray = [NSMutableArray array];
    [_accountArray addObject:@"iOSnb123"];
    
    _passWordArray = [NSMutableArray array];
    [_passWordArray addObject:@"123456789"];
    
}

-(void)pressLand {
     [_passWordArray addObject:@"123456789"];
    int i = 0;
    for (i = 0; i < _accountArray.count; i++) {
        if ([_accountArray[i] isEqualToString:_userNametextField.text] && [_passWordArray[i] isEqualToString:_passWordTextField.text]) {
            FirstViewController *firstViewController = [[FirstViewController alloc] init];
            SecondViewController *secondViewController = [[SecondViewController alloc] init];
            ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
            ForthViewController *forthViewController = [[ForthViewController alloc] init];
            FifthViewController *fifthViewController = [[FifthViewController alloc] init];
            
            UINavigationController *firstnavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
            UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
            UINavigationController *thirdNavigationController = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
            UINavigationController *forthNavigationController = [[UINavigationController alloc] initWithRootViewController:forthViewController];
            UINavigationController *fifthNavigationController = [[UINavigationController alloc] initWithRootViewController:fifthViewController];
            
            NSArray *array = @[firstnavigationController, secondNavigationController, thirdNavigationController, forthNavigationController, fifthNavigationController];
            
            firstnavigationController.title = @"视图1";
            secondNavigationController.title = @"视图2";
            thirdNavigationController.title = @"视图3";
            forthNavigationController.title = @"视图4";
            fifthNavigationController.title = @"视图5";
            
            UITabBarController *tabBarController = [[UITabBarController alloc] init];
            tabBarController.viewControllers = array;
            tabBarController.view.tintColor = [UIColor blackColor];
            self.view.window.rootViewController = tabBarController;
            break;
        }
    }
    if (i == _accountArray.count) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"密码或账号输入错误" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *cancleAlertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击之后");
        }];
        [alertController addAction:cancleAlertAction];
        [alertController addAction:sureAlertAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
}

-(void)pressRegister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.accountDelegate = self;
    registerViewController.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:registerViewController animated:NO completion:nil];
}

- (void)passAccount:(NSString *)userName withPassWorld:(NSString *)passWorld {
    _userNametextField.text = userName;
    _passWordTextField.text = passWorld;
    [_accountArray addObject:userName];
    [_passWordArray addObject:passWorld];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_passWordTextField resignFirstResponder];
    [_userNametextField resignFirstResponder];
}

-(void)dataTask {
    NSString *urlString = @"string";
    //对字符进行处理
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //创建请求地址
    NSURL *url = [NSURL URLWithString:urlString];
    //创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTase = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"qw");
        
    }];
    [dataTase resume];
    
}


@end
