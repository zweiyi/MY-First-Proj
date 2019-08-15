//
//  MainViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "MainViewController.h"
#import "AllMessageViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "CorrectViewController.h"
#import "FindViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"非正大家庭.jpg"]];
    backImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:backImageView];
    
    //设置导航栏透明
    [self.navigationController.navigationBar setTranslucent:true];
    //把背景设为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //处理导航栏有条线的问题
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    //设置导航栏字体的颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UILabel *welcomLabel = [[UILabel alloc] init];
    welcomLabel.text = @"欢迎使用，您可真是美丽的butterfly";
    welcomLabel.frame = CGRectMake(10, 250, 400, 50);
    welcomLabel.font = [UIFont boldSystemFontOfSize:24];
    welcomLabel.textColor = [UIColor whiteColor];
//    welcomLabel.textColor = [UIColor colorWithRed:0.50 green:0.25 blue:0.15 alpha:1.0];
    [self.view addSubview:welcomLabel];
    
    UIButton *addStudentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addStudentButton setTitle:@"增加" forState:UIControlStateNormal];
    [addStudentButton addTarget:self action:@selector(newPeopleAdd) forControlEvents:UIControlEventTouchUpInside];
    [addStudentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [addStudent setTitleColor:[UIColor colorWithRed:0.16 green:0 blue:0.49 alpha:1.0] forState:UIControlStateNormal];
    addStudentButton.frame = CGRectMake(60, 450, 100, 30);
    addStudentButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:addStudentButton];
    
    UIButton *delectStudentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [delectStudentButton setTitle:@"删除" forState:UIControlStateNormal];
    delectStudentButton.frame = CGRectMake(220, 450, 100, 30);
    delectStudentButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [delectStudentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [delectStudent setTitleColor:[UIColor colorWithRed:0.16 green:0 blue:0.49 alpha:1.0] forState:UIControlStateNormal];
    [delectStudentButton addTarget:self action:@selector(delectPeople) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delectStudentButton];
    
    UIButton *correctButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    correctButton.frame = CGRectMake(60, 500, 100, 30);
    correctButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [correctButton setTitle:@"修改" forState:UIControlStateNormal];
    [correctButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [correctButton setTitleColor:[UIColor colorWithRed:0.16 green:0 blue:0.49 alpha:1.0] forState:UIControlStateNormal];
    [correctButton addTarget:self action:@selector(correctProple) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:correctButton];
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    findButton.frame = CGRectMake(220, 500, 100, 30);
    findButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [findButton setTitle:@"查找" forState:UIControlStateNormal];
    [findButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [findButton setTitleColor:[UIColor colorWithRed:0.16 green:0 blue:0.49 alpha:1.0] forState:UIControlStateNormal];
    [findButton addTarget:self action:@selector(findPeople) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findButton];
    
    UIImageView *graduationImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景图.jpg"]];
    graduationImageView.frame =  self.view.bounds;
    [self.view insertSubview:graduationImageView atIndex:0];
    
    UIButton *allMessageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    allMessageButton.frame = CGRectMake(140, 400, 140, 30);
    allMessageButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [allMessageButton setTitle:@"查看全部信息" forState:UIControlStateNormal];
    [allMessageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [allMessageButton addTarget:self action:@selector(lookAllMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:allMessageButton];
    
    _studentArray = [[NSMutableArray alloc] init];
    
    Student *student1 = [[Student alloc] init];
    student1.NameString = @"宁大人";
    student1.age = @"18";
    student1.sex = @"男";
    student1.score = @"100";
    student1.classNameString = @"非正4班";
    
    [_studentArray addObject:student1];
    
    Student *student2 = [[Student alloc] init];
    student2.NameString = @"功必扬";
    student2.age = @"18";
    student2.sex = @"男";
    student2.score = @"98";
    student2.classNameString = @"非正1班";
    
    [_studentArray addObject:student2];
    
    Student *student3 = [[Student alloc] init];
    student3.NameString = @"小贝";
    student3.age = @"18";
    student3.sex = @"男";
    student3.score = @"99";
    student3.classNameString = @"非正2班";
    
    [_studentArray addObject:student3];
    
    Student *student4 = [[Student alloc] init];
    student4.NameString = @"钟逸伦";
    student4.age = @"18";
    student4.sex = @"男";
    student4.score = @"100";
    student4.classNameString = @"非正4班";
    
    [_studentArray addObject:student4];
    
}

-(void)lookAllMessage {
    AllMessageViewController *allMessageViewController  = [[AllMessageViewController alloc] init];
    allMessageViewController.studentAllArray = _studentArray;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = barButtonItem;
    barButtonItem.title = @"返回";
    [self.navigationController pushViewController:allMessageViewController animated:YES];
}

-(void)newPeopleAdd {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = barButtonItem;
    barButtonItem.title = @"返回";
    
    AddViewController *addViewController = [[AddViewController alloc] init];
    addViewController.studentArray = _studentArray;
    [self presentViewController:addViewController animated:YES completion:nil];
}

//- (void)viewDidAppear:(BOOL)animated {
//    for (Student *stu in _studentArray) {
//        NSLog(@"%@", stu.NameString);
//    }
//}

-(void)delectPeople {
    DeleteViewController *deleteViewController = [[DeleteViewController alloc] init];
    deleteViewController.studentArray = _studentArray;
    [self presentViewController:deleteViewController animated:YES completion:nil];
    
}

-(void)correctProple {
    CorrectViewController *correctViewController = [[CorrectViewController alloc] init];
    correctViewController.studentArray = _studentArray;
    [self presentViewController:correctViewController animated:YES completion:nil];
}

-(void)findPeople {
    FindViewController *findViewController = [[FindViewController alloc] init];
    findViewController.studentArray = _studentArray;
    [self presentViewController:findViewController animated:YES completion:nil];
}
@end
