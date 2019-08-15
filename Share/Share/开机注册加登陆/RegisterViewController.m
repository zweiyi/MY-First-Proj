//
//  RegisterViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "RegisterViewController.h"
#import "FirstViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置背景图
    UIImage *kaijiImage = [UIImage imageNamed:@"kaiji1.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:kaijiImage];
    
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
    
    
    UIImage *emailImage = [UIImage imageNamed:@"email_img.png"];
    UIImage *lineImage = [UIImage imageNamed:@"line.png"];
    UIImageView *emailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 40, 45)];
    emailImageView.image = emailImage;
    UIImageView *line0ImageView = [[UIImageView alloc] initWithImage:lineImage];
    UIView *emailLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
    line0ImageView.frame = CGRectMake(40, 10, 1, 30);
    [emailLeftView addSubview:emailImageView];
    [emailLeftView addSubview:line0ImageView];
    
    _emailTextField = [[UITextField alloc] init];
    _emailTextField.frame = CGRectMake(40, 300, 330, 50);
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.placeholder = @"请输入邮箱...";
    _emailTextField.keyboardType = UIKeyboardTypeDefault;
    _emailTextField.leftViewMode = UITextFieldViewModeAlways;
    _emailTextField.leftView = emailLeftView;
    [self.view addSubview:_emailTextField];
    
    UIImage *userImage = [UIImage imageNamed:@"user_img.png"];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    UIView *user_leftView = [[UIView alloc] init];
    user_leftView.frame = CGRectMake(0, 0, 55, 55);
    userImageView.frame = CGRectMake(0, 5, 40, 40);
    lineImageView.frame = CGRectMake(40, 10, 1, 30);
    [user_leftView addSubview:userImageView];
    [user_leftView addSubview:lineImageView];
    
    _userTextField = [[UITextField alloc] init];
    _userTextField.text = _str;
    _userTextField.frame = CGRectMake(40, 360, 330, 50);
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userTextField.placeholder = @"请输入用户名...";
    _userTextField.keyboardType = UIKeyboardTypeDefault;
    //总是显示左侧视图
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    _userTextField.leftView = user_leftView;
    
    [self.view addSubview:_userTextField];
    
    
    UIImage *passImage = [UIImage imageNamed:@"pass_img.png"];
    UIImageView *line2ImageView = [[UIImageView alloc] initWithImage:lineImage];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    UIView *pass_leftView = [[UIView alloc] init];
    passImageView.frame = CGRectMake(0, 5, 40, 40);
    line2ImageView.frame = CGRectMake(40, 10, 1, 30);
    pass_leftView.frame = CGRectMake(0, 0, 55, 55);
    [pass_leftView addSubview:passImageView];
    [pass_leftView addSubview:line2ImageView];
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.frame = CGRectMake(40, 420, 330, 50);
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.placeholder = @"请输入密码...";
    _passTextField.keyboardType = UIKeyboardTypeDefault;
    _passTextField.secureTextEntry = YES;
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    _passTextField.leftView = pass_leftView;
    
    [self.view addSubview:_passTextField];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerButton setTitle:@"确认注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:24];
    registerButton.frame = CGRectMake(140, 520, 140, 50);
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.borderWidth = 2;
    registerButton.layer.cornerRadius = 5;
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    registerButton.tintColor = [UIColor whiteColor];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _emailTextField.delegate = self;
    _userTextField.delegate = self;
    _passTextField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
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
    
    [_emailTextField resignFirstResponder];
    [_userTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
}

-(void)pressRegister {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _emailTextField) {
        [_userTextField becomeFirstResponder];
    } else if (textField == _userTextField) {
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

// 把传进来的block语句块保存到本类的实例变量returnTextBlock （.h中定义的属性）中，然后寻找一个时机调用
- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.passTextField.text);
    }
}

@end
