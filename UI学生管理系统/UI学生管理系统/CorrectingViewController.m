//
//  CorrectingViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "CorrectingViewController.h"

@interface CorrectingViewController ()

@end

@implementation CorrectingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"增加背景.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.textColor = [UIColor blackColor];
    _nameTextField.tintColor = [UIColor blackColor];
    _nameTextField.frame = CGRectMake(107, 200, 200, 30);
    _nameTextField.text = _str;
    _nameTextField.enabled = NO;
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _nameTextField.delegate = self;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"姓名:";
    nameLabel.frame = CGRectMake(0, 0, 40, 30);
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameLabel;
    
    [self.view addSubview:_nameTextField];
//
//    _classTextField = [[UITextField alloc] init];
//    _classTextField.textColor = [UIColor blackColor];
//    _classTextField.tintColor = [UIColor blackColor];
//    _classTextField.frame = CGRectMake(170, 200, 120, 30);
//    _classTextField.layer.borderWidth = 2;
//    _classTextField.layer.borderColor = [UIColor blackColor].CGColor;
//    _classTextField.delegate = self;
//
//    UILabel *classLabel = [[UILabel alloc] init];
//    classLabel.text = @"班级:";
//    classLabel.frame = CGRectMake(0, 0, 40, 30);
//    _classTextField.leftViewMode = UITextFieldViewModeAlways;
//    _classTextField.leftView = classLabel;
//
//    [self.view addSubview:_classTextField];
//
//    _sexTextField = [[UITextField alloc] init];
//    _sexTextField.textColor = [UIColor blackColor];
//    _sexTextField.tintColor = [UIColor blackColor];
//    _sexTextField.frame = CGRectMake(300, 200, 80, 30);
//    _sexTextField.layer.borderWidth = 2;
//    _sexTextField.layer.borderColor = [UIColor blackColor].CGColor;
//    _sexTextField.delegate = self;
//
//    UILabel *sexLabel = [[UILabel alloc] init];
//    sexLabel.text = @"性别:";
//    sexLabel.frame = CGRectMake(0, 0, 40, 30);
//    _sexTextField.leftViewMode = UITextFieldViewModeAlways;
//    _sexTextField.leftView = sexLabel;
//
//    [self.view addSubview:_sexTextField];
//
//    _ageTextField = [[UITextField alloc] init];
//    _ageTextField.textColor = [UIColor blackColor];
//    _ageTextField.tintColor = [UIColor blackColor];
//    _ageTextField.frame = CGRectMake(90, 250, 80, 30);
//    _ageTextField.layer.borderWidth = 2;
//    _ageTextField.layer.borderColor = [UIColor blackColor].CGColor;
//    _ageTextField.delegate = self;
//
//    UILabel *ageLabel = [[UILabel alloc] init];
//    ageLabel.text = @"年龄:";
//    ageLabel.frame = CGRectMake(0, 0, 40, 30);
//    _ageTextField.leftViewMode = UITextFieldViewModeAlways;
//    _ageTextField.leftView = ageLabel;
//
//    [self.view addSubview:_ageTextField];
    
    _scoreTextField = [[UITextField alloc] init];
    _scoreTextField.textColor = [UIColor blackColor];
    _scoreTextField.tintColor = [UIColor blackColor];
    _scoreTextField.frame = CGRectMake(107, 250, 200, 30);
    _scoreTextField.layer.borderWidth = 2;
    _scoreTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _scoreTextField.delegate = self;
    
    UILabel *scoreLabel = [[UILabel alloc] init];
    scoreLabel.text = @"成绩:";
    scoreLabel.frame = CGRectMake(0, 0, 40, 30);
    _scoreTextField.leftViewMode = UITextFieldViewModeAlways;
    _scoreTextField.leftView = scoreLabel;
    
    [self.view addSubview:_scoreTextField];
    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    finishButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [finishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(correctScore) forControlEvents:UIControlEventTouchUpInside];
    finishButton.frame = CGRectMake(107, 350, 60, 30);
    [self.view addSubview:finishButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(247, 350, 60, 30);
    [self.view addSubview:backButton];
    
}

-(void)correctScore {
    for (Student *stu in _studentArray) {
        if ([stu.NameString isEqualToString:_str]) {
            stu.score = _scoreTextField.text;
        }
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请确认是否修改该信息" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:sureAlertAction];
    [alertController addAction:cancleAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_scoreTextField resignFirstResponder];
}

-(void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
