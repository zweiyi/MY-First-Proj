//
//  BegingShowViewController.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "BegingShowViewController.h"
#import "ViewController.h"

@interface BegingShowViewController ()

@end

@implementation BegingShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backgroundimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"非正3.jpg"]];
    backgroundimageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundimageView atIndex:0];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(90, 30, 300, 50);
    nameLabel.font = [UIFont boldSystemFontOfSize:24];
    nameLabel.text = @"非正版学生管理系统";
    nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:nameLabel];
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.frame = CGRectMake(10, 80, 120, 20);
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.text = @"Come on baby";
    [self.view addSubview:leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.frame = CGRectMake(280, 80, 120, 20);
    rightLabel.text = @"Let's go party";
    rightLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:rightLabel];
    [self performSelector:@selector(nextController) withObject:self afterDelay:3];
}


-(void)nextController {
    ViewController *viewController = [[ViewController alloc] init];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
