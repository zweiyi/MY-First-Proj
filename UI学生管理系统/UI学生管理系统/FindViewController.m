//
//  FindViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FindViewController.h"
#import "FindResultViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景all.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(77, [UIScreen mainScreen].bounds.size.height / 3 - 100, 260, 40);
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.tintColor = [UIColor whiteColor];
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _nameTextField.delegate = self;
    [self.view addSubview:_nameTextField];
    
    
    _classTextField = [[UITextField alloc] init];
    _classTextField.frame = CGRectMake(77, [UIScreen mainScreen].bounds.size.height / 3, 260, 40);
    _classTextField.placeholder = @"请输入班级";
    _classTextField.textColor = [UIColor whiteColor];
    _classTextField.tintColor = [UIColor whiteColor];
    _classTextField.layer.borderWidth = 2;
    _classTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _classTextField.delegate = self;
    [self.view addSubview:_classTextField];
    
    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [finishButton setTitle:@"查找" forState:UIControlStateNormal];
    finishButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(findResult) forControlEvents:UIControlEventTouchUpInside];
    finishButton.frame = CGRectMake(90, 350, 60, 30);
    [self.view addSubview:finishButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(200, 350, 60, 30);
    [self.view addSubview:backButton];
    _num = 1;
}

-(void)findResult {
    BOOL ishave = NO;
    
    _studentFindArray = [[NSMutableArray alloc] init];
    
    if (_nameTextField.text.length > 0 && _classTextField.text.length > 0) {
        for (Student *student in _studentArray) {
            if ([student.NameString isEqualToString:_nameTextField.text] && [student.classNameString isEqualToString:_classTextField.text]) {
                [_studentFindArray addObject:student];
                ishave = YES;
                break;
            }
        }
    } else if (_nameTextField.text.length > 0 && _classTextField.text.length == 0) {
        for (Student *student in _studentArray) {
            if ([student.NameString isEqualToString:_nameTextField.text]) {
                ishave = YES;
                [_studentFindArray addObject:student];
               
                break;
            }
        }
    } else if (_classTextField.text.length > 0 && _nameTextField.text.length == 0) {
        for (Student *student in _studentArray) {
            if ([student.classNameString isEqualToString:_classTextField.text]) {
                ishave = YES;
                [_studentFindArray addObject:student];
                
            }
        }
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入信息或者返回" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if (!ishave) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"符合信息的学生不存在" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sureAlertAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:sureAlertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    FindResultViewController *findResultViewController = [[FindResultViewController alloc] init];
    findResultViewController.studentFindArray = _studentFindArray;
    [self presentViewController:findResultViewController animated:YES completion:nil];
}

-(void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameTextField resignFirstResponder];
    [_classTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _nameTextField) {
        [_nameTextField resignFirstResponder];
        [_classTextField becomeFirstResponder];
    } else {
        [_classTextField resignFirstResponder];
    }
    return YES;
}
@end
