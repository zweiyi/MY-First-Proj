//
//  AddViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景all.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    UIImageView *headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@" 非正233.jpg"]];
    headImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:headImageView];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.tintColor = [UIColor whiteColor];
    _nameTextField.frame = CGRectMake(30, 220, 120, 30);
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _nameTextField.delegate = self;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"姓名:";
    nameLabel.frame = CGRectMake(0, 0, 40, 30);
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameLabel;
    
    [self.view addSubview:_nameTextField];
    
    _classTextField = [[UITextField alloc] init];
    _classTextField.textColor = [UIColor whiteColor];
    _classTextField.tintColor = [UIColor whiteColor];
    _classTextField.frame = CGRectMake(170, 220, 120, 30);
    _classTextField.layer.borderWidth = 2;
    _classTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _classTextField.delegate = self;
    
    UILabel *classLabel = [[UILabel alloc] init];
    classLabel.text = @"班级:";
    classLabel.frame = CGRectMake(0, 0, 40, 30);
    _classTextField.leftViewMode = UITextFieldViewModeAlways;
    _classTextField.leftView = classLabel;
    
    [self.view addSubview:_classTextField];
    
    _sexTextField = [[UITextField alloc] init];
    _sexTextField.textColor = [UIColor whiteColor];
    _sexTextField.tintColor = [UIColor whiteColor];
    _sexTextField.frame = CGRectMake(300, 220, 80, 30);
    _sexTextField.layer.borderWidth = 2;
    _sexTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _sexTextField.delegate = self;
    
    UILabel *sexLabel = [[UILabel alloc] init];
    sexLabel.text = @"性别:";
    sexLabel.frame = CGRectMake(0, 0, 40, 30);
    _sexTextField.leftViewMode = UITextFieldViewModeAlways;
    _sexTextField.leftView = sexLabel;
    
    [self.view addSubview:_sexTextField];
    
    _ageTextField = [[UITextField alloc] init];
    _ageTextField.textColor = [UIColor whiteColor];
    _ageTextField.tintColor = [UIColor whiteColor];
    _ageTextField.frame = CGRectMake(90, 270, 80, 30);
    _ageTextField.layer.borderWidth = 2;
    _ageTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _ageTextField.delegate = self;
    
    UILabel *ageLabel = [[UILabel alloc] init];
    ageLabel.text = @"年龄:";
    ageLabel.frame = CGRectMake(0, 0, 40, 30);
    _ageTextField.leftViewMode = UITextFieldViewModeAlways;
    _ageTextField.leftView = ageLabel;
    
    [self.view addSubview:_ageTextField];
    
    _scoreTextField = [[UITextField alloc] init];
    _scoreTextField.textColor = [UIColor whiteColor];
    _scoreTextField.tintColor = [UIColor whiteColor];
    _scoreTextField.frame = CGRectMake(220, 270, 80, 30);
    _scoreTextField.layer.borderWidth = 2;
    _scoreTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _scoreTextField.delegate = self;
    
    UILabel *scoreLabel = [[UILabel alloc] init];
    scoreLabel.text = @"成绩:";
    scoreLabel.frame = CGRectMake(0, 0, 40, 30);
    _scoreTextField.leftViewMode = UITextFieldViewModeAlways;
    _scoreTextField.leftView = scoreLabel;
    
    [self.view addSubview:_scoreTextField];
    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    finishButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(finishAdd) forControlEvents:UIControlEventTouchUpInside];
    finishButton.frame = CGRectMake(90, 370, 60, 30);
    [self.view addSubview:finishButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(220, 370, 60, 30);
    [self.view addSubview:backButton];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

-(void)finishAdd {
    if (_nameTextField.text.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入内容" message:@"重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sureAlertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        BOOL ishave = NO;
        
        Student *student = [[Student alloc] init];
        for (student in _studentArray) {
            if ([_nameTextField.text isEqualToString:student.NameString]) {
                ishave = YES;
                break;
            }
        }
        if (ishave) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"该同学已存在" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:sureAlertAction];
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            _addStudent = [[Student alloc] init];
            _addStudent.NameString = _nameTextField.text;
            _addStudent.classNameString = _classTextField.text;
            _addStudent.age = _ageTextField.text;
            _addStudent.score = _scoreTextField.text;
            _addStudent.sex = _sexTextField.text;
            [_studentArray addObject:_addStudent];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameTextField resignFirstResponder];
    [_sexTextField resignFirstResponder];
    [_ageTextField resignFirstResponder];
    [_classTextField resignFirstResponder];
    [_scoreTextField resignFirstResponder];
}

-(void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _nameTextField) {
        [_nameTextField resignFirstResponder];
        [_classTextField becomeFirstResponder];
    } else if (textField == _classTextField) {
        [_classTextField resignFirstResponder];
        [_sexTextField becomeFirstResponder];
    } else if ( textField == _sexTextField) {
        [_sexTextField resignFirstResponder];
        [_ageTextField becomeFirstResponder];
    } else if (textField == _ageTextField) {
        [_ageTextField resignFirstResponder];
        [_scoreTextField becomeFirstResponder];
    } else {
         [_scoreTextField resignFirstResponder];
    }
    
    return YES;
}
@end
